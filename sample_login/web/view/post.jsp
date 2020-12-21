<%@page import="com.login.entity.login_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../menu.jsp"/>

<c:if test="${!empty boardView}">

	<div>
		<div><img src="/insta/storage/${boardView.imgPath}" width="500" height="400" border="0"></div>
	</div>
	<div>
		<div>
			<span><img name="profileimg" src="/insta/profile_img/${boardView.writeuserimg}" width="40px"></span>
			<span>${boardView.userid }</span>
			<c:if test="${logOK.userid == boardView.userid }" > <!--작성자 확인 -->
			<span><a href="boardModify.do?idx=${boardView.idx}">수정</a></span>
			<span><a href="boardDelete.do?idx=${boardView.idx}">삭제</a></span>
			</c:if>
			<span>${boardView.logtime}</span>
			
		</div>
		<div>${boardView.content }</div>
<c:if test="${!empty Replylist}">
	<c:forEach items="${Replylist }" var="replylist">
		<div>
		<form name="form" method="post">
			<c:if test="${logOK.userid == replylist.writeid }">
				<a href="/insta/profileList.do?id=${replylist.writeid}"><span>${replylist.writeid}</span></a>
			</c:if>
			<c:if test="${logOK.userid != replylist.writeid }">
				<a href="/insta/idprofile.do?id=${replylist.writeid}"><span>${replylist.writeid}</span></a>
			</c:if>
				
				<span>${replylist.content}</span>
				<span>${replylist.logtime}</span>
			<c:if test="${logOK.userid == replylist.writeid }">
				<input type="submit" value="수정" onclick="javascript: form.action='/insta/view/reply_update.jsp?idx=${boardView.idx}&&replyidx=${replylist.idx}&&content=${replylist.content}';"/>
    			<input type="submit" value="삭제" onclick="javascript: form.action='/insta/replyDelete.do?idx=${boardView.idx}&&replyidx=${replylist.idx}';"/>
			</c:if>
		</form>	
		</div>
		
	</c:forEach>
</c:if>
		<div>
			<form id="write_reply" action="replyWrite.do" method="post">
				<input type="text" placeholder="댓글 입력" name="reply_write">
				<input type="hidden" name="write_user" value="${logOK.userid}">
				<input type="hidden" name="board_idx" value="${boardView.idx}">
				<input type="submit" value="입력">
			</form>
		</div>
	</div>

</c:if>
 
</body>
</html>