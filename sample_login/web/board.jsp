<%@page import="java.util.List"%>
<%@page import="com.board.entity.imgBoard_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="menu.jsp"/>

<script>
var pg = 1;

$(function(){ 
	function startPost(){
		$.post("boardList.do",{pg:pg})
	}
})
$(window).scroll(function() {
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		++pg;
	    lastPost();
}
});

function lastPost(){
	$.ajax({
		url : "/insta/boardAjax",		//Servlet으로 비동기 요청
		data : {pg:pg},					// 몇페이지? 
		type : "get",
		dataType: "json",
		success : function(listObj) { //펑션안에 들어가는문장은 명명하기따라 다르다
			console.log(listObj);
			for (var i = 0; i < listObj.length; i++) {
			var append_div = "";
	  		   append_div += "<div class='scrolling'>";
	 		   append_div += "<div><span>프로필사진 "+listObj[i].boardUserid+"</span></div>"; 
	 		   append_div += "<div><a href='boardView.do?idx="+listObj[i].boardIdx+"'>";
	 		   append_div += "<img src='/insta/storage/"+listObj[i].boardImgPath+"' width=200 height=200 border=0></a>";
			   append_div += "</div>";
			   append_div += "<div>";
			   append_div += "<span>아이콘1</span>";
			   append_div += "<span>아이콘2</span>";
			   append_div += "<span>아이콘3</span>";
			   append_div += "</div>";
			   append_div += "<div>"+listObj[i].boardContent+"</div>";
			   append_div += "<div><a href='boardView.do?idx="+listObj[i].boardIdx+"'>댓글 달기</a></div>"; 
			   append_div += "<div><span>작성일 : "+listObj[i].boardDate+"</span></div>";
			   append_div += "</div>";
				$("#appendList:last").append(append_div);
				}
			}
		});
}

</script>

<c:if test="${!empty list }">
	<div id="appendList">
	<c:forEach items="${list}" var="imgBoard" >
		<div class="scrolling">
 		   <div><span id="userid">프로필사진 ${imgBoard.userid}</span></div>
 		   <div>
 		   		<a href='boardView.do?idx=${imgBoard.idx}'>
 		   		<img src='/insta/storage/${imgBoard.imgPath}' width=200 height=200 border=0></a>
		   </div>
		   <div>
			   <span>아이콘1</span>
			   <span>아이콘2</span>
			   <span>아이콘3</span>
		   </div>
		   <div id="content">${imgBoard.content }</div>
		   <div><a href='boardView.do?idx=${imgBoard.idx}'>댓글 달기</a></div>
		   <div><span id="logtime">작성일 : ${imgBoard.logtime }</span></div>
		   </div>

		</c:forEach>
	   </div>
	</c:if>
	
</body>
</html>