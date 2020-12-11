package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;
import com.login.entity.login_entity;

import controller.CommandAction;

public class imgInsertService implements CommandAction{

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		System.out.println("insert enter");
		
		imgBoard_entity dto = new imgBoard_entity();
		dto.setUserid(request.getParameter("userid"));
		//dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		imgBoard_dao boardDAO = new imgBoard_dao();
		int n = 0;
				boardDAO.boardInsert(dto);
		
		if(n > 0) {
			request.setAttribute("insertOK", n);
			return "boardList.do";
		}else {
			return "write/user_write.jsp";
		}
	}

}
