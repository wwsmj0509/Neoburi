<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body>
	<div id="menu">
	

	<c:if test="${empty logOK}">
		<a class = "a" href="/insta/login.jsp" >인스타그램</a>
		<a class = "a" href="/insta/login.jsp" >로그인</a>
		<a class = "a" href="login/signUp.jsp" >회원 가입</a>
	</c:if>

	<c:if test="${!empty logOK}">
		<a class = "a" href="/insta/boardList.do" >인스타그램</a>
		<form id="menu_form" action="/insta/search.do" method="post">
			<input type="text" placeholder="검색어를 입력해 주세요" name="search_word">
			<input type="submit" value="검색">
		</form>
		<a class = "a" href="/insta/profileList.do?id=${logOK.userid}" >마이페이지</a>
		<a class = "a" href="/insta/write/user_write.jsp" >글쓰기</a>
		<a class = "a" href="/insta/login/user_info.jsp" >정보 변경</a>
		<a class = "a" href="/insta/logout.do" >로그아웃</a>
    
	</c:if>

	</div>
	<hr>