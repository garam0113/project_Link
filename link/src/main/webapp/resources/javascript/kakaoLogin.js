function kakaoLogin() {

	window.Kakao.init('59386325ca13cdc634dfe162b470c978');

	window.Kakao.Auth.login({
		scope: 'profile_nickname, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
		success: function(response) {
			console.log(response) // 로그인 성공하면 받아오는 데이터
			window.Kakao.API.request({ // 사용자 정보 가져오기 
				url: '/v2/user/me',
				success: (res) => {
					const kakao_account = res.kakao_account;
					console.log(kakao_account)
					console.log(kakao_account.profile.nickname)
					console.log(kakao_account.email)
					var name = kakao_account.profile.nickname;
					$(".kakao").val(name);
					sessionStorage.setItem("user", kakao_account.profile.nickname);

					console.log(sessionStorage.getItem("user"));
					console.log($(".kakao").val());
				}
			});
			// window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
		},
		fail: function(error) {
			console.log(error);
		}
	});

	// $("form").attr("method","POST").attr("action","/user/snsLogin").attr("target","_parent").submit();
}