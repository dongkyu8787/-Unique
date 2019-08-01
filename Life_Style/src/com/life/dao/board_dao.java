package com.life.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.life.dto.board_dto;

public class board_dao extends board_sqlmap {
	private String namespace = "com.life.db.boardmapper.";

	public List<board_dto> selectlist() {

		SqlSession session = null;
		List<board_dto> list = new ArrayList<board_dto>();

		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;

	}

	public board_dto selectone(int board_no_seq) {

		SqlSession session = null;
		board_dto dto = new board_dto();

		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "selectone", board_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}

	public int update(board_dto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "update", dto);

			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}

	public int delete(int board_no_seq) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession();
			res = session.delete(namespace + "delete", board_no_seq);

			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}

	public int insert(board_dto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession();
			res = session.delete(namespace + "insert", dto);

			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int updateviewnum(board_dto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "viewnum", dto);

			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int totalnum() {
		SqlSession session = null;
		int totalnum = 0;

		try {
			session = getSqlSessionFactory().openSession();
			totalnum = session.selectOne(namespace + "totalnum");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return totalnum;
	}

	public int insertAS(board_dto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace + "insertAS", dto);

			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}
	
	

	public int updateAS(int board_no_seq) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "updateAS", board_no_seq);

			if (res > 0) {
				session.commit();
			} else {
				session.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}

}
