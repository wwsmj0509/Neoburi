package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;
import com.login.dao.login_dao;
import com.login.entity.login_entity;

import controller.CommandAction;

public class imgListService implements CommandAction {

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		imgBoard_dao dao = new imgBoard_dao();
		
		// 이 서비스는 처음 board.jsp 한번 진입했을때만 작동됨
		int pg = 1;
		if(request.getParameter("pg") != null){ // 처음 진입시파라메타 값이 없다
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		int total=dao.getTotalArticle();//총글수	
		System.out.println("total : "+total);
	
		int pageSize = 3;					//한 페이지에 출력할 게시물 
		int endNum = pg*pageSize;			// 끝번호 
		int startNum = endNum - (pageSize-1);
		
		Map<String, Integer> map = new HashMap<>(); // 페이징 처리
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<imgBoard_entity> list = dao.getBoardList(map);
		
		
		
		
		
		
		
		/*
		 * System.out.println("list Size : "+list.size());
		 * System.out.println("list Write User Img : "+list.get(0).getWriteuserimg());
		 */

		if (list != null) {
			request.setAttribute("list", list); //첫번째 페이지만 리퀘스트로 띄운다
			
			
			
		}

		return "board.jsp";
	}
}
