package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.login_dao;
import com.login.entity.login_entity;

import controller.CommandAction;

public class joinService implements CommandAction{

	@Override
	public String requestPro_action(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		////////////////////////////////////
		System.out.println("회원가입 service");
		////////////////////////////////////
		
		login_entity entity = new login_entity();
		
		entity.setUserid(request.getParameter("input_id"));
		entity.setPwd(request.getParameter("input_pwd"));
		entity.setName(request.getParameter("input_name"));
		entity.setEmail(request.getParameter("input_email"));
		entity.setAddress(request.getParameter("input_address"));
		entity.setProfileimg(request.getParameter("profileinmg"));
		entity.setChk(request.getParameter("input_chk"));
		
		login_dao dao = new login_dao();
		
		int n = dao.existCheck(entity.getUserid());
		
		if(n > 0) {
			entity = dao.getJoin(entity);
			System.out.println("n : "+n);
			return "login.jsp";
		}else {
			HttpSession session=request.getSession();
			String userExistChk="유저존재";
			session.setAttribute("userExistChk", userExistChk);
			System.out.println("가입실패 중복존재");
			return "/login/signUp.jsp";
		}
		
	}

}
