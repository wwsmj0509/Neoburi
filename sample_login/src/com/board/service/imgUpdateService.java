package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;
import com.login.entity.login_entity;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.CommandAction;

public class imgUpdateService implements CommandAction{

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		System.out.println("update enter");
		
		imgBoard_entity dto = new imgBoard_entity();
		dto.setIdx(Integer.parseInt(request.getParameter("idx")));
		dto.setUserid(request.getParameter("userid"));
		dto.setContent(request.getParameter("content"));
		System.out.println("id : " + dto.getUserid());
		
//		imgBoard_dao boardDAO = new imgBoard_dao();
//		int n =0;
//		n = boardDAO.boardUpdate(dto);
//		System.out.println("n : " + n);
//		
//		if(n > 0) {
//			request.setAttribute("updateOK", n);
//			return "boardList.do";
//		}else {
//			return "write/modify.jsp";
//		}
		imgBoard_dao dao = new imgBoard_dao(); 
		dao.boardUpdate(dto);
		
		return "board/boardUpdate.jsp";
	}

}
