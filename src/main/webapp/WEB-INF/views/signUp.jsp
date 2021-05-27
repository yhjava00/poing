<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			.signUp_box {
				width: 500px;
				margin: 0 auto;
			}
			h2 {
				margin-top: 100px;
				padding: 0 0 40px 0;
				font-size: 2.0rem;
				text-align: center;
				font-weight: 700;
			}
			.input_box {
    			margin-bottom: 15px;
				width: 100%;
				border: 1px solid rgba(196, 187, 171, 1);
				font-family: Noto Sans KR,sans-serif;
				font-weight: 400;
				align-items: center;
			}
			.input_box > input {
				border: none;
				box-shadow: none;
				font-size: 1.2rem;
				box-sizing: border-box;
				width: 100%;
				padding: 15px 15px;
			}
			.signUp_box button {
    			border: 1.3px solid #c4bbab;
				width: 100%;
				height: 48px;
				border-radius: 24px;
				font-size: 16px;
				font-weight: 500;
    			color: #c4bbab;
				cursor: pointer;
				margin-bottom: 10px;
			}
			.signUp_btn {
				background-color: rgba(236, 36, 57, 1);
				color: #fff !important;
				font-weight: 700 !important;
			}
			.signUp_box > div {
				margin-bottom: 100px;
			}
			.signUp_box a {
				align-self: center;
				font-size: .7rem;
    			color: rgba(236, 36, 57, 1);
				text-decoration: underline;
			}
		</style>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="signUp_box">
			<h2>회원가입</h2>
			<div>
				<form action="">
					<div class="input_box">
						<input type="text" name="nickName" placeholder="닉네임 입력">
					</div>
					<div class="input_box">
						<input type="text" name="email" placeholder="이메일 입력">
					</div>
					<div class="input_box">
						<input type="text" name="pw" placeholder="비밀번호 (6~16자)">
					</div>
					<div class="input_box">
						<input type="text" name="pwCheck" placeholder="비밀번호 확인">
					</div>
				</form>
				<button class="signUp_btn">가입완료</button>
				<div style="text-align: center;">
					<a href="login">이미 회원이신가요? 로그인</a>
				</div>
			</div>
			<div>
				<button>네이버로 가입하기</button>
				<button>카카오톡으로 가입하기</button>
			</div>
		</div>
	</body>
</html>