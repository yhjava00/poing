<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
		<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
        <style>
            
        </style>
        <!-- Swiper JS -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                var swiper = new Swiper(".mySwiper", {
                    slidesPerView: 5,
                    spaceBetween: 10,
                    pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                    },
                });
                var swiper = new Swiper(".mySwiper2", {
                    slidesPerView: 4,
                    spaceBetween: 10,
                    pagination: {
                    el: ".swiper-pagination2",
                    clickable: true,
                    },
                });
                var swiper = new Swiper(".mySwiper3", {
                    slidesPerView: 4,
                    spaceBetween: 10,
                    pagination: {
                    el: ".swiper-pagination3",
                    clickable: true,
                    },
                });
            })
        </script>
        <title>Insert title here</title>
    </head>
    <body>
        <div class="main_img_box">
            <img src="resources/main_img.jpg">
        </div>
        <div style="width: 80%; margin: 0 auto;">
            <div class="category_box">
                <div class="category_title">
                    <div>음식 종류</div>
                </div>
                <div class="category_content_box">
                    <div class="category_content swiper-container mySwiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="vo" items="${mainInfo.category}">
                                <div class="swiper-slide">
                                    <a href="search?search=${vo.category_name}">
                                        <div>
                                            <img src="resources/category/${vo.category_img}">
                                        </div>
                                        <p>${vo.category_name}</p>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <div class="recommend_box">
                <div class="recommend_title">
                    <div>추천 레스토랑</div>
                </div>
                <div class="recommend_content_box">
                    <div class="recommend_content swiper-container mySwiper2">
                        <div class="swiper-wrapper">
                            <c:forEach var="vo" items="${mainInfo.recommendList}">
                            	<c:choose>
                            		<c:when test="${vo.countAllReview == 0}">
                            			<c:set var="star" value="${vo.star}"/>
                            		</c:when>
                            		<c:otherwise>
                            			<c:set var="star" value="${vo.star / vo.countAllReview}"/>
                            		</c:otherwise>
                            	</c:choose>
                                <div class="swiper-slide">
                                    <a href="store/${vo.idx}">
                                        <div>
                                            <img src="resources/store/${vo.idx}/${vo.main_img}">
                                        </div>
                                        <p class="recommend_p1">${vo.store_name}</p>
                                        <p class="recommend_p2">${vo.introduce}</p>
                                        <p class="recommend_p2">${vo.location1} · ${vo.location2}</p>
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
                                        <p class="recommend_p2" style="display: inline;">(${vo.countAllReview})</p>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="swiper-pagination2"></div>
                </div>
            </div>
            <div class="recommend_box">
                <div class="recommend_title">
                    <div>좋아요가 많은 집</div>
                </div>
                <div class="recommend_content_box">
                    <div class="recommend_content swiper-container mySwiper3">
                        <div class="swiper-wrapper">
                            <c:forEach begin="1" end="10">
                                <div class="swiper-slide">
                                    <a href="#">
                                        <div>
                                            <img src="https://c2.poing.co.kr/PIMAGE-original/MjAyMDA2/15934078505ef9796a40fc2.png">
                                        </div>
                                        <p class="recommend_p1">장 스테이크</p>
                                        <p class="recommend_p2">압구정 로데오에 합리적인 가격의 스테이크를 만날 수 있는 레스토랑</p>
                                        <p class="recommend_p2"> 압구정  · 아메리칸  </p>
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
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="swiper-pagination3"></div>
                </div>
            </div>
        </div>
    </body>
</html>