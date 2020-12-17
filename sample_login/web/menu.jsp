<%@page import="com.login.entity.login_entity"%>
<%@page import="java.util.List"%>
<%@page import="com.login.entity.id_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<%
			List<id_entity> idList = (List<id_entity>) session.getAttribute("idlist");
		login_entity loginEntity = (login_entity) session.getAttribute("logOK");

		for (int n = 0; n < idList.size(); n++) {
			if (idList.get(n).getUserid().equals(loginEntity.getUserid())) {
				idList.remove(n);
			}

		}
		%>

		<c:if test="${empty logOK}">
			<a class="a" href="/insta/login.jsp">인스타그램</a>
			<a class="a" href="/insta/login.jsp">로그인</a>
			<a class="a" href="login/signUp.jsp">회원 가입</a>
		</c:if>

		<c:if test="${!empty logOK}">
			<a class="a" href="/insta/boardList.do">인스타그램</a>
			<a class="a" href="/insta/profileList.do?id=${logOK.userid}">마이페이지</a>
			<a class="a" href="/insta/write/user_write.jsp">글쓰기</a>
			<a class="a" href="/insta/login/user_info.jsp">정보 변경</a>
			<a class="a" href="/insta/logout.do">로그아웃</a>

			<div class="searchbox">
				<input onkeyup="filter()" type="text" id="value"
					placeholder="Type to Search" class="search_input"
					oninput='showUserList()'>

				<div class="itemList">
					<%
						for (int n = 0; n < idList.size(); n++) {
					%>
					<div class="item" onclick="location.href='/insta/idprofile.do?id=<%=idList.get(n).getUserid()%>'">
						<span class="name">
							<%=idList.get(n).getUserid()%>
						</span>
					</div>
					<%
						}
					%>
				</div>
			</div>

		</c:if>
	</div>

	<script type="text/javascript">
		function filter() {
			var value, name, item, i;

			value = document.getElementById("value").value.toUpperCase();
			item = document.getElementsByClassName("item");

			for (i = 0; i < item.length; i++) {
				name = item[i].getElementsByClassName("name");
				if (name[0].innerHTML.toUpperCase().indexOf(value) > -1) {
					item[i].style.display = "flex";
				} else {
					item[i].style.display = "none";
				}
			}
		}

		function showUserList() {
			var chk = $('.search_input').val();
			console.log(chk);
			if (chk == '') {
				$('.itemList').css('display', 'none');
			} else {
				$('.itemList').css('display', 'block');
			}

		}
	</script>






	<hr>