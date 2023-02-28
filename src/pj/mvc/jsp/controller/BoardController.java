package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }
    //1단계 웹브라우저가 전송한 http 요청받음
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		action(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doGet(req, res);
	}
	
	public void action(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {
		
		//한글 안깨지게 처리
		req.setCharacterEncoding("utf-8");
		String viewPage = "";
		
		//2단계 요청분석
		String uri = req.getRequestURI();								
		String contextPath = req.getContextPath();  				
		String url = uri.substring(contextPath.length());			
		
// 첫페이지	========= 게시판 ===============
		// 게시글 목록
		if(url.equals("/*.bo")||url.equals("/board_list.bo")) {
			System.out.println("컨트롤러 실행 >> url ) board_list.bo 로 이동");
			
			viewPage = "admin/csCenter/board_list.jsp";
		}
		
		// 상세페이지
		
		
		// 수정 삭제시 비밀번호 인증
		
		
		// 게시판 수정처리
		
		
		// 게시판 삭제처리
		
		
		// 글쓰기 화면
		
		
		// 글쓰기 처리
		
		
		//
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req,res);
	}

}