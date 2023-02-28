package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.CustomerDTO;

public interface CustomerDAO {
	// id �ߺ�Ȯ�� ó��
	public int idCheck(String strId);
	
	// ȸ������ ó��
	public int insertCustomer(CustomerDTO dto);
	
	// �α��� ó��	// ȸ������ ����( ����, Ż�� )
	public int idPasswordChk(String strId, String strPassword);
	
	// ȸ������ ���� �� Ż�� ó��
	public int deleteCustomer(String strId);
	
	// ȸ������ ���� �� �� ������ (�������� : ������ ����)'
	public CustomerDTO getCustomerDetail(String strId);
	
	// ȸ������ ���� ó��
	public int updateCustomer(CustomerDTO dto);
}
