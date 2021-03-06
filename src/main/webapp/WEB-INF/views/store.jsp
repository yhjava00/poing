<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<% pageContext.setAttribute("replaceChar", "\n"); %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="storeAllVO" value="${storeInfo.storeAllVO}"/>
<c:set var="storeImgList" value="${storeInfo.storeImgList}"/>
<c:set var="reviewList" value="${storeInfo.reviewList}"/>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${contextPath}/resources/css/store.css?a">
		<script>
			var count = 2;

			$(document).ready(function() {

				$('.count_minus').click(function() {
					if(count===1) {
						alert('최소인원은 1명입니다.')
						return;
					}

					$('.count_view').text(--count + '명')
				})
				
				$('.count_plus').click(function() {
					if(count===4) {
						alert('최대인원은 4명입니다.')
						return;
					}

					$('.count_view').text(++count + '명')
				})
			})
			
			function like_store() {
				
				var like = ''
				
				var store_idx = $('.store_idx').val()
				
				if($('.like_btn').children('path').css('fill') === 'rgb(131, 131, 131)') {
					like = 1
					$('.like_btn').children('path').css('fill', 'rgb(238, 44, 48)')
				}else {					
					$('.like_btn').children('path').css('fill', 'rgb(131, 131, 131)')
					like = 0
				}
				
				$.ajax({
					type: 'post', 
					url: '/poing/iLikeThis.do', 
					data: {'like':like, 'idx':store_idx},
					success:function (data) {
						
						if(data === 'like') {
							alert('좋아요.')
						}else if(data === 'liked') {
							alert('좋아했었어요.')
						}else if(data === 'no member') {
							alert('로그인 후 이용하실 수 있습니다.')
							$('.like_btn').children('path').css('fill', 'rgb(131, 131, 131)')
						}
						
					},
					error:function () {
						alert('에러가 발생했습니다.')
					}
				})
			}
			
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="store_box">
			<section class="storeASide">
				<div>
					<h1>${storeAllVO.store_name}</h1>
					
					<c:choose>
                   		<c:when test="${storeAllVO.countAllReview == 0}">
                   			<c:set var="star" value="${storeAllVO.star}"/>
                   		</c:when>
                   		<c:otherwise>
                           	<c:set var="star" value="${storeAllVO.star / storeAllVO.countAllReview}"/>
                   		</c:otherwise>
                   	</c:choose>
					<span class="MuiRating-root jss1020 MuiRating-readOnly" role="img" aria-label="5 Stars">
							<c:forEach var="i" begin="1" end="5">
								<c:choose>
									<c:when test="${i<=star}">
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
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${i-star<1}">
												<span class="MuiRating-decimal">
													<span style="width: 50%; overflow: hidden; z-index: 1; position: absolute;">
														<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
															<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
														</span>
													</span>
													<span>
														<span class="MuiRating-icon jss1019 MuiRating-iconFilled">
															<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
														</span>
													</span>
												</span>	
											</c:when>
											<c:otherwise>
												<span class="MuiRating-decimal">
													<span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
														<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
															<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
														</span>
													</span>
													<span>
														<span class="MuiRating-icon jss1019 MuiRating-iconFilled">
															<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
														</span>
													</span>
												</span>	
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</span>
					<span>
                      	<fmt:formatNumber var="star" value="${star}"/>
                      	${fn:substring(star, 0, 3)}
                   	</span>
					<p class="thinP" style="display: inline;">(${storeAllVO.countAllReview})</p>
					<button onclick="like_store()" style="float: right; border: 0;">
						<c:choose>
							<c:when test="${storeAllVO.likeStore == 0}">
								<svg class="like_btn" xmlns="http://www.w3.org/2000/svg" version="1.1" x="0px" y="0px" viewBox="0 0 512 512" width="19px" height="19px">
									<path d="M376,30c-27.783,0-53.255,8.804-75.707,26.168c-21.525,16.647-35.856,37.85-44.293,53.268    c-8.437-15.419-22.768-36.621-44.293-53.268C189.255,38.804,163.783,30,136,30C58.468,30,0,93.417,0,177.514    c0,90.854,72.943,153.015,183.369,247.118c18.752,15.981,40.007,34.095,62.099,53.414C248.38,480.596,252.12,482,256,482    s7.62-1.404,10.532-3.953c22.094-19.322,43.348-37.435,62.111-53.425C439.057,330.529,512,268.368,512,177.514    C512,93.417,453.532,30,376,30z"></path>
								</svg>													
							</c:when>
							<c:otherwise>
								<svg class="like_btn" xmlns="http://www.w3.org/2000/svg" version="1.1" x="0px" y="0px" viewBox="0 0 512 512" width="19px" height="19px">
									<path style="fill: rgb(238, 44, 48);" d="M376,30c-27.783,0-53.255,8.804-75.707,26.168c-21.525,16.647-35.856,37.85-44.293,53.268    c-8.437-15.419-22.768-36.621-44.293-53.268C189.255,38.804,163.783,30,136,30C58.468,30,0,93.417,0,177.514    c0,90.854,72.943,153.015,183.369,247.118c18.752,15.981,40.007,34.095,62.099,53.414C248.38,480.596,252.12,482,256,482    s7.62-1.404,10.532-3.953c22.094-19.322,43.348-37.435,62.111-53.425C439.057,330.529,512,268.368,512,177.514    C512,93.417,453.532,30,376,30z"></path>
								</svg>													
							</c:otherwise>
						</c:choose>
					</button>
					<p class="thinP">${storeAllVO.introduce}</p>
					<p class="thinP" style="margin-bottom: 10px;">${storeAllVO.location1} ${storeAllVO.location2} · ${storeAllVO.category}</p>
					<div class="swiper-container mySwiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="${contextPath}/resources/store/${storeAllVO.idx}/${storeAllVO.main_img}">
							</div>
							<c:forEach var="img" items="${storeImgList}">
								<div class="swiper-slide">
									<img src="${contextPath}/resources/store/${storeAllVO.idx}/${img}">
								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<section>
						<h3>매장 정보</h3>
						<dl>
							<dt>주소</dt>
							<dd>${storeAllVO.addr}</dd>
						</dl>
						<dl>
							<dt>전화</dt>
							<dd>${storeAllVO.tel}</dd>
						</dl>
						<dl>
							<dt>영업시간</dt>
							<dd>${storeAllVO.opening_hours}</dd>
						</dl>
						<dl>
							<dt>휴무일</dt>
							<dd>${storeAllVO.closed_days}</dd>
						</dl>
						<dl>
							<dt>주차</dt>
							<dd>${storeAllVO.parking}</dd>
						</dl>
					</section>
					<section>
						<h3 style="display: inline;">리뷰</h3>
						<span class="count">(${storeAllVO.countAllReview})</span>
						<button onclick="location.href='/poing/review?placeId=${storeAllVO.idx}'" class="all_review">전체보기></button>
						<c:if test="${empty reviewList}">
							<h3 style="margin: 10px 0px; text-align: center;">등록된 리뷰가 없습니다.</h3>
						</c:if>
						<c:forEach var="vo" items="${reviewList}">
							<div class="review_box">
								<div class="review_title">
									<div class="review_profile">
										<c:choose>
				                    		<c:when test="${empty vo.profile_img}">
				                          		<img src="${contextPath}/resources/user_none.png">
				                    		</c:when>
				                    		<c:otherwise>
				                          		<img src="${contextPath}/resources/profile/${vo.member_id}/${vo.profile_img}">
				                    		</c:otherwise>
				                    	</c:choose>
									</div>
									<div class="review_name_box">
										<p>${vo.nickname}</p>
										<span class="MuiRating-root jss1020 MuiRating-readOnly" role="img" aria-label="5 Stars">
		                                    <c:forEach var="i" begin="1" end="5">
												<c:choose>
													<c:when test="${i<=vo.star}">
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
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${i-vo.star<1}">
																<span class="MuiRating-decimal">
																	<span style="width: 50%; overflow: hidden; z-index: 1; position: absolute;">
																		<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
																			<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
																		</span>
																	</span>
																	<span>
																		<span class="MuiRating-icon jss1019 MuiRating-iconFilled">
																			<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
																		</span>
																	</span>
																</span>	
															</c:when>
															<c:otherwise>
																<span class="MuiRating-decimal">
																	<span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
																		<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
																			<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
																		</span>
																	</span>
																	<span>
																		<span class="MuiRating-icon jss1019 MuiRating-iconFilled">
																			<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
																		</span>
																	</span>
																</span>	
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</c:forEach>
		                                </span>
		                                <span style="font-size: 12px; font-weight: 700">${vo.star}.0</span>
									</div>
								</div>
								<div class="review_content">
									<p>${fn:replace(vo.content, replaceChar, "<br>")}</p>
								</div>
							</div>
						</c:forEach>
						<button onclick="location.href='${contextPath}/write_review?placeId=${storeAllVO.idx}'" class="a4032" tabindex="0" type="submit">
							<span class="a4033">리뷰 작성</span>
							<span class="a4034"></span>
						</button>
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
			<script>
				$.datepicker.setDefaults({
					dateFormat: 'yy-mm-dd',
					prevText: '이전 달',
					nextText: '다음 달',
					monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					dayNames: ['일', '월', '화', '수', '목', '금', '토'],
					dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
					dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
					showMonthAfterYear: true,
					yearSuffix: '년'
				});

				function selectTime(btn) {
					$('.time_btn').removeClass('select_time_btn')
					$(btn).addClass('select_time_btn')
					$('.reservation_time').val($(btn).text())
				}

				function setTime() {

					$('.select_time_swiper').empty()
					
					$.ajax({
						type: 'post', 
						url: '/poing/askSelectTime.do', 
						data: {'date':$('#datepicker').val(), 'storeIdx':$('.store_idx').val()},
						success:function (data, textStatus) {
							
							$('.reservation_time').val('')

							for(var i=0; i<data.len; i++) {
								var item = '<div class="swiper-slide timeItem" style="width: 112px; margin-right: 10px;">'
								item += '<button onclick="selectTime(this)" class="time_btn">'
								item += data.time[i]
								item += '</button></div>'
								$('.select_time_swiper').append(item)
							}

							var swiper = new Swiper(".mySwiper2", {
							  slidesPerView: 5,
							  spaceBetween: 10,
							  pagination: {
								el: ".swiper-pagination",
								clickable: true,
							  },
							});
						},
						error:function (data, textStatus) {
							alert('에러가 발생했습니다.');
						}
					});
				}

				function reservation() {

					var store_idx = $('.store_idx').val()
					var resDate = $('#datepicker').val()
					var people_num = $('.count_view').text().substring(0, 1)
					var resTime = $('.reservation_time').val()

					if(resTime==='') {
						alert('예약 시간을 선택하세요')
						return
					}

					$.ajax({
						type: 'post', 
						url: '/poing/reservation.do', 
						data: {'store_idx':store_idx, 'resDate':resDate, 'people_num':people_num, 'time':resTime},
						success:function (data, textStatus) {
							
							switch (data) {
							case 'success':
								alert('예약에 성공하셨습니다.')
								location.href='/poing/main'
								return
								break;
							case 'failed':
								alert('예약에 실패하셨습니다.')
								break;
							case 'please login':
								alert('로그인 후 예약하실 수 있습니다.')
								break;								
							}
							
						},
						error:function (data, textStatus) {
							alert('에러가 발생했습니다.');
						}
					});

				}

			    $(function() {
					$("#datepicker").datepicker({
						onSelect : function (dateText, inst) {
							setTime()
						}
					});

					setTime();

				});
				
			</script>
			<div class="storeBSide">
				<h2>예약 정보</h2>
				<input class="store_idx" type="hidden" value="${storeAllVO.idx}">
				<div class="select_time">
					<svg viewBox="0 0 24 24" aria-hidden="true" width="24" height="24"><g><path d="M9 11H7v2h2v-2zm4 0h-2v2h2v-2zm4 0h-2v2h2v-2zm2-7h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V9h14v11z"></path></g></svg>
					<div class="count_module">
						<input value="${storeInfo.tomorrow}" readonly type="text" id="datepicker">
					</div>
				</div>
				<div class="select_time">
					<svg viewBox="0 0 24 24" aria-hidden="true" width="24" height="24"><g><path d="M16.5 12c1.38 0 2.49-1.12 2.49-2.5S17.88 7 16.5 7C15.12 7 14 8.12 14 9.5s1.12 2.5 2.5 2.5zM9 11c1.66 0 2.99-1.34 2.99-3S10.66 5 9 5C7.34 5 6 6.34 6 8s1.34 3 3 3zm7.5 3c-1.83 0-5.5.92-5.5 2.75V19h11v-2.25c0-1.83-3.67-2.75-5.5-2.75zM9 13c-2.33 0-7 1.17-7 3.5V19h7v-2.25c0-.85.33-2.34 2.37-3.47C10.5 13.1 9.66 13 9 13z"></path></g></svg>
					<div class="count_module">
						<img class="count_minus" src="${contextPath}/resources/icon_minus.png">
						<strong class="count_view">2명</strong>
						<img class="count_plus" src="${contextPath}/resources/icon_plus.png">
					</div>
				</div>
				<div class="select_time" style="padding-bottom: 15px;">
					<div class="time_head">
						<svg viewBox="0 0 24 24" aria-hidden="true" width="24" height="24" fill="#838383"><g><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"></path></g></svg>
						시간 선택하기 (슬라이드 후 원하는 시간을 선택하세요.)
					</div>
					<div>
						<input type="hidden" class="reservation_time">
						<div class="swiper-container mySwiper2">
							<div class="swiper-wrapper select_time_swiper">
								
							</div>
						</div>							
					</div>
				</div>
				<button onclick="reservation()" class="reservation_btn">예약하기</button>
			</div>
		</div>
	</body>
</html>