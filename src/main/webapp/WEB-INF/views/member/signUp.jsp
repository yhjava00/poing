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
				cursor: pointer;
				margin-bottom: 10px;
			}
			.signUp_btn {
				background-color: rgba(236, 36, 57, 1);
				color: #fff;
				font-weight: 700;
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
		<script type="text/javascript">
			$(document).ready(function() {
	            $(".enter").keydown(function(key) {
	                if (key.keyCode == 13) {
	                	signUp()
	                }
	            });
	        });
			function signUp() {
				var nickname = $('.nickname').val()
				var email = $('.email').val()
				var pw = $('.pw').val()
				var pwCheck = $('.pwCheck').val()

				var emailTest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
				var pwTest = /(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,16}$/

				if(nickname==='') {
					alert('닉네임을 입력하세요.')
					return
				}
				
				if(!emailTest.test(email)) {
					alert('이메일을 입력하세요.')
					return
				}
				
				if(!pwTest.test(pw)) {
					alert('비밀번호의 길이는 6~16이어야 하고 1개 이상의 문자, 숫자, 특수문자를 포함하여야 합니다.')
					return
				}
				
				if(pw!==pwCheck) {
					alert('비밀번호가 일치하지 않습니다.')
					return
				}
				
				$.ajax({
			        type: "post", 
			        url: "signUp.do", 
			        data: {'id':email, 'pw':pw, 'nickname':nickname},
			        success:function (data, textStatus) {
			        	if(data=='Exist member') {
			        		alert('존재하는 이메일입니다.');
			        	}else {
			        		alert('회원가입에 성공하셨습니다.')
			        		location.href='main';
			        	}
			        },
			        error:function (data, textStatus) {
			        	alert('에러가 발생했습니다.');
			        }
			    });
			}
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="signUp_box">
			<h2>회원가입</h2>
			<div>
				<form class="f">
					<div class="input_box">
						<input type="text" class="nickname enter" name="nickname" placeholder="닉네임 입력">
					</div>
					<div class="input_box">
						<input type="text" class="email enter" name="email" placeholder="이메일 입력">
					</div>
					<div class="input_box">
						<input type="password" class="pw enter" name="pw" placeholder="비밀번호 (6~16자)">
					</div>
					<div class="input_box">
						<input type="password" class="pwCheck enter" name="pwCheck" placeholder="비밀번호 확인">
					</div>
				</form>
				<button class="signUp_btn" onclick="signUp()">가입완료</button>
				<div style="text-align: center;">
					<a href="login">이미 회원이신가요? 로그인</a>
				</div>
			</div>
		</div>
	</body>
</html>