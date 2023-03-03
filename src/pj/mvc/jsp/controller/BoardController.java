package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.BoardServiceImpl;

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
		BoardServiceImpl service = new BoardServiceImpl();
		
		//2단계 요청분석
		String uri = req.getRequestURI();								
		String contextPath = req.getContextPath();  				
		String url = uri.substring(contextPath.length());			
		
		//	========= 게시판 ===============
		// 게시글 목록	// 첫페이지
		if(url.equals("/*.bo")||url.equals("/board_list.bo")) {
			System.out.println(">>> 컨트롤러 실행 url ) board_list.bo 로 이동  <<<");
			
			service.boardListAction(req, res);
			viewPage = "admin/csCenter/board_list.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req,res);
		}
		
		// 게시글 상세페이지 		// 글제목을 클릭할 때 들어감
		else if(url.equals("/board_detailAction.bo")) {
			System.out.println(">>> 컨트롤러 실행 url ) board_detailAction.bo 로 이동  <<<");
			
			service.boardDetailAction(req,res);
			viewPage = "admin/csCenter/board_detailAction.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req,res);
		}
		
		// 게시글 수정 삭제시 비밀번호 인증
		else if(url.equals("/password_chkAction.bo")) {
			System.out.println(">>> 컨트롤러 실행 url )password_chkAction.bo 로 이동  <<<");
			
			String result = service.password_chkAction(req,res);
			
			
			if(result !=null) {
				viewPage = "admin/csCenter/board_edit.jsp";
				
				RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
				dispatcher.forward(req,res);
			}
			else {
				System.out.println("!! 비번 불일치 !!");
				int num = Integer.parseInt(req.getParameter("num"));
				viewPage = req.getContextPath() + "/board_detailAction.bo?num=" + num + "&message=error";
				res.sendRedirect(viewPage);
			}
		}
		
		// 게시판 수정처리
		else if (url.equals("/board_UpdateAction.bo")) {
			System.out.println(">>> 컨트롤러 실행 url )board_UpdateAction.bo 로 이동  <<<");
			
			service.boardUpdate(req, res);
			viewPage = req.getContextPath() +"/board_list.bo";
		
			res.sendRedirect(viewPage);
		}
		
		
		// 게시판 삭제처리
		else if (url.equals("/board_DeleteAction.bo")) {
			System.out.println(">>> 컨트롤러 실행 url )board_DeleteAction.bo 로 이동  <<<");
			
			service.deleteAction(req, res);
			viewPage = req.getContextPath() +"/board_list.bo";
		
			res.sendRedirect(viewPage);
		}
		
		// 글쓰기 화면
		
		
		// 글쓰기 처리
		
		
		//
		
		
	}

}