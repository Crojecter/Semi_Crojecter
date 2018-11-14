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
			console.log("ID: " + profile.getId()); // Don't send this directly to your server!
			console.log('Full Name: ' + profile.getName());
			console.log('Given Name: ' + profile.getGivenName());
			console.log('Family Name: ' + profile.getFamilyName());
			console.log("Image URL: " + profile.getImageUrl());
			console.log("Email: " + profile.getEmail());

			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);

			// 한번 로그인했던 계정에 대한 자동로그인 막기
			auth2.disconnect()
		}, function(error) {
			console.log('Sign-in error', error);
		});
	});

	element = document.getElementById('googleLogin');
}