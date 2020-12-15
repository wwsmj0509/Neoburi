<%@page import="com.login.entity.login_entity"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script language="javascript">
	function goPopup() {
		var pop = window.open("/insta/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr) {

		document.form_name.input_address.value = roadFullAddr; /* input의 name값을통해 찾는다. */
	}
</script>
</head>

<body>

	<%
		ArrayList<login_entity> UserList = (ArrayList<login_entity>)session.getAttribute("UserList");
	%>



	<form action="/insta/join.do" method="post" id="form_id"
		onsubmit='return emptyCheck();' name="form_name">
		<table>
			<tr>
				<th colspan="2" align="center">회원 가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" placeholder="아이디" name="input_id"
					id="input_id" autocomplete=off></td>
				<td><span style="color: red; display: none;"
					id="check_id_span"></span> </td>

			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" placeholder="비밀번호" name="input_pwd"
					autocomplete=off class="input_pwd" id="input_pwd"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" placeholder="비밀번호" autocomplete=off
					class="input_pwd" id="input_pwd_re"></td>

				<td><span style="color: red; display: none;"
					id="check_pwd_span"></span></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" placeholder="이름" name="input_name"
					autocomplete=off id="input_name"></td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td><input type="text" placeholder="이메일" name="input_email"
					autocomplete=off id="input_email"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" placeholder="주소" name="input_address"
					id="input_address_id">
					<input type="button" value="주소검색"
					onclick="goPopup();" autocomplete=off></td>
			</tr>
			<tr>
				<td>유저계정</td>
				<td><input type="radio" name="input_chk" value="user" checked></td>
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


	<script>
	
	
		function emptyCheck(){
			
			var id=$('#input_id').val();
			var pwd=$('#input_pwd').val();
			var pwd_re=$('#input_pwd_re').val();
			var name=$('#input_name').val();
			var email=$('#input_email').val();
			var address=$('#input_address').val();
			
			if(id==''||pwd==''||pwd_re==''||name==''||email==''||address==''){
				alert('공백을 입력하지마세요');
				return false;
			}
			else{
				
				<%for(int i = 0 ;i<UserList.size();i++){%>
					
					if('<%=UserList.get(i).getUserid()%>'== id){
						alert("중복된 아이디입니다.");
				  		return false;
					}
					
				<%}%>
					
					var input_pw=$('#input_pwd').val();
				  	var input_pw_re=$('#input_pwd_re').val();
				  	
				  	  	if(input_pw==input_pw_re){
				  	  		alert("회원가입 되었습니다.")
							return true;
				  	  	}
					  	else{
					  		alert("비밀번호 일치여부를 확인해주세요.")
							return false;
					  	}
				
			}
			
		}
		
		
		
		$('#input_id').focusout(function (){
			//실시간체크
			
			var input_id=$('#input_id').val();

			
			<%for(int i = 0 ;i<UserList.size();i++){%>
				
				if('<%=UserList.get(i).getUserid()%>'== input_id){
					$('#check_id_span').css('color','red');
			  		$('#check_id_span').css('display',"inline");
			  		$('#check_id_span').html("아이디 중복");
			  		return false;
				}
				else{
					$('#check_id_span').css('color','green');
			  		$('#check_id_span').css('display',"inline");
			  		$('#check_id_span').html("아이디 사용가능");
				}
				
			<%}%>
		
			
			
		});

		$('.input_pwd').focusout(function () {
			  
			  	var input_pw=$('#input_pwd').val();
			  	var input_pw_re=$('#input_pwd_re').val();
			  	if(input_pw==''||input_pw_re==''){
			  		null;
			  	}
			  	else{
			  	  	if(input_pw==input_pw_re){
				  		$('#check_pwd_span').css('color','green');
				  		$('#check_pwd_span').css('display',"inline");
				  		$('#check_pwd_span').html("비밀번호가 일치합니다.");
				  	}
				  	else{
				  		$('#check_pwd_span').css('color','red');
				  		$('#check_pwd_span').css('display',"inline");
				  		$('#check_pwd_span').html("비밀번호를 다시 확인해주세요.");
				  	}
			  	}
		  });
		
		


	</script>




</body>
</html>