package com.login.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.login_dao;
import com.login.entity.login_entity;

import controller.CommandAction;

public class enterJoinService implements CommandAction {

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		login_dao loginDao= new login_dao();
		
		ArrayList<login_entity> list= (ArrayList<login_entity>) loginDao.getUserList();
		
		HttpSession session=request.getSession();
		session.setAttribute("UserList", list);
		
		
	
		
		return "/login/signUp.jsp";
	}

}
