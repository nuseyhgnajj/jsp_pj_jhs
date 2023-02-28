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
	// 커넥션풀 객체를 보관
	DataSource dataSource;
	
	//디폴트 생성자 --> private:  new 생성 안됨 ~~> 다른곳에서 호출 시 싱글톤 방식으로 구현 
	private CustomerDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jsp_pj_126");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 싱글톤 적용
	private static CustomerDAOImpl instance = new CustomerDAOImpl();
	public static CustomerDAOImpl getInstance() {
		if(instance == null) {
			instance = new CustomerDAOImpl();
		}
		return instance;
	}

	@Override	// id 중복확인 처리
	public int idCheck(String strId) {
		System.out.println("====>> CustomerDAOImpl idCheck dao : id 중복확인 처리");
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

	@Override	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("====>> CustomerDAOImpl insertCustomer dao : 회원가입 처리");
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
			
			// 쿼리 실행 => executeUpdate()   ==> int형 -> 성공 1 실패 0 반환
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

	@Override	// 로그인 처리	// 회원정보 인증( 수정, 탈퇴 )
	public int idPasswordChk(String strId, String strPassword) {
		System.out.println("====>> CustomerDAOImpl idPasswordChk dao : 로그인 처리");
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
			
			//쿼리실행
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

	@Override	// 회원정보 인증 및 탈퇴 처리
	public int deleteCustomer(String strId) {
		System.out.println("====>> CustomerDAOImpl deleteCustomer dao : 회원정보 인증 및 탈퇴 처리");
		int deleteCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="DELETE FROM mvc_customer_tbl WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);

			//쿼리실행
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

	@Override	// 회원정보 인증 및 상세 페이지 (상세페이지 : 수정을 위한)'
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("====>> CustomerDAOImpl getCustomerDetail: 회원정보 인증 및 상세 페이지");
		
		int selectCnt = 0;
		// 1.정보를 담을 CustomerDTO 바구니 생성
		CustomerDTO dto = new CustomerDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			// 2.strId (로그인 화면에서 입력받은 세션 아이디)와 일치하는 데이터가 있는지 조회해주세용
			String sql ="SELECT * FROM mvc_customer_tbl WHERE id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			//쿼리실행
			rs = pstmt.executeQuery();
			
			// 3. ResultSet에서 id와 일치하는 한 사람의 회원정보가 존재하나요? 존재하면!  밑에 실행해주세요
			if(rs.next()) {
				// ResultSet을 읽어서 CustomerDTO에 setter로 담아줍니다
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
		return dto;	//리턴값 복수개 setter, getter
	}

	@Override	// 회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("====>> CustomerDAOImpl updateCustomer: 회원정보 수정 처리");
		
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
			
			//쿼리실행
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
