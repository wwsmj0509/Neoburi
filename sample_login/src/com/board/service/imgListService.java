package com.board.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;
import com.board.entity.rec_entity;
import com.login.entity.login_entity;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import controller.CommandAction;

public class imgListService implements CommandAction {

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		imgBoard_dao dao = new imgBoard_dao();
		
		List<imgBoard_entity> list = dao.getUserList();
		
//		rec_entity rec_entity = new rec_entity();
//		
//		ArrayList<Integer> result = new ArrayList<Integer>();
//		for(int n=0; n<list.size(); n++) {
//			rec_entity.setIdx(list.get(n).getIdx());
//			rec_entity.setUserid(list.get(n).getUserid());
//			
//			result.add(dao.recCheck(rec_entity));  	
//		}
		
		
		
		if (list != null)
			request.setAttribute("list", list);
		return "board.jsp";
	}
}
