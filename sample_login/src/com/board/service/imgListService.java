package com.board.service;


import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;

import controller.CommandAction;

public class imgListService implements CommandAction {

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.print("board.do in");
		imgBoard_dao dao = new imgBoard_dao();
		List<imgBoard_entity> list = dao.getUserList();
		
		request.setAttribute("list", list);
		
		return "board.jsp";
	}
}
