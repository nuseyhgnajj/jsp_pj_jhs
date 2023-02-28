package pj.mvc.jsp.dto;

import java.sql.Date;
import java.sql.Timestamp;

// DTO 데이터 전송객체 : setter를 통해 값 전달 -> 멤버변수로 전달 받음 -> getter
// 멤버변수 = 컬럼명 = input태그명
public class CustomerDTO {
	private String id;
	private String password;
	private String name;
	private Date birthday;
	private String address;
	private String hp;
	private String email;
	private Timestamp regDate;	//java.sql.Timestamp 시분초 
	
	public CustomerDTO () {}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp1) {
		this.hp = hp1;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}		

	@Override
	public String toString() {
		return "CustomerDTO [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday
				+ ", address=" + address + ", hp=" + hp + ", email=" + email + ", regDate=" + regDate + "]";
	}
	
	
	
}


/*

CREATE TABLE mvc_customer_tbl(
    id            VARCHAR2(20) PRIMARY KEY,   -- ID
    password      VARCHAR2(20) NOT NULL,      -- 비밀번호
    name          varchar2(20) NOT NULL,      -- 이름
    birthday      DATE         NOT NULL,      -- 생년월일
    address       VARCHAR2(50) NOT NULL,      -- 주소
    hp            VARCHAR2(13),               -- 핸드폰
    email         VARCHAR2(50) NOT NULL,      -- 이메일
    regDate       TIMESTAMP DEFAULT sysdate   -- 가입일
);
 
*/