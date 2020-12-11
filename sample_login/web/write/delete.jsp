<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../menu.jsp" %>

<%
	int pg = (Integer)request.getAttribute("pg");
%>

<body onload="alert('삭제되었습니다'); location.href='/insta/board.do?pg=<%=pg%>';" >
</body>
</html>