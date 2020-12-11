package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;

import controller.CommandAction;

public class imgUpdateService implements CommandAction{

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		System.out.println("update enter");
		
		imgBoard_entity dto = new imgBoard_entity();
		dto.setIdx(Integer.parseInt(request.getParameter("idx")));
		dto.setUserid(request.getParameter("userid"));
	//	dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		imgBoard_dao boardDAO = new imgBoard_dao();
		int n =0;
				 boardDAO.boardUpdate(dto);
		
		if(n > 0) {
			request.setAttribute("updateOK", n);
			return "boardList.do";
		}else {
			return "write/user_write.jsp";
		}
	}

}
