<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//임시비밀번호 발생
	String tempPassword = "";

	for (int i = 0; i < 8; i++) {

		int rndVal = (int) (Math.random() * 62);

		if (rndVal < 10) {
			tempPassword += rndVal;
		} else if (rndVal > 35) {
			tempPassword += (char) (rndVal + 61);
		} else {
			tempPassword += (char) (rndVal + 55);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
	.any{ margin-left:10px; margin-right:10px; }
	.button{
		background:tomato;
		color:white;
		border:1px solid tomato;
		text-align:center;
		border-radius:5px;
		height:50px;
		width:250px;
		font-size:15px;
		margin:10px 10px 10px 10px;
	}
</style>
</head>
<body>
	<div style="border:1px solid black; height:auto; width:290px; float:left; margin:10px 10px 10px 10px">
		<h3 class="any">닉네임 찾기</h3>
		<hr />
		<p class="any">회원가입 시 사용하신 이메일주소를<br>입력하세요.</p><br>
		<hr />
		<form>
			<input type="email" id="email" name="email" class="any" placeholder="가입하신 이메일 주소" style="width:250px; font-size:20px;" /><br>
			<label id="labelNickname" style="margin-left:10px; margin-top:10px; visibility:hidden;"></label><br>
			<input type="button" class="button any" value="닉네임 찾기" onclick="searchNickName();"/>
		</form>
	</div>
	<script>
		function searchNickName() {
			var email = $("#email").val();
			$.ajax({
				data : { eMail : email },
				url : "/crojecter/searchNickname.do",
				type : "get",
				success : function(data) {
					console.log(data);
					if(data != null) {
						if(data == "fail") {
							$("#labelNickname").css("visibility", "visible");
							$("#labelNickname").css("color", "red");
							$("#labelNickname").text("존재하지 않은 이메일 입니다.");
						} else {
							$("#labelNickname").css("visibility", "visible");
							$("#labelNickname").css("color", "black");
							$("#labelNickname").text("회원님의 닉네임은 ' " + data + " '입니다.");
						}
					} else {
						$("#labelNickname").css("visibility", "hidden");
					}
				}
			});
		}
	</script>
	
	<div style="border:1px solid black; height:auto; width:280px; float:left; margin:10px 10px 10px 10px">
		<h3 class="any">비밀번호 찾기</h3>
		<hr />
		<p class="any">회원가입 시 사용하신 닉네임과<br>
			이메일주소를 입력하시면<br>
			임시 비밀번호를 보내드립니다.</p>
		<hr />
		<form action="<%=request.getContextPath()%>/send.do">
			<input type="text" name="nickName" class="any" placeholder="가입하신 닉네임" style="width:250px; font-size:20px; margin-bottom:10px;" /><br>
			<input type="email" name="email" class="any" placeholder="가입하신 이메일 주소" style="width:250px; font-size:20px;" /><br>
			<input type="text" name="tempPassword" class="any" style="visibility:hidden;" value="<%= tempPassword %>"/>
			<input type="text" name="tempPwd" class="any" style="visibility:hidden;" value="<%= tempPassword %>"/>
			<input type="submit" id="submit" class="button any" value="임시 비밀번호 받기" />
		</form>
	</div>
</body>
</html>