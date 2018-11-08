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
	input, #text{
		width:250px;
		height:25px;
		margin:1px 10px 1px 10px;
	}
	button{
		color:white;
		text-align:center;
		border-radius:5px;
		height:40px;
		width:250px;
		font-size:15px;
		margin:1px 10px 1px 10px;
	}
</style>
</head>
<body>
	<form name="form" action="<%=request.getContextPath()%>/signUp.do" method="post">
		<div style="border:1px solid gray; height:auto; width:280px;">
			<div style="margin: 10px 10px 1px 10px;" class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
			<table>
				<tr>
					<td><hr /></td>
				</tr>
				<tr>
					<td><label id="text">닉네임</label></td>
				</tr>
				<tr>
					<td>
						<input type="text" name="nickName" id="nickName" placeholder="사용하실 닉네임을 입력해주세요" oninput="checkNickName();"/>
						<label id="labelNickname" style="color:red; text-align:center; font-size:10px; width:auto; margin:1px 10px 1px 10px;" >2~10 글자의 닉네임을 입력하세요. 특수문자 불가</label>
					</td>
				</tr>
				<tr>
					<td><label id="text">이메일 주소</label></td>
				</tr>
				<tr>
					<td><input type="email" name="email" id="email" placeholder="이메일 주소를 입력해주세요" oninput="checkEmail();"/></td>
				</tr>
				<tr>
					<td>
						<input type="email" name="emailCheck" id="emailCheck" placeholder="이메일 주소를 확인합니다" oninput="checkedEmail();"/>
						<label id="labelEmail" style="color:red; text-align:center; font-size:10px; width:auto; margin:1px 10px 1px 10px;" >이메일 형식에 맞지 않습니다.</label>
					</td>
				</tr>
				<tr>
					<td><label id="text">비밀번호</label></td>
				</tr>
				<tr>
					<td><input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요" oninput="checkedPassword();"/></td>
				</tr>
				<tr>
					<td>
						<input type="password" name="passwordCheck" id="passwordCheck" placeholder="비밀번호를 확인합니다" oninput="checkedPassword();"/>
						<label id="labelPwd" style="color:red; text-align:center; font-size:10px; width:auto; margin:1px 10px 1px 10px;" >6~12 글자의 비밀번호를 입력하세요.<br>&nbsp;&nbsp;영대문자 특수문자 숫자 최소 1개 이상 포함</label>
					</td>
				</tr>
				<tr>
					<td><button name="submit" id="submit" style="border:1px solid gray; background-color:gray;" onclick="singUpCheck();" disabled>회원가입</button></td>
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
						$("#labelNickname").css("visibility", "visible");
						$("#labelNickname").text('2~10 글자의 닉네임을 입력하세요. 특수문자 불가');
						nnChk = 0;
					} else if(data == "success") {
						// 닉네임 체크 성공시 정규식으로 한번더 검사해서 성공할 경우 아래 실행
						var regNickname = /^[가-힣|ㄱ-ㅎ|a-z|A-Z|0-9]{2,10}$/;
						
						if(regNickname.test(nickname)) {
							nnChk = 1;
							$("#nickName").css("background-color", "#B7F400");
							$("#labelNickname").css("visibility", "hidden");
						} else {
							nnChk = 0;
							$("#nickName").css("background-color", "#FFA5A5");
							$("#labelNickname").css("visibility", "visible");
							$("#labelNickname").text('2~10 글자의 닉네임을 입력하세요. 특수문자 불가');
						}
					} else {
						nnChk = 0;
						$("#nickName").css("background-color", "#FFA5A5");
						$("#labelNickname").css("visibility", "visible");
						$("#labelNickname").text('중복된 닉네임 입니다.');
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
						$("#labelEmail").css("visibility", "visible");
						$("#labelEmail").text('이메일 형식에 맞지 않습니다.');
						eChk = 0;
					} else if(data == "success") {
						// 이메일 체크 성공시 정규식으로 한번더 검사
						var regEmail = /^[a-zA-Z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
						
						if(regEmail.test(email)) {
							eChk = 1;
							$("#email").css("background-color", "#B7F400");	
							$("#labelEmail").css("visibility", "hidden");
						} else {
							eChk = 0;
							$("#email").css("background-color", "#FFA5A5");
							$("#labelEmail").css("visibility", "visible");
							$("#labelEmail").text('이메일 형식에 맞지 않습니다.');
						}
					} else {
						eChk = 0;
						$("#email").css("background-color", "#FFA5A5");
						$("#labelEmail").css("visibility", "visible");
						$("#labelEmail").text('중복된 이메일 입니다.');
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
				$("#labelEmail").css("visibility", "visible");
				eChk = 0;
			} else if(email == emailChk) {
				$("#emailCheck").css("background-color", "#B7F400");
				$("#labelEmail").css("visibility", "hidden");
				eChk = 1;
			} else {
				$("#emailCheck").css("background-color", "#FFA5A5");
				$("#labelEmail").css("visibility", "visible");
				eChk = 0;
			}
			memberVerify();
		}
		
		
		function checkedPassword() {
			var pwd = $("#password").val();
			var pwdChk = $("#passwordCheck").val();
			
			if (pwd != "" && pwdChk != "" && pwd == pwdChk) {
				// 비밀번호 정규식으로 검사
				var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,12}$/;
				
				if(regPwd.test(pwd)) {
					pChk = 1;
					$("#passwordCheck").css("background-color", "#B7F400");
					$("#labelPwd").css("visibility", "hidden");
				} else {
					pChk = 0;
					$("#passwordCheck").css("background-color", "#FFA5A5");
					$("#labelPwd").css("visibility", "visible");
				}
			} else if (pwdChk == "" || pwd == "") {
				$("#passwordCheck").css("background-color", "white");
				$("#labelPwd").css("visibility", "visible");
				pChk = 0;
			} else {
				pChk = 0;
				$("#passwordCheck").css("background-color", "#FFA5A5");
				$("#labelPwd").css("visibility", "visible");
			}

			memberVerify();
		}

		function memberVerify() {
			if (nnChk == 1 && eChk == 1 && pChk == 1) {
				$("#submit").removeAttr("disabled");
				$("#submit").css("background-color", "tomato");
				$("#submit").css("border", "1px solid tomato");
			} else {
				$("#submit").attr("disabled", "disabled");
				$("#submit").css("background-color", "gray");
				$("#submit").css("border", "1px solid gray");
			}
		}

		function singUpCheck() {

			$("#form").submit();

		}
	</script>
</body>
</html>