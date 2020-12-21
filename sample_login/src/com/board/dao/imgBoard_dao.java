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
	public List<imgBoard_entity> getBoardList(Map<String, Integer> map) { // 이름 변경함 확인후 주석 삭제
		SqlSession session = factory.openSession();
		List<imgBoard_entity> list = session.selectList("mybatis.BoardMapper.getBoardList",map);
		
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
	public void boardUpdate(imgBoard_entity dto) {
		SqlSession session=factory.openSession();
		int n=0;
		System.out.println("update dao in");
		try {
			System.out.println("try in");
			n = session.update("mybatis.BoardMapper.getUpdateUser",dto);
			System.out.println("try out");
			if(n>0) {
				session.commit();
			}
		}catch(Exception e) {
			System.out.println("catch");
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}

	}

	//-----------------------------------------------------------------
	public List<imgBoard_entity> getProfileList(String userid) {
		SqlSession session = factory.openSession();
		List<imgBoard_entity> polist = session.selectList("mybatis.BoardMapper.getProfileList",userid);
		
		session.close();
		return polist;
	}

	//-----------------------------------------------------------------
	public List<imgBoard_entity> getClickidList(String userid) {
		SqlSession session = factory.openSession();
		List<imgBoard_entity> list = session.selectList("mybatis.BoardMapper.getidList",userid);
		return list;
	}

	//board list total check-----------------------------------------------------------------
	public int getTotalArticle() { //총 게시물 수 
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.BoardMapper.getTotalArticle");
		
		session.close();
		return n;
	}

	public void getBoardChangeWriteProtile(login_entity entity) {
		SqlSession session=factory.openSession();
		int n=0;
		System.out.println("update profile img dao in");
		try {
			System.out.println("try in");
			n = session.update("mybatis.BoardMapper.getBoardChangeWriteProtile",entity);
			System.out.println("try out");
			if(n>0) {
				session.commit();
			}
		}catch(Exception e) {
			System.out.println("catch");
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}

}
