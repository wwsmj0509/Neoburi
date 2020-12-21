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
function setThumbnail(event) {
	var reader = new FileReader(); reader.onload = function(event) {
		var img = document.getElementById("img");
		img.setAttribute("src", event.target.result);
		 
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	} 
</script>
<c:if test="${!empty logOK}">

	<form name="boardWriteForm" method="post" action="/insta/userWrite.do" enctype="multipart/form-data">
	<h3>글쓰기</h3>
	<table border="0" >
	   <tr>
	      <td>아이디</td>
	      <td><input type="text" name="userid" size="55"  value="${logOK.userid}" readonly></td>
	   </tr>
	   
	   <tr>
			<td><b>이미지</b></td>
			<td id="image_container">
			<img id="img" width="300" height="300" border="0">
			<input type="file" name="imgpath" id="image" accept="image/*" onchange="setThumbnail(event);"/></td>
	   </tr>
	   
	   <tr>
	      <td>내 용</td>
	      <td><textarea name="content" cols="47" rows="10"></textarea></td>
	   </tr>
	   
	   <tr>
	      <td colspan="2" align="center">
	      <input type="button" value="글쓰기" onclick="checkBoardWrite()">
	      <input type="reset" value="다시작성">
	      </td>
	   </tr>
	</table>
	</form>
</c:if>

</body>
</html>