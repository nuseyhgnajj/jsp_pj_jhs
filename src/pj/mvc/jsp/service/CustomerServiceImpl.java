package pj.mvc.jsp.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pj.mvc.jsp.dao.CustomerDAO;
import pj.mvc.jsp.dao.CustomerDAOImpl;
import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerServiceImpl implements CustomerService{

	@Override	// id �ߺ�Ȯ�� ó��
	public void idConfirmAction(HttpServletRequest req, HttpServletResponse res) 
		 throws ServletException, IOException{
		System.out.println("[ CustomerServiceImpl idConfirmAction: id �ߺ�Ȯ��  ó�� ]");
		
		// ***** 3�ܰ� ȭ�����κ��� �Է¹��� ���� �޴´�
		String strId = req.getParameter("id");
		
		// ****** 4�ܰ�. �̱��� ������� dao��ü ����, ������ ����
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		
		// ***** 5�ܰ� . �ߺ�Ȯ��ó�� 
		int selectCnt = dao.idCheck(strId);
		
		// ***** 6�ܰ�. jsp�� ó�� ��� ����(�Ӽ�����) => setAttribute("�Ӽ���", ��); 
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("id", strId);
	
	}

	@Override 	// ȸ������ ó��
	public void signInAction(HttpServletRequest req, HttpServletResponse res)
		 throws ServletException, IOException{
		
		System.out.println("[ CustomerServiceImpl signInAction: ȸ������ ó�� ]");
		// ***** 3�ܰ� ȭ�����κ��� �Է¹��� ���� �޴´�
		//DTO ����
		//setter
		CustomerDTO dto = new CustomerDTO();
		dto.setId(req.getParameter("id"));
		dto.setPassword(req.getParameter("password"));
//		//��й�ȣ Ȯ��
//		dto.setPassword(req.getParameter("repassword"));
//		String repassword = req.getParameter("repassword");
		dto.setName(req.getParameter("name"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setAddress(req.getParameter("address"));
		//�ڵ����� �ʼ��� �ƴϹǷ� null���� ���� �� �����Ƿ� ���� ������ ���� �޾ƿ´�
		String hp = "";
		String hp1 = req.getParameter("phone1");
		String hp2 = req.getParameter("phone2");
		String hp3 = req.getParameter("phone3");
		if(!hp1.equals("")&&!hp2.equals("")&&!hp3.equals("")) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		dto.setHp(hp);
		//�̸���
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		email = email1 + "@" + email2 ;
		dto.setEmail(email);
		
		//regDate�� �Է°��� ������ default�� sysdate�� ��������, �Ʒ� ������ ���� ���� �����ϴ� ���
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));

		// ****** 4�ܰ�. �̱��� ������� dao��ü ����, ������ ����
		// CustomerDAOImpl insertCustomer()
		// CustomerDAO (�������̽�)  ==> CustomerDAOImpl()
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// ***** 5�ܰ� . ȸ������ó�� 
		int insertCnt = dao.insertCustomer(dto);				//insertCustomer(dto)�� ���� Ÿ���� int�̹Ƿ� ������ ����ش�
		
		System.out.println(" ====>> CustomerServiceImpl signInAction insertCnt >> " + insertCnt);
		
		// ***** 6�ܰ�. jsp�� ó�� ��� ����(�Ӽ�����) => setAttribute("�Ӽ���", ��); 
		req.setAttribute("insertCnt", insertCnt);			// object������ ��ȯ ==> getAttribute()���� type�����ؾ���
															//��ȯ�� getAttribute ~> joinAction.jsp���� <% %> �� ��
		
	
	}

	@Override	// �α��� ó��
	public void loginAction(HttpServletRequest req, HttpServletResponse res) 
		 throws ServletException, IOException{
		System.out.println("[ CustomerServiceImpl loginAction:  �α��� ó�� ]");
		
		// ***** 3�ܰ� ȭ�����κ��� �Է¹��� ���� �޴´�
		String strId = req.getParameter("id");
		String strPassword = req.getParameter("password");
		
		// ****** 4�ܰ�. �̱��� ������� dao��ü ����, ������ ����
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// ***** 5�ܰ� . �α��� ó��
		int selectCnt = dao.idPasswordChk(strId, strPassword);
		
		
		// �α��� ������ ����ID ����
		if(selectCnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", strId);
			// ���ٷ� ->	req.getSession().setAttribute("sessionID",	strId); 
			
		}
		// ***** 6�ܰ�. jsp�� ó�� ��� ����(�Ӽ�����) => setAttribute("�Ӽ���", ��); 
		// req.setAttribute("selectCnt", selectCnt);	~> �������θ� �α��� �Ǵ�
		
	}

	@Override	// ȸ������ ���� �� Ż�� ó��
	public void deleteCustomerActioin(HttpServletRequest req, HttpServletResponse res) 
		 throws ServletException, IOException{
		System.out.println("[ CustomerServiceImpl deleteCustomerActioin:  ȸ������ ���� �� Ż�� ó�� ]");
		
		// ***** 3�ܰ� ȭ�����κ��� �Է¹��� ���� �޴´�
		String strId = (String)req.getSession().getAttribute("sessionID");
		String strPassword = req.getParameter("password");
		
		// ****** 4�ܰ�. �̱��� ������� dao��ü ����, ������ ����
		CustomerDAO dao = CustomerDAOImpl.getInstance();
			
		//**** 5�ܰ� ȸ������ ���� �� Ż��ó��
		// ***** 5.1�ܰ� . ȸ������ ����
		int selectCnt = dao.idPasswordChk(strId, strPassword);
		int deleteCnt = 0;
		//  ***** 5.2�ܰ� . Ż�� ó��
		if(selectCnt == 1) {
			// Ż��ó�� ����
			deleteCnt = dao.deleteCustomer(strId);
		}
		// ***** 6�ܰ�. jsp�� ó�� ��� ����(�Ӽ�����) => setAttribute("�Ӽ���", ��); 
		req.setAttribute("deleteCnt", deleteCnt);
	}
	

	@Override	// ȸ������ ���� �� �� ������ (�������� : ������ ����)
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res) 
		 throws ServletException, IOException{
		System.out.println("[ CustomerServiceImpl modifyDetailAction:  ȸ������ ���� �� �� ������ (�������� : ������ ����) ]");
		
		// ***** 3�ܰ� ȭ��, �������κ��� �Է¹��� ���� �޴´�
		String strId = (String)req.getSession().getAttribute("sessionID");
		String strPassword = req.getParameter("password");
		
		// ****** 4�ܰ�. �̱��� ������� dao��ü ����, ������ ����
		CustomerDAO dao = CustomerDAOImpl.getInstance();
			
		//**** 5�ܰ� ȸ������ ���� �� ����ó��
		// ***** 5.1�ܰ� . ȸ������ ����
		int selectCnt = dao.idPasswordChk(strId, strPassword);
		
		CustomerDTO dto = null;
		//  ***** 5.2�ܰ� . ���� ó��
		if(selectCnt == 1) {
			dto = dao.getCustomerDetail(strId);
		}
		
		// ***** 6�ܰ�. jsp�� ó�� ��� ����(�Ӽ�����) => setAttribute("�Ӽ���", ��); 
		req.setAttribute("dto", dto);
		req.setAttribute("selectCnt", selectCnt);
	}

	@Override	// ȸ������ ���� ó��
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res) 
		 throws ServletException, IOException{
		System.out.println("[ CustomerServiceImpl modifyCustomerAction:  ȸ������ ���� ó�� ]");
		
		// ***** 3 dto����
		CustomerDTO dto = new CustomerDTO();
		dto.setId((String)req.getParameter("sessinID"));
		dto.setPassword(req.getParameter("password"));
		dto.setName(req.getParameter("name"));
		dto.setAddress(req.getParameter("address"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		
		String hp = "";
		String hp1 = req.getParameter("phone1");
		String hp2 = req.getParameter("phone2");
		String hp3 = req.getParameter("phone3");
		if(!hp1.equals("")&&!hp2.equals("")&&!hp3.equals("")) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		dto.setHp(hp);
		
		//�̸���
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		email = email1 + "@" + email2 ;
		dto.setEmail(email);
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		//3-2 ȭ������ ���� ���� �޾� dto�� ��´�
		dto = (CustomerDTO) req.getAttribute("dto");
		
		// ****** 4�ܰ�. �̱��� ������� dao��ü ����, ������ ����
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		//**** 5�ܰ� ����ó��
		int updateCnt = dao.updateCustomer(dto);
		
		//  ***** 6�ܰ� jsp�� ó�� ��� ���� 
		req.setAttribute("updateCnt", updateCnt);
		
	}

}
