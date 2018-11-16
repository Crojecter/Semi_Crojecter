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
<!-- 구글 로그인 JS -->
<meta name="google-signin-client_id" content="47962283340-c9v8pn66vso3ktgruqjj7vi40ne4kle3.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=onLoadGoogleCallback" async defer></script>
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
		width:290px;
		margin:0 auto;
		margin-top:230px;
		margin-bottom:230px;
		border:1px solid black;
		border-radius:20px;
		padding:10px 10px 10px 10px;
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
						style="padding-left:20px; text-decoration: none;">내정보 찾기</a></td>
					<td align=right><a href="./signUp.jsp"
						style="padding-right:20px; text-decoration: none;">회원가입</a></td>
				</tr>
				<tr>
					<td colspan="2"><hr /></td>
				</tr>
				<tr>
					<td align="center" colspan="2" style="font-size:12px;">소셜 계정으로 회원가입 하기</td>
				</tr>
				<tr>
					<td colspan="2"><br></td>
				</tr>
				<tr>
					<td align="center" style="width:50%;">
						<a id="kakaoLogin" onclick="loginWithKakao();" style="cursor:pointer">
						<img class="sns_login" id="kakaoLoginBtn" src="../../resources/images/kakao_btn.png" width="68" height="69"/>
						</a>
					</td>
					<td align="center" style="width:50%;">
						<a id="googleLogin" onclick="onLoadGoogleCallback();" style="cursor:pointer">
						<img class="sns_login" id="googleLoginBtn" src="../../resources/images/google-plus.png" width="68" height="69"/>
						</a>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="fb-root"></div>
	<%@ include file="../common/footer.jsp" %>
	<script>
	// 구글 로그인 관련 설정
	// http://hyunwoona.tistory.com/entry/%EA%B5%AC%EA%B8%80-%EB%A1%9C%EA%B7%B8%EC%9D%B8API-%EC%97%B0%EB%8F%99
	// 구글 커스텀 버튼 적용
	// https://developers.google.com/identity/sign-in/web/build-button
	function onLoadGoogleCallback() {
		gapi.load('auth2', function() {
			auth2 = gapi.auth2.init({
				client_id : '47962283340-c9v8pn66vso3ktgruqjj7vi40ne4kle3.apps.googleusercontent.com',
				cookiepolicy : 'single_host_origin',
				scope : 'profile'
			});

			auth2.attachClickHandler(element, {}, function(googleUser) {

				var profile = googleUser.getBasicProfile();

				//console.log("ID: " + profile.getId()); // Don't send this directly to your server!
				console.log('Full Name: ' + profile.getName()); // 닉네임
				//console.log('Given Name: ' + profile.getGivenName());
				//console.log('Family Name: ' + profile.getFamilyName());
				//console.log("Image URL: " + profile.getImageUrl());
				console.log("Email: " + profile.getEmail()); // 이메일

				window.location.href="./signUp.jsp?nickName="+profile.getName()+"&email="+profile.getEmail();
				
				// The ID token you need to pass to your backend:
				var id_token = googleUser.getAuthResponse().id_token;
				//console.log("ID Token: " + id_token);

				// 한번 로그인했던 계정에 대한 자동로그인 막기
				auth2.disconnect()
			}, function(error) {
				console.log('Sign-in error', error);
			});
		});

		element = document.getElementById('googleLogin');
	}
	
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('f4ec76ed4dda9e7827bf8bd07f28db6a');
	// 카카오 로그인 함수입니다.
    function loginWithKakao() {
      	// 로그인 창을 띄웁니다.
      	Kakao.Auth.login({
        success: function(authObj) {
          //alert(JSON.stringify(authObj));
          console.log(authObj);
          // https://developers.kakao.com/docs/restapi/user-management#%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%A0%95%EB%B3%B4-%EC%9A%94%EC%B2%AD
          Kakao.API.request({
              url: '/v1/user/me',
              success: function(res) {
            	//console.log(JSON.stringify(authObj.accessToken));
                console.log(JSON.stringify(res.kaccount_email)); // 이메일
                //console.log(JSON.stringify(res.id));
                //console.log(JSON.stringify(res.properties.profile_image));
                console.log(JSON.stringify(res.properties.nickname)); // 닉네임
                
                window.location.href="./signUp.jsp?nickName="+res.properties.nickname+"&email="+res.kaccount_email;
                
              },
              fail: function(error) {
                alert("1" + JSON.stringify(error));
              }
            });
       		// 한번 로그인했던 계정에 대한 자동로그인 막기
          	Kakao.API.request({url: '/v1/user/logout'});
        },
        fail: function(err) {
          alert("2" + JSON.stringify(err));
        }
      });
    };
  //]]>
	</script>
	<!-- <div id="container" style="display:none;"></div> -->
</body>
</html>