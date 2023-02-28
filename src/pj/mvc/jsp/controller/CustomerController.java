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
       
	// ***** 1�ܰ� | ���������� ��û ����
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
		//�ѱ� �ȱ����� ó��
		req.setCharacterEncoding("utf-8");
		
		// ***** 2�ܰ� | ��û�м�
		//http://localhost/jsp_pj_126/*.do
		String uri = req.getRequestURI();							// uri ~> /jsp_pj_126/*.do	
		String contextPath = req.getContextPath();  				// contextPath ~>  /jsp_pj_126 ==> ������
		String url = uri.substring(contextPath.length());			// uri���� contextPath�� ���̸�ŭ ���ش� ==> /*.do
		
		//ù������
		if(url.equals("/*.do")||url.equals("/main.do")) {
			System.out.println("####  url : /main.do ####  ");
			viewPage = "common/main.jsp";
		}
		
// --------- [ ȸ������ ] ----------
		//ȸ������ ������
		else if(url.equals("/join.do")) {
			System.out.println("####  url : /join.do ####");
			viewPage = "customer/join/join.jsp";
		}
		// ���̵� �ߺ�Ȯ�� ó��
		else if(url.equals("/idConfirmAction.do")){
			System.out.println("####  url : /idConfirmAction.do ####");
			service.idConfirmAction(req, res);
			viewPage = "customer/join/idConfirmAction.jsp";
		}
		//ȸ������ ó��
		else if(url.equals("/joinAction.do")) {
			System.out.println("#### url : /joinAction.do #### ");
			service.signInAction(req, res);		
			viewPage = "customer/join/joinAction.jsp";
		}
		
// ----------- [ �α��� ] ------------
		// �α���ȭ��
		else if(url.contentEquals("/login.do")) {
			System.out.println("#### url : /login.do #### ");
			viewPage = "customer/login/login.jsp";
		}
		// �α��� ó��
		else if(url.contentEquals("/loginAction.do")) {
			System.out.println("#### url : /loginAction.do #### ");
			service.loginAction(req, res);
			
			viewPage = "customer/login/loginAction.jsp";
		}
		//�α׾ƿ� ó��
		else if(url.contentEquals("/logout.do")) {
			System.out.println("#### url : /logout.do #### ");
			req.getSession().invalidate();			//���� ����		
			
			viewPage = "common/main.jsp";
		}
		//================ [ ȸ��Ż�� ] =====================
		//ȸ��Ż�� ȭ�� 
		//deleteCustomer.do
		else if(url.contentEquals("/deleteCustomer.do")){
			System.out.println("#### url : /deleteCustomer.do #### ");		
			
			viewPage = "customer/mypage/customerInfo/deleteCustomer.jsp";
		}
		//ȸ��Ż�� ó��
		else if(url.contentEquals("/deleteCustomerAction.do")){
			System.out.println("#### url : /deleteCustomerAction.do #### ");		
			service.deleteCustomerActioin(req, res);
			
			viewPage = "customer/mypage/customerInfo/deleteCustomerAction.jsp";
		}
		
		// =================== [ ȸ������ ] ======================
		// ȸ������ ����ȭ��
		else if(url.equals("/modifyCustomer.do")){
			System.out.println("#### url : /modifyCustomer.do #### ");		
			
			viewPage = "customer/mypage/customerInfo/modifyCustomer.jsp";
		}
		
		// ȸ������ ��������
		else if(url.equals("/modifyDetailAction.do")){
			System.out.println("#### url : /modifyDetailAction.do #### ");		
			service.modifyDetailAction(req, res);
			
			viewPage = "customer/mypage/customerInfo/modifyDetailAction.jsp";
		}
		
		// ȸ������ ���� ó�� modifyCustomerAction.do
		else if(url.equals("/modifyCustomerAction.do")){
			System.out.println("#### url : /modifyCustomerAction.do #### ");		
			service.modifyCustomerAction(req, res);
			
			viewPage = "customer/mypage/customerInfo/modifyCustomerAction.jsp";
		}
		//RequestDispatcher : ���� or jsp ��û�� ���� �� , �ٸ� ������Ʈ�� ��û�� �����ϴ� Ŭ����
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		//������ �̵� -- forward : url�� �ٲ��� ����
		dispatcher.forward(req, res); 
		
	}
}
