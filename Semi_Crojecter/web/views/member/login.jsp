<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%-- <% Member m = (Member)session.getAttribute("member"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<!-- 카카오 로그인 JS -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="../../resources/js/loginJS/kakaoLogin.js"></script>
<style>
	.loginInput{
		width:250px;
		height:25px;
		margin:5px 10px 1px 10px;
		border:1px solid gray;
	}
	#loginLabel{
		width:250px;
		height:25px;
		margin:5px 10px 1px 10px;
		font-size:30px;
	}
	.submit{
		background:tomato;
		color:white;
		border:1px solid tomato;
		text-align:center;
		border-radius:5px;
		height:40px;
		font-size:15px;
		margin:1px 10px 1px 10px;
	}
	.loginImg{
		border:0px;
		width:25px;
		height:25px;
	}
	.wrapper{
		width:270px;
		margin:0 auto;
		margin-top:300px;
		margin-bottom:300px;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="wrapper">
		<form action="<%=request.getContextPath()%>/login.do" method="post">
			<table>
				<tr>
					<td colspan="2" align="center"><label id="loginLabel">COPYRIGHT</label></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><img
						src="<%=request.getContextPath()%>/resources/images/user.png"
						class="loginImg" /> <input type="email" name="email"
						class="loginInput" placeholder="User-email" style="width: 180px" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><img
						src="<%=request.getContextPath()%>/resources/images/pw.png"
						class="loginImg" /> <input type="password" name="password"
						class="loginInput" placeholder="****" style="width: 180px" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						class="loginInput submit" value="로그인" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div style="margin: 10px 10px 10px 10px;" class="fb-login-button"
							data-max-rows="1" data-size="large" data-button-type="login_with"
							data-show-faces="false" data-auto-logout-link="false"
							data-use-continue-as="false"></div>
					</td>
				</tr>
				<tr style="font-size: 12px;">
					<td align="left"><a href="./searchPassword.jsp"
						style="text-decoration: none;">닉네임/비밀번호 찾기</a></td>
					<td align=right><a href="./signUp.jsp"
						style="text-decoration: none;">회원가입</a></td>
				</tr>
				<tr>
					<td colspan="2"><hr /></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size:12px;">소셜 계정으로 회원가입 하기</td>
				</tr>
				<tr>
					<td>
						<a id="kakaoLogin" href="javascript:loginWithKakao();">
						<img class="sns_login" id="kakaoLoginBtn" src="../../resources/images/kakao_btn.png"/>
						</a>
					</td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="fb-root"></div>
	<%@ include file="../common/footer.jsp" %>
	<script>
		
	</script>
</body>
</html>