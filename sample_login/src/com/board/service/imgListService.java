package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;

import controller.CommandAction;

public class imgListService implements CommandAction {

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		imgBoard_dao dao = new imgBoard_dao();
		
		int pg = 0;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}else {
			pg = 1;
		}
		
		System.out.println("pageSize : "+pg);
	
		int pageSize = 5;					//한 페이지에 출력할 게시물 
		int endNum = pg*pageSize;			// 끝번호 
		int startNum = endNum - (pageSize-1);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<imgBoard_entity> list = dao.getBoardList(map);
		int pagelimit = list.size();


		if (list != null) {
			HttpSession s=request.getSession();
			 
			s.setAttribute("list", list);
			s.setAttribute("pagelimit", pagelimit);
		}

		
		return "board.jsp";
	}
}
