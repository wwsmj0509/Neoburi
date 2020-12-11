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

</head>

<body>
	
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
					<td colspan="1"><a href="/insta/login/signUp.jsp">회원가입</a></td>
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