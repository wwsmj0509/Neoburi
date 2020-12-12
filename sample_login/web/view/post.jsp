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
			<span>프로필사진</span>
			<span>${boardView.userid }</span>
			<c:if test="${logOK.userid == boardView.userid }" > <!--작성자 확인 -->
			<span><a href="">수정</a></span>
			<span><a href="boardDelete.do?idx=${boardView.idx}">삭제</a></span>
			</c:if>
		</div>
		<div>${boardView.content }</div>
<c:if test="${!empty Replylist}">
	<c:forEach items="${Replylist }" var="replylist">
		<div>
			<a href=""><span>${replylist.writeid }</span></a>
			<span>${replylist.content }</span>
			<span>${replylist.logtime }</span>
		</div>
		
	</c:forEach>
</c:if>
		<div>
			<form id="write_reply" action="replyWrite.do" method="post">
				<input type="text" placeholder="댓글 입력" name="reply_write">
				<input type="hidden" name="write_user" value="${logOK.userid }">
				<input type="hidden" name="board_idx" value="${boardView.idx }">
				<input type="submit" value="입력">
			</form>
		</div>
	</div>

<!-- 	<h3>글쓰기</h3> -->
<!-- 	<table border="0" > -->
<!-- 	   <tr> -->
<!-- 	      <td>프로필 사진 넣을곳</td> -->
<%-- 	      <td>${view.userid}</td> --%>
<!-- 	   </tr> -->
<!-- 	   <tr> -->
<!-- 	      <td>제 목</td> -->
<!-- 	      <td>제 목</td> -->
<!-- 	   </tr> -->
	   
<!-- 	   <tr> -->
<!-- 	      <td>내 용</td> -->
<!-- 	      <td>내 용</td> -->
<!-- 	   </tr> -->
	   
<!-- 	   <tr> -->
<!-- 	      <td colspan="2" align="right"> -->
<!-- 	      <a href="/insta/write/user_update.jsp">수정</a> -->
<!-- 	      <a href="boardList.do">목록</a> -->
<!-- 	      </td> -->
<!-- 	   </tr> -->
<!-- 	</table> -->
</c:if>
</body>
</html>