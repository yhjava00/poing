<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			.main_footer {
				border-top: rgba(235, 0, 25, 1) solid 1px;
				background-color: #fff;
				float: left;
				width: 100%;
				position: relative;
				padding: 30px 0 0 0;
				z-index: 50;
				overflow: hidden;
			}
			.footer_container {
				max-width: 1224px;
				width: 92%;
				margin: 0 auto;
				position: relative;
				z-index: 5;
			}
			.ft-wrap {
				float: left;
				width: 100%;
				position: relative;
			}
			.footer_div {
			float: left;
			width: 50%;
			}
			.footer_div:first-child {
    			padding-left: 100px;
				margin-top: 15px;
				padding-top: 15px;
				position: relative;
   				width: 512px;
			}
			.footer_div:last-child {
    			position: relative;
			}
			.hhj {
				color: black;
				text-align: left;
				font-size: 20px;
			}
			.footer_div > ul {
				margin-top: 15px;
				padding-top: 15px;
			}
			.footer_div li {
				color: black;
				float: left;
				width: 100%;
				text-align: left;
				padding: 5px 0;
				font-size: 15px;
			}
		</style>
	</head>
	<body>
		<footer class="main_footer">
			<div class="footer_container">
				<div>
					<div class="ft-wrap">
						<div class="ft-wrap" style="margin-bottom: 50px;overflow: hidden;">
							<div class="footer_div">
								<p class="hhj">고객센터</p>
								<p style="padding:10px 0 10px 0; font-size: 25px; font-weight: 500; color: black;">0000-0000</p>
								<p style="text-align: left;">평일 09:00~12:00 (주말,공휴일 휴무)</p>
								<br>
								<a href="#" style="font-size: 17px;">1:1상담</a>
								<p>평일 09:00~17:00</p>
								<p>(점심시간 12:00~13:30 / 주말&공휴일 휴무)</p>
							</div>
							<div class="footer_div">
								<ul class="ft-warp">
									<li>
										이용 약관
										&nbsp; | &nbsp;
										<b>개인정보 처리방침</b>
										&nbsp; | &nbsp;
										사업자 정보확인
									</li>
									<li>
										<span style="width: 100%" class="footer_text">  상호명 : (주)포잉 | 사업자 등록 번호 : 123-45-67890</span> <span class="footer_text_division"></span><br>
										<span class="footer_text"> 대표자  : 이순신, 김유신 |</span>
										<span style="font-size: 13px;"> 서울 종로구 사직로 161</span><br>
										<span class="footer_text">   통신판매업신고번호 : 제2010-서울사직로-0000호 | </span> <span style="font-weight: 500;" class="footer_text">  abcde@gmail.com</span><br>
										<span class="footer_text">   개인정보 관리 책임자 : 홍길동(hong@gamil.com) </span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</body>
</html>