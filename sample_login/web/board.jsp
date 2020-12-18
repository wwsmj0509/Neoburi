<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="menu.jsp"/>


<c:if test="${!empty list }">
	<c:forEach items="${list }" var="imgBoard">
	<div>
		<div>
			<div>
				<span>프로필사진 ${imgBoard.userid }</span>
			</div>
			<div>
				<a href="boardView.do?idx=${imgBoard.idx}">
				<img src="/insta/storage/${imgBoard.imgPath}" width="200" height="200" border="0"></a>
			</div>
			<div>
				<span>아이콘1</span>
				<span>아이콘2</span>
				<span>아이콘3</span>
			</div>
			<div>${imgBoard.content }</div>
			<div><a href="boardView.do?idx=${imgBoard.idx}">댓글 달기</a></div>
			<div><span>작성일 : ${imgBoard.logtime }</span></div>
			
			<form action="/insta/RecUpdate.do?idx=${imgBoard.idx}" method="post">
				<input type="submit">
			</form>
			
		</div>
	</div>
				
		</c:forEach>
	</c:if>
	
</body>
</html>





