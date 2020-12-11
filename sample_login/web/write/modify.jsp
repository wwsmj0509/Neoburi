<%@page import="com.board.entity.imgBoard_entity"%>
<%@page import="com.login.entity.login_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../menu.jsp"/>

<script>
function checkBoardWrite(){
   if(document.boardWriteForm.content.value=="") {
      alert("내용을 입력하세요");
  	  boardWriteForm.subject.forcus();
   }else {
      document.boardWriteForm.submit();
   }
}
</script>
<c:if test="${!empty logOK}">

<%
	imgBoard_entity entity = (imgBoard_entity)request.getAttribute("entity");
	int seq = (Integer)request.getAttribute("seq");
	int pg = (Integer)request.getAttribute("pg");
	
	login_entity log = (login_entity)session.getAttribute("logOK");
%>

<form name="boardModifyForm" method="post" 
                   action="/bbs/boardUpdate.do?seq=<%=seq%>&pg=<%=pg%>">
<h3>글수정</h3>
<table border="1" >
	<tr>
	      <td>아이디</td>
	      <td><input type="text" name="userid" size="55"  value="${logOK.userid}" readonly></td>
	   </tr>
	   
	   <tr>
			<td><b>이미지</b></td>
			<td><input type="file" name="imagepath" size="55"></td>
	   </tr>
	   
	   <tr>
	      <td>내 용</td>
	      <td><textarea name="content" cols="47" rows="10"></textarea></td>
	   </tr>
	   
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="글수정" onclick="checkBoardModify()">
		<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>

</c:if>
</body>
</html>