package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO{
	// Ŀ�ؼ�Ǯ ��ü�� ����
	DataSource dataSource;
	
	//����Ʈ ������ --> private:  new ���� �ȵ� ~~> �ٸ������� ȣ�� �� �̱��� ������� ���� 
	private CustomerDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jsp_pj_126");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	// �̱��� ����
	private static CustomerDAOImpl instance = new CustomerDAOImpl();
	public static CustomerDAOImpl getInstance() {
		if(instance == null) {
			instance = new CustomerDAOImpl();
		}
		return instance;
	}

	@Override	// id �ߺ�Ȯ�� ó��
	public int idCheck(String strId) {
		System.out.println("====>> CustomerDAOImpl idCheck dao : id �ߺ�Ȯ�� ó��");
		int selectCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM mvc_customer_tbl WHERE id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,strId);
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				selectCnt = 1;
			}
			System.out.println("selectCnt >> " + selectCnt);

			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return selectCnt;
	}

	@Override	// ȸ������ ó��
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("====>> CustomerDAOImpl insertCustomer dao : ȸ������ ó��");
		Connection conn = null;
		int insertCnt = 0;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="INSERT INTO mvc_customer_tbl(id, password, name, birthday, address, hp, email, regDate)"
						+ " VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2,dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setDate(4,dto.getBirthday());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getHp());
			pstmt.setString(7, dto.getEmail());
			pstmt.setTimestamp(8, dto.getRegDate());
			
			// ���� ���� => executeUpdate()   ==> int�� -> ���� 1 ���� 0 ��ȯ
			insertCnt = pstmt.executeUpdate();	
			System.out.println("insertCnt >> " + insertCnt);

			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return insertCnt;
	}

	@Override	// �α��� ó��	// ȸ������ ����( ����, Ż�� )
	public int idPasswordChk(String strId, String strPassword) {
		System.out.println("====>> CustomerDAOImpl idPasswordChk dao : �α��� ó��");
		int selectCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="SELECT * FROM mvc_customer_tbl WHERE id = ? AND password = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, strId);
			pstmt.setString(2, strPassword);
			
			//��������
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				selectCnt = 1;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return selectCnt;
	}

	@Override	// ȸ������ ���� �� Ż�� ó��
	public int deleteCustomer(String strId) {
		System.out.println("====>> CustomerDAOImpl deleteCustomer dao : ȸ������ ���� �� Ż�� ó��");
		int deleteCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="DELETE FROM mvc_customer_tbl WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);

			//��������
			deleteCnt = pstmt.executeUpdate();
			
			System.out.println("deleteCnt >> "+ deleteCnt);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return deleteCnt;
	}

	@Override	// ȸ������ ���� �� �� ������ (�������� : ������ ����)'
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("====>> CustomerDAOImpl getCustomerDetail: ȸ������ ���� �� �� ������");
		
		int selectCnt = 0;
		// 1.������ ���� CustomerDTO �ٱ��� ����
		CustomerDTO dto = new CustomerDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			// 2.strId (�α��� ȭ�鿡�� �Է¹��� ���� ���̵�)�� ��ġ�ϴ� �����Ͱ� �ִ��� ��ȸ���ּ���
			String sql ="SELECT * FROM mvc_customer_tbl WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			//��������
			rs = pstmt.executeQuery();
			
			// 3. ResultSet���� id�� ��ġ�ϴ� �� ����� ȸ�������� �����ϳ���? �����ϸ�!  �ؿ� �������ּ���
			if(rs.next()) {
				// ResultSet�� �о CustomerDTO�� setter�� ����ݴϴ�
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setBirthday(rs.getDate("birthday"));
				dto.setHp(rs.getString("hp"));
				dto.setEmail(rs.getString("email"));
				dto.setRegDate(rs.getTimestamp("regDate"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;	//���ϰ� ������ setter, getter
	}

	@Override	// ȸ������ ���� ó��
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("====>> CustomerDAOImpl updateCustomer: ȸ������ ���� ó��");
		
		int updateCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="UPDATE TABLE mvc_customer_tbl SET password = ?, name = ?, address = ?, birthday = ?, hp = ?, email = ? regDate = ? WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPassword());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3,dto.getAddress());
			pstmt.setDate(4,dto.getBirthday());
			pstmt.setString(5,dto.getHp());
			pstmt.setString(6,dto.getEmail());
			pstmt.setTimestamp(7, dto.getRegDate());
			pstmt.setString(8,dto.getId());
			
			//��������
			updateCnt = pstmt.executeUpdate();
			
			System.out.println("updateCnt >> "+ updateCnt);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
				
		return updateCnt;
	}

}
