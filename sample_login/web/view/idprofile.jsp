<%@page import="com.login.entity.login_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp" %>
<!-- 남의 프로필 훔쳐보기 -->
<%
	String clickprofileImg = (String)request.getAttribute("clickidProfileImg");
	System.out.println("지성 : "+ clickprofileImg);
%>

		<div>
			<img name="profileimg" src="/insta/profile_img/<%=clickprofileImg%>" width="300px">
			
		</div>
		
		<div style="border: 1px solid #48BAE4; height: auto; width: 650px;">
		
		<c:if test="${!empty list}">
		<c:forEach items="${list}" var="parson">
			<a href="boardView.do?idx=${parson.idx}">
				<img src="/insta/storage/${parson.imgPath}" width="200">
			</a>

		</c:forEach>
		</c:if>
		</div>
	
</body>
</html>