<%@page import="com.login.entity.login_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/menu.jsp"/>  <!-- 젇대경로 -->
<!-- 개인정보 수정하기 -->

	<form name="uploadForm" method="post" action="/insta/myProfile.do" enctype="multipart/form-data">
		<div>
			<img name="profileimg" src="/insta/profile_img/${logOK.profileimg}" width="300px">
		</div>
		<div>
			<div><b>이미지</b></div>
			<div><input type="file" name="imgpath" size="55"></div>
			<input type="submit" value="이미지 변경 확인 버튼"/>
			<input type="button" onClick="location.href='/insta/login/chk_pwd.jsp'" value="정보 변경"/>
		</div>
		<div style="border: 1px solid #48BAE4; height: auto; width: 650px;">
		
		<c:if test="${!empty polist}">
		<c:forEach items="${polist}" var="parson">
			<a href="boardView.do?idx=${parson.idx}">
				<img src="/insta/storage/${parson.imgPath}" width="200">
			</a>

		</c:forEach>
		</c:if>
		</div>
		
		
	</form>
</body>
</html>