package com.login.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.login.entity.login_entity;

public class login_dao {

	private static SqlSessionFactory factory;
	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
		}
	}

	// 로그인 -----------------------------------------------------------------

	public login_entity getUser(String id, String pwd) {
		SqlSession session = factory.openSession();
		login_entity logEntity = new login_entity();

		logEntity.setUserid(id);
		logEntity.setPwd(pwd);

		login_entity entity = session.selectOne("mybatis.LoginMapper.getLoginUser", logEntity);
		session.close();

		return entity;
	}

	public int getJoin(login_entity entity) {

		
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("mybatis.LoginMapper.JoinUser", entity);
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	public login_entity existCheck(String userid) {

		SqlSession session = factory.openSession();
		login_entity entity = session.selectOne("mybatis.LoginMapper.userExist", userid);

		session.close();
		return entity;

	}

	//프로필 이미지 변경
		public int profileimgInsert(login_entity entity) {
			SqlSession session=factory.openSession();
			int n=0;
			try{
				n=session.update("mybatis.LoginMapper.profileImgInsert", entity);
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

		public int infoChange(login_entity changeentity) {
			
			SqlSession session=factory.openSession();
			int n = 0;
			
			try {
				n = session.update("mybatis.LoginMapper.infoChange",changeentity);
				if(n > 0) {
					session.commit();
				}
			}catch(Exception e) {
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
			System.out.println(" info Update OK");
			return n;
		}
}
