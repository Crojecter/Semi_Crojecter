<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<style>
	h3,p,input{ margin-left:10px; margin-right:10px; }
	input[type=submit]{
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
	<div style="border:1px solid black; height:auto; width:280px;">
		<h3>비밀번호 찾기</h3>
		<hr />
		<p>회원가입 시 사용하신 닉네임과<br>
			이메일주소를 입력하시면<br>
			임시 비밀번호를 보내드립니다.</p>
		<hr />
		<form action="<%=request.getContextPath()%>/send.do">
			<input type="text" name="nickName" placeholder="가입하신 닉네임" style="width:250px; font-size:20px; margin-bottom:10px;" /><br>
			<input type="email" name="email" placeholder="가입하신 이메일 주소" style="width:250px; font-size:20px;" /><br>
			<input type="submit" value="임시 비밀번호 받기" />
		</form>
	</div>
</body>
</html>