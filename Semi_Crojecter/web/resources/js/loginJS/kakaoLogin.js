//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('f4ec76ed4dda9e7827bf8bd07f28db6a');
	// 카카오 로그인 함수입니다.
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
          console.log(authObj);
          // https://developers.kakao.com/docs/restapi/user-management#%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%A0%95%EB%B3%B4-%EC%9A%94%EC%B2%AD
          Kakao.API.request({
              url: '/v1/user/me',
              success: function(res) {
            	console.log(JSON.stringify(authObj.accessToken));
                console.log(JSON.stringify(res.kaccount_email));
                console.log(JSON.stringify(res.id));
                console.log(JSON.stringify(res.properties.profile_image));
                console.log(JSON.stringify(res.properties.nickname));
                $('#userId').val(res.kaccount_email);
                $('#userNickName').val(res.properties.nickname);
                $('#userPwd').val(authObj.accessToken);
                $('#loginForm').submit();
              },
              fail: function(error) {
                alert("1" + JSON.stringify(error));
              }
            });
        },
        fail: function(err) {
          alert("2" + JSON.stringify(err));
        }
      });
    };
  //]]>