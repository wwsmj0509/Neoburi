package com.board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.dao.imgBoard_dao;
import com.board.entity.rec_entity;
import com.login.entity.login_entity;

import controller.CommandAction;

public class RecUpdateService implements CommandAction {

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		System.out.println("hi121122112");
		
	    HttpSession s = request.getSession();
	    login_entity entity = (login_entity)s.getAttribute("logOK");
	    
	    String userid = entity.getUserid();
	    int idx = Integer.parseInt(request.getParameter("idx"));
	    
	    System.out.println("chking : "+idx+" : "+userid);
	    
	    rec_entity rec_entity = new rec_entity();
	    rec_entity.setUserid(userid);
		rec_entity.setIdx(idx);
		
	    
		imgBoard_dao dao = new imgBoard_dao();
 
		int result = dao.recCheck(rec_entity);
		System.out.println(result);
		if(result == 0){ // 추천하지 않았다면 추천 추가
			dao.recUpdate(rec_entity);
			System.out.println("re 11111");
		}else{
			dao.recDelete(rec_entity);
			System.out.println("re 0000");
		}
		return "boardList.do";
	}

}
