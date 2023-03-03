package pj.mvc.jsp.dao;

import java.util.List;


import pj.mvc.jsp.dto.BoardDTO;

public interface BoardDAO {
	
	
	
	
	
	// 게시글 목록
	public List<BoardDTO> boardList(int start, int end);
	
	// 게시글 갯수 구하기
	public int boardCnt();
	
	// 조회수 증가
	public void plusReadCnt(int num);
	
	// 게시글 상세페이지
	public BoardDTO getBoardDetail(int num);
	
	
	// 수정 삭제시 비밀번호 인증
	public String password_chk(int num, String password);
	
	
	
	// 게시판 수정처리
	public void updateBoard(BoardDTO dto);
	
	
	// 게시판 삭제처리
	public void deleteBoard(int num);
	
	// 글쓰기 처리
	public void insertBoard(BoardDTO dto);
	
	
	// 댓글작성 처리
	//public void commentInsert(Board)
	
	
	// 댓글목록 
	//
	
	
	
	
	
	
}
