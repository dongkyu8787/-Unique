package com.life.biz;

import java.util.List;

import com.life.dao.board_dao;
import com.life.dto.board_dto;

public class board_biz {
	private board_dao dao = new board_dao(); 
	
	public List<board_dto> selectlist(){
		return dao.selectlist();
	}
	
	public board_dto selectone(int board_no_seq) {
		return dao.selectone(board_no_seq);
	}
	
	public int update(board_dto dto) {
		return dao.update(dto);
	}
	
	public int delete(int board_no_seq) {
		return dao.delete(board_no_seq);
	}
	
	public int insert(board_dto dto) {
		return dao.insert(dto);
	}
	
	public int updateviewnum(board_dto dto) {
		return dao.updateviewnum(dto);
	}
	public int totalnum() {
		return dao.totalnum();
	}
	
	 public int insertAS(board_dto dto) {
		 return dao.insertAS(dto);
	 }
	 
	 public int updateAS(int board_no_seq) {
		 
		 return dao.updateAS(board_no_seq);
	 }
	 
	 
}
