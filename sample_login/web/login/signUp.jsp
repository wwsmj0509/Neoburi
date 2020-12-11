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

<script language="javascript">
function goPopup(){
	var pop = window.open("/insta/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		
	console.log(roadFullAddr);
		document.form_name.input_address.value=roadFullAddr;  /* input의 name값을통해 찾는다. */
}
</script>
</head>

<body >

<%
	String userExistChk=(String)session.getAttribute("userExistChk");
	if(userExistChk==null)userExistChk="";
	session.removeAttribute("userExistChk");
%>



<form action="/insta/join.do" method="post" id="form_id" name="form_name">
	<table>
		<tr>
			<th colspan="2" align="center">회원 가입</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" placeholder="아이디" name="input_id" autocomplete=off></td>
					
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" placeholder="비밀번호" name="input_pwd" autocomplete=off></td>
		</tr>

		<tr>
			<td>이름</td>
			<td><input type="text" placeholder="이름" name="input_name" autocomplete=off></td>
		</tr>
		<tr>
			<td>EMAIL</td>
			<td><input type="text" placeholder="이메일" name="input_email" autocomplete=off></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" placeholder="주소"
				name="input_address" id="input_address_id"><input type="button" value="주소검색" onclick="goPopup();" autocomplete=off></td>
		</tr>
		<tr>
			<td>유저계정</td>
			<td><input type="radio" name="input_chk" value="user" checked ></td>
		</tr>
		<tr>
			<td>판매자 계정</td>
			<td><input type="radio" name="input_chk" value="seller"></td>
		</tr>


		<tr>
			<td colspan="2" align="center"><input type="submit" value="가입" /></td>
			<td><input type="button" value="뒤로가기" onclick="history.back() "></td>
		</tr>
		
	</table>
</form>

<div style="color:red;"><%=userExistChk %></div>

</body>
</html>