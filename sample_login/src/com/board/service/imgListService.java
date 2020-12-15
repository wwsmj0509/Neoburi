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
		imgBoard_dao dao = new imgBoard_dao();
		
		
		List<imgBoard_entity> list = dao.getUserList();
		System.out.println("list : "+list.get(0).getImgPath());
		// getUserList라는 메소드를 쓰는데 이 메소드의 맵퍼 id는 getBoardList 임
		// getUserList라는 메소드이름보다는 getBoardList 라는 이름이 맞는거같음
		// 확인해주세요

		if (list != null)
			request.setAttribute("list", list);

		return "board.jsp";
	}
}
