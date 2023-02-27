package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.CustomerServiceImpl;

@WebServlet("*.do")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// ***** 1단계 | 웹브라우저가 요청 받음
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
	throws ServletException, IOException {
		action(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
	throws ServletException, IOException {
		doGet(req, res);
	}
	
	
	public void action(HttpServletRequest req, HttpServletResponse res) 
	throws ServletException, IOException {
		
		String viewPage = "";
		CustomerServiceImpl service = new CustomerServiceImpl();
		//한글 안깨지게 처리
		req.setCharacterEncoding("utf-8");
		
		// ***** 2단계 | 요청분석
		//http://localhost/jsp_pj_126/*.do
		String uri = req.getRequestURI();							// uri ~> /jsp_pj_126/*.do	
		String contextPath = req.getContextPath();  				// contextPath ~>  /jsp_pj_126 ==> 플젝명
		String url = uri.substring(contextPath.length());			// uri에서 contextPath의 길이만큼 빼준다 ==> /*.do
		
		//첫페이지
		if(url.equals("/*.do")||url.equals("/main.do")) {
			System.out.println("####  url : /main.do ####  ");
			viewPage = "common/main.jsp";
		}
		
		// --------- [ 회원가입 ] ----------
		//회원가입 페이지
		else if(url.equals("/join.do")) {
			System.out.println("####  url : /join.do ####");
			viewPage = "customer/join/join.jsp";
		}
		// 아이디 중복확인 처리
		else if(url.equals("/idConfirmAction.do")){
			System.out.println("####  url : /idConfirmAction.do ####");
			service.idConfirmAction(req, res);
			viewPage = "customer/join/idConfirmAction.jsp";
		}
		//회원가입 처리
		else if(url.equals("/joinAction.do")) {
			System.out.println("#### url : /joinAction.do #### ");
			service.signInAction(req, res);		
			viewPage = "customer/join/joinAction.jsp";
		}
		
		// ----------- [ 로그인 ] ------------
		// 로그인화면
		else if(url.contentEquals("/login.do")) {
			System.out.println("#### url : /login.do #### ");
			viewPage = "customer/login/login.jsp";
		}
		// 로그인 처리
		else if(url.contentEquals("/loginAction.do")) {
			System.out.println("#### url : /loginAction.do #### ");
			service.loginAction(req, res);
			
			viewPage = "customer/login/loginAction.jsp";
		}
		//로그아웃 처리
		else if(url.contentEquals("/logout.do")) {
			System.out.println("#### url : /logout.do #### ");
			req.getSession().invalidate();			//세션 삭제		
			
			viewPage = "common/main.jsp";
		}
		//================ [ 회원탈퇴 ] =====================
		//회원탈퇴 화면 
		//deleteCustomer.do
		else if(url.contentEquals("/deleteCustomer.do")){
			System.out.println("#### url : /deleteCustomer.do #### ");		
			
			viewPage = "customer/mypage/customerInfo/deleteCustomer.jsp";
		}
		//회원탈퇴 처리
		else if(url.contentEquals("/deleteCustomerAction.do")){
			System.out.println("#### url : /deleteCustomerAction.do #### ");		
			service.deleteCustomerActioin(req, res);
			
			viewPage = "customer/mypage/customerInfo/deleteCustomerAction.jsp";
		}
		
		// =================== [ 회원수정 ] ======================
		// 회원정보 수정화면
		else if(url.equals("/modifyCustomer.do")){
			System.out.println("#### url : /modifyCustomer.do #### ");		
			
			viewPage = "customer/mypage/customerInfo/modifyCustomer.jsp";
		}
		
		// 회원정보 상세페이지
		else if(url.equals("/modifyDetailAction.do")){
			System.out.println("#### url : /modifyDetailAction.do #### ");		
			service.modifyDetailAction(req, res);
			
			viewPage = "customer/mypage/customerInfo/modifyDetailAction.jsp";
		}
		
		// 회원정보 수정 처리 modifyCustomerAction.do
		else if(url.equals("/ modifyCustomerAction.do")){
			System.out.println("#### url : /modifyCustomerAction.do #### ");		
			service.modifyCustomerAction(req, res);
			
			viewPage = "customer/mypage/customerInfo/modifyCustomerAction.jsp";
		}
		//RequestDispatcher : 서블릿 or jsp 요청을 받은 후 , 다른 컴포넌트로 요청을 위임하는 클래스
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		//페이지 이동 -- forward : url이 바뀌지 않음
		dispatcher.forward(req, res); 
		
	}
}
