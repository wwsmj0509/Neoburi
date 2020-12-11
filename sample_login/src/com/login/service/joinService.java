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
		
		login_entity Inputentity = new login_entity();
		login_dao dao = new login_dao();
		
		
		Inputentity.setUserid(request.getParameter("input_id"));
		Inputentity.setPwd(request.getParameter("input_pwd"));
		Inputentity.setName(request.getParameter("input_name"));
		Inputentity.setEmail(request.getParameter("input_email"));
		Inputentity.setAddress(request.getParameter("input_address"));
		Inputentity.setChk(request.getParameter("input_chk"));
		
		System.out.println(":: - >"+Inputentity.getUserid());
		System.out.println(":: - >"+Inputentity.getName());
		System.out.println(":: - >"+Inputentity.getProfileimg());
		
		
		login_entity checkentity = dao.existCheck(Inputentity.getUserid());
		
		if(checkentity==null) {
			int n = dao.getJoin(Inputentity);
			System.out.println("회원가입 성공 서비스 탈출 :   "+ n);
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
