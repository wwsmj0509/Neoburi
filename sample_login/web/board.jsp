<%@page import="java.util.List"%>
<%@page import="com.board.entity.imgBoard_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="menu.jsp"/>

<script>
var count = 5;
var pg = 1;

$(window).scroll(function() {
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		alert("들어온다");
		++pg;
	    console.log(pg);
	    resetPost();
	    lastPost();
}
});
function resetPost(){
	<%	
	List<imgBoard_entity> list = (List<imgBoard_entity>) session.getAttribute("list");
	int a = (Integer)session.getAttribute("pagelimit");
	System.out.println("aaaaa:"+a);
	for(int n=0; n<list.size(); n++){
		System.out.println(list.get(n).getIdx());
	%>
	document.getElementById("userid").innerHTML = "<%=list.get(n).getUserid()%>";
	
	<%
	%>
	document.getElementById("userid").innerHTML = "<%=list.get(n).getContent()%>";
	<%
		System.out.println(list.get(n).getImgPath());
	}
	%>
	
}

function lastPost(){
	$.ajax({
		url : "boardList.do",
		data : {pg : pg},
		type : "post",
		dataType: "html",
		success : function(list) {
			var append_div = "";
	  		   append_div += "<div class='scrolling'>";
	 		   append_div += "<div><span>프로필사진 ${imgBoard.userid}</span></div>"; 
	 		   append_div += "<div><a href='boardView.do?idx=${imgBoard.idx}'>";
	 		   append_div += "<img src='/insta/storage/${imgBoard.imgPath}' width=200 height=200 border=0></a>";
			   append_div += "</div>";
			   append_div += "<div><span>아이콘1</span><span>아이콘2</span><span>아이콘3</span>";
			   append_div += "</div>";
			   append_div += "<div>${imgBoard.content }</div>";
			   append_div += "<div><a href='boardView.do?idx=${imgBoard.idx}'>댓글 달기</a></div>"; 
			   append_div += "<div><span>작성일 : ${imgBoard.logtime }</span></div>";
			   append_div += "</div>";
			for (var i = 0; i < 5 ; i++) {
				$("div.scrolling:last").append(append_div);
			}
			}
			});
}
</script>

<c:if test="${!empty list }">
	<c:forEach items="${list}" var="imgBoard" >
	<div id="appendList">
 		   <div><span id="userid">프로필사진 ${imgBoard.userid}</span></div>
 		   <div><a href='boardView.do?idx=${imgBoard.idx}'>
 		   <img src='/insta/storage/${imgBoard.imgPath}' width=200 height=200 border=0></a>
		   </div>
		   <div><span>아이콘1</span><span>아이콘2</span><span>아이콘3</span>
		   </div>
		   <div id="content">${imgBoard.content }</div>
		   <div><a href='boardView.do?idx=${imgBoard.idx}'>댓글 달기</a></div>
		   <div><span id="logtime">작성일 : ${imgBoard.logtime }</span></div>
		   </div>
	</div>

		</c:forEach>
	</c:if>
	
</body>
</html>





