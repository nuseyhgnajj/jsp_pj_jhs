package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�������̽� : ������Ǽ� , �۾����� (�߻�޼���� ����� ����)
public interface CustomerService {
	// id �ߺ�Ȯ�� ó��
	public void idConfirmAction(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException;
	
	// ȸ������ ó��
	public void signInAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// �α��� ó��	// ȸ������ ����( ����, Ż�� )
	public void loginAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// ȸ������ ���� �� Ż�� ó��
	public void deleteCustomerActioin(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// ȸ������ ���� �� �� ������ (�������� : ������ ����)
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// ȸ������ ���� ó��
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
}
