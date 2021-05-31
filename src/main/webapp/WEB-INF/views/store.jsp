<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
		<meta charset="UTF-8">
		<style>
			.store_box {
				width: 60%;
				margin: 0 auto;
				display: flex;
				-webkit-box-orient: horizontal;
				-webkit-box-direction: normal;
				flex-direction: row;
				flex-wrap: nowrap;
				-webkit-box-pack: justify;
				justify-content: space-between;
				-webkit-box-align: start;
				align-items: flex-start;
			}
			.storeASide {
				width: 100%;
				margin-right: 22px;
			}
			.storeASide h1 {
				font-size: 24px;
				margin-bottom: 10px;
			}
			.storeASide p {
				margin-top: 2px;
				font-size: 14px;
				color: #c4bbab;
				line-height: 18px;
			}
			.storeASide > div {
				width: 600px;
				margin: 0 auto;
			}
			.storeASide section {
				border-top: 3px solid #eb0019;
			}
			.storeBSide {
				position: sticky;
				top: 75px;
				margin-top: 16px;
				width: 700px;
				height: 100px;
				background-color: yellow;
			}
			.swiper-container {
				width: 600px;
				height: 450px;
			}

			.swiper-slide {
				text-align: center;
				font-size: 18px;
				background: #fff;

				/* Center slide text vertically */
				display: -webkit-box;
				display: -ms-flexbox;
				display: -webkit-flex;
				display: flex;
				-webkit-box-pack: center;
				-ms-flex-pack: center;
				-webkit-justify-content: center;
				justify-content: center;
				-webkit-box-align: center;
				-ms-flex-align: center;
				-webkit-align-items: center;
				align-items: center;
			}

			.swiper-slide img {
				display: block;
				width: 100%;
				height: 100%;
				object-fit: cover;
			}
			/* 별점 */
            .MuiRating-readOnly {
                pointer-events: none;
            }
            .MuiRating-root {
                color: #ffb400;
                cursor: pointer;
                display: inline-flex;
                position: relative;
                font-size: 2.4rem;
                text-align: left;
                -webkit-tap-highlight-color: transparent;
            }
            .MuiRating-decimal {
                position: relative;
            }
            .jss1019 {
                margin: 0;
            }
            .MuiRating-icon {
                display: flex;
                transition: transform 150ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
                pointer-events: none;
            }
            .MuiSvgIcon-root {
                fill: currentColor;
                width: 1em;
                height: 1em;
                display: inline-block;
                font-size: 2.4rem;
                transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
                flex-shrink: 0;
                user-select: none;
            }
            .jss1020 {
				margin-bottom: 10px;
                flex: none;
            }
            .jss1020 svg {
                width: 18px;
                height: 18px;
            }
            .jss1021 path {
                fill: rgba(247, 168, 7, 1);
            }
            /* 별점 */
		</style>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="store_box">
			<section class="storeASide">
				<div>
					<h1>스시 진수</h1>
					<span class="MuiRating-root jss1020 MuiRating-readOnly" role="img" aria-label="5 Stars">
						<span class="MuiRating-decimal">
							<span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
							<span>
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
						</span>
						<span class="MuiRating-decimal">
							<span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
							<span>
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
						</span>
						<span class="MuiRating-decimal">
							<span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
							<span>
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
						</span>
						<span class="MuiRating-decimal">
							<span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
							<span>
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
						</span>
						<span class="MuiRating-decimal">
							<span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
							<span>
								<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
									<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
								</span>
							</span>
						</span>
					</span>
					<span>4.5</span>
					<p class="recommend_p2" style="display: inline;">(265)</p>
					<p>서초동에 가격 대비 알찬 구성을 선보이는 미들급 스시야</p>
					<p style="margin-bottom: 10px;">서울 서초구 · 일식</p>
					<div class="swiper-container mySwiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="https://c2.poing.co.kr/PIMAGE-original/MjAyMDA2/15934078575ef979715708c.png">
							</div>
							<div class="swiper-slide">Slide 2</div>
							<div class="swiper-slide">Slide 3</div>
							<div class="swiper-slide">Slide 4</div>
							<div class="swiper-slide">Slide 5</div>
							<div class="swiper-slide">Slide 6</div>
							<div class="swiper-slide">Slide 7</div>
							<div class="swiper-slide">Slide 8</div>
							<div class="swiper-slide">Slide 9</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<style>
						.storeASide section {
							margin: 9px 0 22px;
							font-size: 17px;
							font-weight: 500;
							line-height: 25px;
						}
						.storeASide h3 {
							margin: 9px 0 22px;
							font-size: 17px;
							font-weight: 700;
							line-height: 25px;
						}
						dl {
							overflow: hidden;
							margin-top: 9px;
							line-height: 24px;
						}
						dt {
							float: left;
							width: 70px;
							font-size: 14px;
							font-weight: 700;
						}
						dd {
							overflow: hidden;
							font-size: 14px;
							font-weight: 500;
							white-space: pre-wrap;
						}
						.count {
							color: #eb0019;
							font-size: 12px;
							font-weight: 700;
							line-height: 1.67;
						}
					</style>
					<section>
						<h3>매장 정보</h3>
						<dl>
							<dt>주소</dt>
							<dd>서울 서초구 서초중앙로24길 27</dd>
						</dl>
						<dl>
							<dt>전화</dt>
							<dd>02-000-0000</dd>
						</dl>
						<dl>
							<dt>영업시간</dt>
							<dd>12:00~14:30, 18:00~21:40 (L.O 20:30)</dd>
						</dl>
						<dl>
							<dt>휴무일</dt>
							<dd>연중무휴</dd>
						</dl>
						<dl>
							<dt>주차</dt>
							<dd>가능</dd>
						</dl>
					</section>
					<style>
						.review_box {
						margin-top: 10px;
						}
						.review_title {

						}
						.review_profile {
							width: 46px;
							height: 46px;
							position: relative;
							left: 0px;
							top: 0px;
						}
						.review_profile > img {
							width: 46px;
							height: 46px;
						}
						.review_name_box {
							position: relative;
							left: 46px;
							top 0px;
						}
					</style>
					<section>
						<h3 style="display: inline;">리뷰</h3>
						<span class="count">(336)</span>
						<div class="review_box">
							<div class="review_title">
								<div class="review_profile">
									<img src="${contextPath}/resources/user_none.png">
								</div>
								<div class="review_name_box">
									<p>이순신</p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
				<script>
				var swiper = new Swiper(".mySwiper", {
					navigation: {
					nextEl: ".swiper-button-next",
					prevEl: ".swiper-button-prev",
					},
				});
				</script>
			</section>
			<div class="storeBSide">

			</div>
		</div>
	</body>
</html>