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
	                	findPw()
	                }
	            });
	        });
			function findPw() {
				var id = $('.loginId').val()
				
				var emailTest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i

				if(!emailTest.test(id)&&id!=='admin') {
					alert('아이디는 이메일을 입력하세요.')
					return
				}
				
				$.ajax({
			        type: "post", 
			        url: "findPw.do", 
			        data: {'id':id},
			        success:function (data, textStatus) {
			        	if(data=='no member') {
			        		alert('존재하지 않는 회원입니다.');
			        	}else {
			        		alert('새로운 비밀번호를 보냈습니다.')
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
		<div class="login_box">
			<h2>비밀번호를 잊으셨나요?</h2>
			<div>
				<form name="f">
					<div class="input_box">
						<input type="text" class="loginId enter" name="loginId" placeholder="이메일 입력">
					</div>
				</form>
				<button class="login_btn" onclick="findPw()">이메일로 비밀번호 찾기</button>
			</div>
		</div>
	</body>
</html>