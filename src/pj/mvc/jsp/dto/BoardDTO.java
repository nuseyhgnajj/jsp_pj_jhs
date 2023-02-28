package pj.mvc.jsp.dto;

import java.sql.Date;

//게시판
public class BoardDTO {
	private int num;			//글번호
	private String title;		//글제목
	private String content;		//글내용
	private String writer;		//작성자
	private String password;	//수정, 삭제용 비밀번호
	private int readCnt;		//조회수
	private Date regDate;		//등록일			DATE --> sql 타입으로 import
	private int comment_count;	//댓글 갯수
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getComment_count() {
		return comment_count;
	}
	
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
	
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", password=" + password + ", readCnt=" + readCnt + ", regDate=" + regDate + ", comment_count="
				+ comment_count + "]";
	}
	
	
}




/*
CREATE TABLE mvc_board_tbl(
    num           	NUMBER(7) 		PRIMARY KEY,   	-- 	글번호
    title			VARCHAR2(50) 	NOT NULL,   	--	글제목
    content			CLOB 			NOT NULL,   	--	글내용
    writer         	VARCHAR2(30) 	NOT NULL,      	--	작성자
    password		VARCHAR2(30) 	NOT NULL,      	--	수정, 삭제용 비밀번호
    readCnt			NUMBER(6)		DEFAULT 0,		--  조회수
    regDate       	TIMESTAMP 		DEFAULT sysdate -- 	작성일
);
*/