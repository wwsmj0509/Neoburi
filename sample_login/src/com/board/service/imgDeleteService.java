package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;
import com.login.entity.login_entity;
import com.reply.dao.imgReply_dao;

import controller.CommandAction;

public class imgDeleteService implements CommandAction{

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		System.out.println("delete enter");
		
		int boardIdx = (Integer)request.getAttribute("idx");
		
		imgBoard_dao dao= new imgBoard_dao();
		int n = 0;
//		dao.boardDelte(boardIdx);
		
		if(n > 0) {
			request.setAttribute("deleteOK", n);
			return "boardList.do";
		}else {
			return "boardView.do?idx="+boardIdx;
		}
	}

}
