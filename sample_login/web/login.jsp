<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	
        $.ajax({
            type : "POST", //전송방식을 지정한다 (POST,GET)
            url : "idList.do",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "html",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
//                 alert("통신실패!!!!");
            },
            success : function(id_data){
//                 alert("통신 성공~!!!");
            }
             
        });
    });
</script>
</head>

<body>


<!-- 12월 15일 16:45 -->


		<%
			String errMsg = (String)session.getAttribute("errMsg");
			if(errMsg==null){
				errMsg="";
			}
			session.removeAttribute("errMsg");
		%>
		
		<form action="/insta/login.do" method="post" onsubmit="return blankCheck();"  >
			<table >
				<tr>
					<td>아이디</td>
					<td><input type="text" placeholder="아이디" name="input_id" id="input_id_id"  autocomplete=off></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" placeholder="비번" name="input_pwd"  id="input_id_pwd" autocomplete=off></td>
				</tr>
				<tr>
					<td colspan="1"><input type="submit" value="로그인"></td>
				</tr>
				<tr>
					<td colspan="1"><a href="/insta/enterJoin.do">회원가입</a></td>
				</tr>
				
			</table>
		</form>
		<div style="color:red;"><%=errMsg %></div>
		
		<script>
		/*공백 허가X 처리  */
		function blankCheck(){
			var id=$('#input_id_id').val();
			var pwd=$('#input_pwd_id').val();

			if(id==''||pwd==''){
				console.log(id);
				console.log(pwd);
				alert("공백을 입력하지마세요.");
				return false;
			}
			else{
				return true;
			}			
			
		} 
		</script>
		
	</body>
</html>