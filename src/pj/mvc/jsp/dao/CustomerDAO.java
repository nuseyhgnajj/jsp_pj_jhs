package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.CustomerDTO;

public interface CustomerDAO {
	// id 중복확인 처리
	public int idCheck(String strId);
	
	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	// 로그인 처리	// 회원정보 인증( 수정, 탈퇴 )
	public int idPasswordChk(String strId, String strPassword);
	
	// 회원정보 인증 및 탈퇴 처리
	public int deleteCustomer(String strId);
	
	// 회원정보 인증 및 상세 페이지 (상세페이지 : 수정을 위한)'
	public CustomerDTO getCustomerDetail(String strId);
	
	// 회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
}
