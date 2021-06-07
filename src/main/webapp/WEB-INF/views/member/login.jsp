<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			.login_box {
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
			.login_box button {
    			border: 1.3px solid #c4bbab;
				width: 100%;
				height: 48px;
				border-radius: 24px;
				font-size: 16px;
				cursor: pointer;
				margin-bottom: 10px;	
			}
			.signUp_btn {
				background-color: #c4bbab;
				color: #fff;
				font-weight: 700;
			}
			.login_btn {
				background-color: rgba(236, 36, 57, 1);
				color: #fff;
				font-weight: 700;
			}
			.naver_login_btn {
				background-color: rgba(25, 206, 96, 1);
				color: #fff;
				font-weight: 700;
			}
			.login_box > div {
				margin-bottom: 100px;
			}
			.login_box a {
				align-self: center;
				font-size: .7rem;
    			color: #c4bbab;
				text-decoration: underline;
			}
		</style>
		<script>
			$(document).ready(function() {
	            $(".enter").keydown(function(key) {
	                if (key.keyCode == 13) {
	                    login()
	                }
	            });
	        });
			function login() {
				var id = $('.loginId').val()
				var pw = $('.loginPW').val()
				
				var emailTest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i

				if(!emailTest.test(id)&&id!=='admin') {
					alert('아이디는 이메일을 입력하세요.')
					return
				}
				
				if(pw==='') {
					alert('비밀번호를 입력하세요.')
					return
				}
				
				$.ajax({
			        type: "post", 
			        url: "login.do", 
			        data: {'id':id, 'pw':pw},
			        success:function (data, textStatus) {
			        	if(data=='no member') {
			        		alert('존재하지 않는 회원입니다.');
			        	}else if(data=='incorrect pw') {
			        		alert('잘못된 비밀번호입니다.');
			        	}else {
			        		location.href='main';
			        	}
			        },
			        error:function (data, textStatus) {
			        	alert('에러가 발생했습니다.');
			        }
			    });
			}
			$(document).ready(function() {
				
			})
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="login_box">
			<h2>로그인</h2>
			<div>
				<form action="">
					<div class="input_box">
						<input type="text" class="loginId enter" name="loginId" placeholder="이메일 입력">
					</div>
					<div class="input_box">
						<input type="password" class="loginPW enter" name="loginPW" placeholder="비밀번호 (6~16자)">
					</div>
				</form>
				<button class="login_btn" onclick="login()">로그인</button>
				<div style="text-align: center;">
					<a href="findPw">비밀번호 찾기</a>
				</div>
			</div>
			<div>
				<button class="naver_login_btn">네이버 로그인</button>
				<button class="signUp_btn" onclick="location.href='signUp'">회원가입</button>
			</div>
		</div>
	</body>
</html>