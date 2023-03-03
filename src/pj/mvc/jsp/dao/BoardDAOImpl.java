package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.BoardDTO;

public class BoardDAOImpl implements BoardDAO{
	//커넥션 풀 객체를 보관
	DataSource dataSource;
	
	//디폴트 생성자 --> private:  new 생성 안됨 ~~> 다른곳에서 호출 시 싱글톤 방식으로 구현 
	private BoardDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jsp_pj_126");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
		
	//싱글톤 방식 : 객체를 한번만 생성
	private static BoardDAOImpl instance = new BoardDAOImpl();
	
	public static BoardDAOImpl getInstance() {
		if(instance == null) {
			instance = new BoardDAOImpl();
		}
		return instance;
	}
	
	
	@Override	// 게시글 목록
	public List<BoardDTO> boardList(int start, int end) {
		System.out.println("====>> BoardDAOImpl baordList dao : 게시글 목록");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//1. list 선언 & 생성(큰바구니)
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * " + 
						 "  FROM (" + "SELECT A.*, rownum AS rn" + 
						 "	FROM (	SELECT * FROM mvc_board_tbl" + 
						 "	ORDER BY num DESC) A " + 
						 "	)" + 
						 " WHERE rn BETWEEN ? AND ?";
			System.out.println("sql : " + sql);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				
				do {
					//2. dto생성(작은바구니)
					BoardDTO dto = new BoardDTO();
					
					//3. dto에 1건의 rs게시글 정보를 담는다
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setWriter(rs.getString("writer"));
					dto.setPassword(rs.getString("password"));
					dto.setReadCnt(rs.getInt("readCnt"));
					dto.setRegDate(rs.getDate("regDate"));
					
					//4. list에 dto를 추가한다
					list.add(dto);
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override	// 게시글 갯수 구하기
	public int boardCnt() {
		System.out.println("====>> BoardDAOImpl boardCnt() dao : 게시글 갯수 구하기");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int selectCnt = 0;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT COUNT(*) AS cnt FROM mvc_board_tbl";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				selectCnt = rs.getInt("cnt");
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

	@Override	// 조회수 증가
	public void plusReadCnt(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			String sql = "UPDATE mvc_board_tbl SET readCnt=readCnt+1  WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num );
			
			pstmt.executeQuery();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override	// 게시글 상세페이지 ==> 수정시에도 상세페이지 사용
	public BoardDTO getBoardDetail(int num) {
		System.out.println("====>> BoardDAOImpl getBoardDetail dao : 게시글 상세페이지");
		
		BoardDTO dto = new BoardDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM mvc_board_tbl WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// dto에 1건의 정보를 담는다
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setPassword(rs.getString("password"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setRegDate(rs.getDate("regDate"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	@Override	// 수정 삭제시 비밀번호 인증
	public String password_chk(int num, String password) {
		System.out.println("====>> BoardDAOImpl password_chk dao : 수정 삭제시 비밀번호 인증");
		
		String result = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = new BoardDTO();
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM mvc_board_tbl " + 
						 "WHERE num = ? " + 
						 "AND password = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("password"); 
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override	// 게시판 수정처리
	public void updateBoard(BoardDTO dto) {
		System.out.println("====>> BoardDAOImpl updateBoard dao : 게시판 수정처리");

		Connection conn = null;
		PreparedStatement pstmt = null;

		
		try {
			conn = dataSource.getConnection();
			String sql = "UPDATE mvc_board_tbl SET password = ? , title = ? , content = ? WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPassword() );
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
			
			pstmt.executeQuery();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override	// 게시판 삭제처리
	public void deleteBoard(int num) {
		System.out.println("====>> BoardDAOImpl deleteBoard dao : 게시판 삭제처리");

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			String sql = "DELETE mvc_board_tbl WHERE num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			pstmt.executeQuery();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override	// 글쓰기 처리
	public void insertBoard(BoardDTO dto) {
		
	}

}
