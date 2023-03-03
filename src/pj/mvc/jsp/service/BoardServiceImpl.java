package pj.mvc.jsp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import page.Paging;
import pj.mvc.jsp.dao.BoardDAO;
import pj.mvc.jsp.dao.BoardDAOImpl;
import pj.mvc.jsp.dto.BoardDTO;

public class BoardServiceImpl implements BoardService{

	@Override	// 게시글 목록
	public void boardListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("[ BoardServiceImpl boardListAction: 게시글 목록 ]");
		
		// ***** 3단계 화면으로부터 입력받은 값을 받는다
		String pageNum = req.getParameter("pageNum");
		
		// ****** 4단계. 싱글톤 방식으로 dao객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		Paging paging = new Paging(pageNum);
		
		// ***** 5-1 단계. 전체 게시글 갯수 카운트
		int total = dao.boardCnt();
		System.out.println("total ==> " + total);

		paging.setTotalCount(total);
		
		// ***** 5-2단계 . 게시글 목록 조회
		int start = paging.getStartRow();		//페이지별 시작번호
		int end = paging.getEndRow();			//페이지별 끝번호
		System.out.println("start =====>" + start);
		System.out.println("end =====>" + end);
		
		List<BoardDTO> list = dao.boardList(start,end);
		
		// ***** 6단계. jsp로 처리 결과 전달(속성전달)
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
	}

	@Override	// 게시글 상세페이지 ==>  조회수 증가 같이 처리
	public void boardDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("[ BoardServiceImpl  boardDetailAction: 게시글 상세페이지 ]");
		// ***** 3단계 화면으로부터 입력받은 값을 받는다
		int num = Integer.parseInt(req.getParameter("num"));
		
		// ****** 4단계. 싱글톤 방식으로 dao객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// ***** 5-1단계 조회수 증가
		dao.plusReadCnt(num);
		
		// ***** 5-2단계  게시글 상세페이지
		BoardDTO dto = dao.getBoardDetail(num);
		
		// ***** 6단계. jsp로 처리 결과 전달(속성전달)
		req.setAttribute("dto", dto);

		
	}

	@Override	// 수정 삭제시 비밀번호 인증
	public String password_chkAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("[ BoardServiceImpl  password_chkAction: 수정 삭제시 비밀번호 인증]");
		// ***** 3단계 화면으로부터 입력받은 값 or hidden값을 받는다
		int num = Integer.parseInt(req.getParameter("num"));
		String password = req.getParameter("password");
		
		System.out.println("글번호 : " +num +" , 비밀번호 : " +password);
		
		// ****** 4단계. 싱글톤 방식으로 dao객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// ***** 5-1단계.  게시글 수정 삭제시 비밀번호 인증
		String result = dao.password_chk(num, password);
		BoardDTO dto = null;
		
		if(result !=null) {		//인증 성공
			//5-2단계
			dto = dao.getBoardDetail(num);
		}
		
		// ***** 6단계. jsp로 처리 결과 전달(속성전달)
		req.setAttribute("dto", dto);
		
		return result;
	}

	@Override	// 게시판 수정처리
	public void boardUpdate(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("[ BoardServiceImpl  boardUpdate: 게시판 수정처리]");
		// ***** 3단계 화면으로부터 입력받은 값 or hidden값을 받는다
		//dto 생성
		BoardDTO dto = new BoardDTO();
		int num = Integer.parseInt(req.getParameter("num"));
		String password = req.getParameter("password");
		String content = req.getParameter("content");
		String title = req.getParameter("title");
		
		// ****** 4단계. 싱글톤 방식으로 dao객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();

		// ***** 5단계. 업데이트 처리 후 list로 이동
		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPassword(password);
		
		dao.updateBoard(dto);
		
		// ***** 6단계. jsp로 처리 결과 전달(속성전달)

	}

	@Override	// 게시판 삭제처리
	public void deleteAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("[ BoardServiceImpl  deleteAction: 게시판 삭제처리]");
		
		// ***** 3단계  hidden값을 받는다
		int num = Integer.parseInt(req.getParameter("num"));

		// ****** 4단계. 싱글톤 방식으로 dao객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();

		// ***** 5단계 삭제처리
		dao.deleteBoard(num);

	}

	@Override	// 글쓰기 처리
	public void boardInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

	}

	@Override	// 댓글작성 처리
	public void commentAddAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

	}

	@Override	// 댓글목록 
	public void commentListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

	}

}
