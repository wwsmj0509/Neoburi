package com.board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.board.entity.imgBoard_entity;
import com.board.entity.rec_entity;
import com.login.entity.login_entity;



public class imgBoard_dao {
	
	private static SqlSessionFactory factory;
	
	//Mybatis연결객체 생성--------------------------------------
	static {
		try {
			String resource="mybatis/mybatis-config.xml";
			Reader reader=Resources.getResourceAsReader(resource);
			factory=new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	//board list -----------------------------------------------------------------
	
	public List<imgBoard_entity> getImageBoardList(Map<String, Object> map) {
		SqlSession session=factory.openSession();
		List<imgBoard_entity> list=session.selectList("", map);
		session.close();
		return list;
	}
	
	
	//write -----------------------------------------------------------------
	
	public int boardInsert(imgBoard_entity entity) {
		SqlSession session=factory.openSession();
		int n=0;
		try{
			n=session.insert("mybatis.BoardMapper.boardInsert", entity);
			if(n > 0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return n;
	}
	
	//modify -----------------------------------------------------------------

	public imgBoard_entity getBoard(int seq) {
		SqlSession session = factory.openSession();
		imgBoard_entity entity = session.selectOne("mybatis.BoardMapper.getBoard",seq);
		System.out.println("entity : : :" + entity);
		session.close();
		return entity;
	}

	//delete -----------------------------------------------------------------
	
	public void boardDelete(int seq) {
		SqlSession session = factory.openSession();
		int n=0;
		System.out.println("delete mon in");
		try{
			n=session.delete("mybatis.BoardMapper.boardDelete",seq);
			System.out.println("n::::"+n);
			if(n > 0)
				session.commit();
			}catch(Exception e) {
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
		
	}
	
	//List -----------------------------------------------------------------
	public List<imgBoard_entity> getUserList() {
		SqlSession session = factory.openSession();
		List<imgBoard_entity> list = session.selectList("mybatis.BoardMapper.getBoardList");
		
		session.close();
		return list;
	}
	//View -----------------------------------------------------------------
	public imgBoard_entity getUserView(int idx) {
		SqlSession session = factory.openSession();
		imgBoard_entity dto = session.selectOne("mybatis.BoardMapper.getBoardView",idx);
		
		session.close();
		return dto;
	}
	
	//Update -----------------------------------------------------------------
	public int boardUpdate(imgBoard_entity dto) {
		SqlSession session=factory.openSession();
		int n = 0;
		
		try {
			n = session.insert("mybatis.BoardMapper.getUpdateUser",dto);
			if(n > 0) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		System.out.println(" User Update OK");
		return n;
	}


	public List<imgBoard_entity> getProfileList(String userid) {
		SqlSession session = factory.openSession();
		List<imgBoard_entity> polist = session.selectList("mybatis.BoardMapper.getProfileList",userid);
		
		session.close();
		return polist;
	}


	public List<imgBoard_entity> getClickidList(String userid) {
		SqlSession session = factory.openSession();
		List<imgBoard_entity> list = session.selectList("mybatis.BoardMapper.getidList",userid);
		return list;
	}



	public void recUpdate(rec_entity rec_entity) {
		SqlSession session = factory.openSession();
		int n=0;
			try {
				n = session.insert("mybatis.BoardMapper.rec_update", rec_entity);
				if(n>0)
					session.commit();
			} catch (Exception e) {
				System.out.println("recUpdate : " + e);
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
		}

	public void recDelete(rec_entity rec_entity) {
		SqlSession session = factory.openSession();
		int n=0;
			try {
				n = session.delete("mybatis.BoardMapper.rec_delete", rec_entity);
				if(n>0)
					session.commit();
			} catch (Exception e) {
				System.out.println("recUpdate : " + e);
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
		
	}


	public int recCheck(rec_entity rec_entity) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try {
			result = (Integer) session.selectOne("mybatis.BoardMapper.rec_check",rec_entity);
		} catch (Exception e) {
			System.out.println("recCheck : " + e);
			e.printStackTrace();
		}
		return result;
	}






	

	//Delete -----------------------------------------------------------------

}
