package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardServiceImpl implements BoardService{

	@Override	// 게시글 목록
	public void boardListAction(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	@Override	// 상세페이지
	public void boardDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}

	@Override	// 수정 삭제시 비밀번호 인증
	public String password_chkAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		return null;
	}

	@Override	// 게시판 수정처리
	public String boardUpdate(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		return null;
	}

	@Override	// 게시판 삭제처리
	public String deleteAction(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		return null;
	}

	@Override	// 글쓰기 처리
	public String boardInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		return null;
	}

	@Override	// 댓글작성 처리
	public String commentAddAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		return null;
	}

	@Override	// 댓글목록 처리
	public String commentListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		return null;
	}

}
