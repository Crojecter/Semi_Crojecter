<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%-- <% Member m = (Member)session.getAttribute("member"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CopyRight 홈페이지에 오신걸 환영합니다.</title>
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
</style>
</head>
<body>
	<%-- <%@ include file="../common/header.jsp" %> --%>
	<form action="<%=request.getContextPath()%>/login.do" method="post">
		<table>
			<tr>
				<td colspan="2" align="center"><label id="loginLabel">COPYRIGHT</label></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img src="<%=request.getContextPath()%>/resources/images/user.png" class="loginImg"/>
					<input type="email" name="email" class="loginInput" placeholder="User-email" style="width:180px"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img src="<%=request.getContextPath()%>/resources/images/pw.png" class="loginImg"/>
					<input type="password" name="password" class="loginInput" placeholder="****" style="width:180px"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" class="loginInput submit" value="로그인" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div style="margin: 10px 10px 10px 10px;" class="fb-login-button" data-max-rows="1" data-size="large"
					 data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
				</td>
			</tr>
			<tr style="font-size:12px;">
					<td align="left"><a href="./searchPassword.jsp" style="text-decoration:none;">닉네임/비밀번호 찾기</a></td>
					<td align=right><a href="./signUp.jsp" style="text-decoration:none;">회원가입</a></td>
			</tr>
		</table>
	</form>
	
	<div id="fb-root"></div>
	<%@ include file="../common/footer.jsp" %>
	<script>
		/* (function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
  			if (d.getElementById(id)) return;
  			js = d.createElement(s); js.id = id;
 			js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2&appId=346147516146393&autoLogAppEvents=1';
  			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk')); */
		
		window.fbAsyncInit = function() {
			FB.init({
				appId : '346147516146393',
				cookie : true,
				xfbml : true,
				version : 'v3.2'
			});

			FB.AppEvents.logPageView();

		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2&appId=346147516146393&autoLogAppEvents=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		

		FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		});
		

		function checkLoginState() {
		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		  });
		}
	</script>
</body>
</html>