package com.login.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.dao.imgBoard_dao;
import com.board.entity.imgBoard_entity;
import com.login.dao.login_dao;
import com.login.entity.id_entity;
import com.login.entity.login_entity;

import controller.CommandAction;

public class idListService implements CommandAction {

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("idlist서비스 들어옴");
		
		login_dao dao = new login_dao();
		
		List<id_entity> idlist = dao.getidList();
		
		for(int n=0; n<idlist.size(); n++) {
			System.out.println(idlist.get(n).getUserid());
			System.out.println(idlist.get(n).getProfileimg());
		}
		if (idlist != null) {
//			RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");
//			request.setAttribute("idlist", list);
//			rd.forward(request, response);
			HttpSession s=request.getSession();
			
			s.setAttribute("idlist", idlist); 
		}
		
		return "login.jsp";
	}


}
