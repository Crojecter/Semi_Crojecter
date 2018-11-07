<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.*"%>
<%
	Member m = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
	input, label{
		width:250px;
		height:25px;
		margin:1px 10px 1px 10px;
	}
	input[type=submit]{
		color:white;
		text-align:center;
		border-radius:5px;
		height:40px;
		font-size:15px;
		margin:1px 10px 1px 10px;
	}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/signUp.do" method="post">
		<div style="border:1px solid gray; height:auto; width:280px;">
			<div style="margin: 10px 10px 1px 10px;" class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
			<table>
				<tr>
					<td><hr /></td>
				</tr>
				<tr>
					<td><label>닉네임</label></td>
				</tr>
				<tr>
					<td><input type="text" name="nickName" id="nickName" placeholder="사용하실 닉네임을 입력해주세요" onchange="checkNickName();"/></td>
				</tr>
				<tr>
					<td><label>이메일 주소</label></td>
				</tr>
				<tr>
					<td><input type="email" name="email" id="email" placeholder="이메일 주소를 입력해주세요" onchange="checkEmail();"/></td>
				</tr>
				<tr>
					<td><input type="email" name="emailCheck" id="emailCheck" placeholder="이메일 주소를 확인합니다" onchange="checkedEmail();"/></td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
				</tr>
				<tr>
					<td><input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요" onchange="checkedPassword();"/></td>
				</tr>
				<tr>
					<td><input type="password" name="passwordCheck" id="passwordCheck" placeholder="비밀번호를 확인합니다" onchange="checkedPassword();"/></td>
				</tr>
				<tr>
					<td><input type="submit" id="submit" value="회원가입" style="border:1px solid gray; background-color:gray;" disabled /></td>
				</tr>
				<tr>
					<td><hr /></td>
				</tr>
				<tr>
					<td><p align="center">이미 계정이 있으신가요?<br>
						<a href="./login.jsp" style="color:red; text-decoration:none;">기존 계정으로 로그인하기</a></p></td>
				</tr>				
			</table>
		</div>
	</form>
	<script>
		var nnChk = 0;
		var eChk = 0;
		var pChk = 0;
		
		function checkNickName() {
			var nickname = $("#nickName").val();
			$.ajax({
				data : { nickName : nickname },
				url : "/crojecter/checkNickName.do",
				type : "post",
				success : function(data) {
					if(nickname == "") {
						$("#nickName").css("background-color", "white");
						nnChk = 0;
					} else if(data == "success") {
						nnChk = 1;
						$("#nickName").css("background-color", "#B7F400");
					} else {
						nnChk = 0;
						$("#nickName").css("background-color", "#FFA5A5");
					}
				}
			});
			memberVerify();
		}
		
		function checkEmail() {
			var email = $("#email").val();
			$.ajax({
				data : { eMail : email },
				url : "/crojecter/checkEmail.do",
				type : "post",
				success : function(data) {
					if(email == "") {
						$("#email").css("background-color", "white");
						eChk = 0;
					} else if(data == "success") {
						eChk = 1;
						$("#email").css("background-color", "#B7F400");
					} else {
						eChk = 0;
						$("#email").css("background-color", "#FFA5A5");
					}
				}
			});		
			memberVerify();
		}
		
		function checkedEmail() {
			var email = $("#email").val();
			var emailChk = $("#emailCheck").val();
			
			if(emailChk == "") {
				$("#emailCheck").css("background-color", "white");
			} else if(email == emailChk) {
				$("#emailCheck").css("background-color", "#B7F400");
			} else {
				$("#emailCheck").css("background-color", "#FFA5A5");
			}
			memberVerify();
		}
		
		function checkedPassword() {
			var pwd = $("#password").val();
			var pwdChk = $("#passwordCheck").val();
			
			if(pwd != "" && pwdChk != "" && pwd == pwdChk) {
				pChk = 1;
				//$("#password").css("background-color", "#B7F400");
				$("#passwordCheck").css("background-color", "#B7F400");
			} else if(pwdChk == "") {
				$("#passwordCheck").css("background-color", "white");
				pChk = 0;
			} else {
				pChk = 0;
				//$("#password").css("background-color", "#FFA5A5");
				$("#passwordCheck").css("background-color", "#FFA5A5");
			}
			
			memberVerify();
		}
		
		function memberVerify(){
			if(nnChk == 1 && eChk == 1 && pChk == 1){
				$("#submit").removeAttr("disabled");
				$("#submit").css("background-color", "tomato");
				$("#submit").css("border", "1px solid tomato");
			} else {
				$("#submit").attr("disabled", "disabled");
				$("#submit").css("background-color", "gray");
				$("#submit").css("border", "1px solid gray");
			}
		}
		
	</script>
</body>
</html>