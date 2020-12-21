<%@page import="java.util.List"%>
<%@page import="com.board.entity.imgBoard_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/menu.jsp"/>  <!-- 젇대경로 -->

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
      url : "/insta/boardAjax",      //Servlet으로 비동기 요청
      data : {pg:pg},               // 몇페이지? 
      type : "get",
      dataType: "json",
      success : function(listObj) { //펑션안에 들어가는문장은 명명하기따라 다르다
         console.log(listObj);
         for (var i = 0; i < listObj.length; i++) {
         var append_div = "";
            append_div += "<div class='scrolling'>";
            append_div += "<div class='scrolling_profile_bar'><span>";
           	append_div += "<a href='profileList.do?id="+listObj[i].boardUserid+"' class=''>";
           	append_div += "<span><img name='profileimg' src='/insta/profile_img/"+listObj[i].boardWriteuserimg+"' width='40px'></span>";
           	append_div += "<span>"+listObj[i].boardUserid+"</span></a>";
            append_div += "</span></div>"; 
            append_div += "<div  class='scrolling_board_frame'><a href='boardView.do?idx="+listObj[i].boardIdx+"' class='scrolling_board_a_tag'>";
            append_div += "<img src='/insta/storage/"+listObj[i].boardImgPath+"'  class='scrolling_board_img'></a>";
            append_div += "</div>";
            append_div += "<div>";
            append_div += "<i class='far fa-heart fa-2x'></i>";
            append_div += "<i class='far fa-comment fa-2x'></i>";
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
          <div class="scrolling_profile_bar">
	          <span id="userid">
          		<a href='profileList.do?id=${imgBoard.userid}' class=''>
		      		<span><img name="profileimg" src="/insta/profile_img/${imgBoard.writeuserimg}" width="40px"></span>
			        <span>${imgBoard.userid}</span>
		        </a>
	          </span>
          </div>
          
          <div class='scrolling_board_frame'>
                <a href='boardView.do?idx=${imgBoard.idx}' class='scrolling_board_a_tag'>
                <img src='/insta/storage/${imgBoard.imgPath}'  class='scrolling_board_img'></a>
         </div>
         <div class="scrolling_icon_bar">
               <i class="far fa-heart fa-2x scrooling_icon"></i>
               <i class="far fa-comment fa-2x scrooling_icon" onclick="location.href='boardView.do?idx=${imgBoard.idx}'"></i>
         </div>
         <div class="scrolling_content">${imgBoard.content }</div>
         <div class="scrolling_logtime"><span id="logtime">작성일 : ${imgBoard.logtime }</span></div>
         
         </div>

      </c:forEach>
      </div>
   </c:if>
   
</body>
</html>