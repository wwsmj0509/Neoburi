<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script language="javascript">
var chk;
var count;
function goPopup(){
	var pop = window.open("/insta/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		
	console.log(roadFullAddr);
		document.form_name.input_address.value=roadFullAddr;  /* input의 name값을통해 찾는다. */
}

function pwdchk(){
	var rpwd = $('input[name=input_pwd]').val();
	
	if(${logOK.pwd} == rpwd){
		alert("현재 비밀번호와 일치합니다");
		chk = "true";
	}else{
		alert("현재 비밀번호와 틀립니다");
		chk = "false";
	}
}

function blankCheck(){
	var pwd = $('input[name=change_pwd]').val();

	if(chk=="true"){
		if(pwd==''){
			console.log(pwd);
			alert("비밀번호를 꼭 입력하세요");
			return false;
		}
		else{
			return true;
		}
	}else{
		alert("현재 비밀번호와 틀립니다")
		return false;
	}
		

} 
</script>

<form action="/insta/user_info.do" method="post" id="form_id" name="form_name" onsubmit="return blankCheck();">
	<table>
		<tr>
			<th colspan="2" align="center">정보 변경</th>
		</tr>
		<tr>
			<td>현재 아이디 : </td>
			<td name="real_userid">${logOK.userid}</td>	
		</tr>
		<tr>
			<td>현재 비밀번호</td>
			<td><input type="password" placeholder="현재 비밀번호" name="input_pwd" autocomplete=off>
			<input type="button" value="비번 chk" onclick="pwdchk();" autocomplete=off></td>
		</tr>
		<tr>
			<td>변경 비밀번호</td>
			<td><input type="password" placeholder="바꿀 비밀번호" name="change_pwd" autocomplete=off></td>
		</tr>

		<tr>
			<td>EMAIL</td>
			<td><input type="text" placeholder="바꿀 이메일" name="change_pwd" autocomplete=off></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" placeholder="바꿀 주소"
				name="change_address" id="input_address_id"><input type="button" value="주소검색" onclick="goPopup();" autocomplete=off></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="정보 변경 완료" /></td>
			<td><input type="button" value="뒤로가기" onclick="history.back() "></td>
		</tr>
		
	</table>
</form>

</body>
</html>