<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			.jss1010 {
	            border-top: 0 none;
	            color: rgba(60, 60, 67, 0.6);
	            padding: 50px 16px;
	            display: flex;
	            flex-wrap: wrap;
	            box-sizing: border-box;
	            align-items: center;
	            flex-direction: column;
	            justify-content: center;
	            background-color: rgba(244, 244, 245, 1);
	        }
	        .jss1011 {
	            margin-bottom: 14px;
	        }
	        .jss1011 svg {
	            width: 60px;
	            height: 60px;
	        }
			.jss1011 svg path {
				fill: rgba(60, 60, 67, 0.6);
			}
			.reservation_box {
				overflow: hidden;
				width: 100%;
				padding: 20px;
				overflow: hidden;
			}
			.reservation_box > img {
				width: 150px;
				height: 150px;
				border-radius: 4px;
				float: left;
				margin-right: 15px;
			}
			.reservation_info {
				float: left;
			}
			/* 페이징 */
			.jss1025 {
				padding: 50px 0 25px;
				margin: 0;
				display: flex;
				list-style: none;
				justify-content: center;
				background-color: #fff;
			}
			.jss1025 button {
				height: 48px;
				min-width: 48px;
				margin: 0 2px;
				padding: 0 10px;
				font-size: 1.1rem;
				border-radius: 8px; 
				transition: color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
				color: rgba(0, 0, 0, 1);
				box-sizing: border-box;
				text-align: center;
				font-family: Noto Sans KR,sans-serif;
				font-weight: 400;
				line-height: 1.43;
				border: 0;
				cursor: pointer;
				display: inline-flex;
				outline: 0;
				position: relative;
				align-items: center;
				user-select: none;
				vertical-align: middle;
				justify-content: center;
				text-decoration: none;
				background-color: transparent;
				-webkit-appearance: none;
				-webkit-tap-highlight-color: transparent;   
			}
			.jss1025 svg {
				width: 16px;
				height: 16px;
				fill: currentColor;
				display: inline-block;
				font-size: 2.4rem;
				transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
				flex-shrink: 0;
				user-select: none;
			}
			.jss1026 {
				font-weight: 700 !important;
				font-size: 1.3rem !important;
			}
			/* 페이징 */
			.thin_p {
				color: #c4bbab;
				font-size: 14px;
				font-weight: 500;
				line-height: 18px;
				text-align: left;
				text-overflow:ellipsis;
				white-space:nowrap;
				word-wrap:normal;
				width:290px;
				overflow:hidden;
				margin-bottom: 5px;
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
	</head>
	<body>
		<h2>좋아요</h2>
		<c:if test="${empty info.itemList}">
			<div class="jss1010">
	            <span class="jss1011">
					<svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path stroke="#38383A" stroke-width="2" fill="#fff" fill-rule="evenodd" d="M21.179 12.794l.013.014L12 22l-9.192-9.192.013-.014C.607 10.213.757 6.361 3.165 3.96 5.573 1.558 9.425 1.419 12 3.64c2.575-2.221 6.427-2.082 8.835.32 2.408 2.401 2.558 6.253.344 8.834z"></path></svg>
				</span>
	            좋아요한 식당이 없습니다.
	        </div>
		</c:if>
		<c:forEach var="vo" items="${info.itemList}">
			<c:choose>
            	<c:when test="${vo.countAllReview == 0}">
					<c:set var="star" value="${vo.star}"/>
				</c:when>
				<c:otherwise>
					<c:set var="star" value="${vo.star / vo.countAllReview}"/>
				</c:otherwise>
			</c:choose>
			<a href="${contextPath}/store/${vo.idx}">
				<div class="reservation_box">
					<img src="${contextPath}/resources/store/${vo.idx}/${vo.main_img}">
					<div class="reservation_info">
						<h3 style="margin-bottom: 10px;">${vo.store_name}</h3>
						<p class="thin_p">${vo.introduce}</p>
						<p class="thin_p">${vo.location1} ${vo.location2} · ${vo.category}</p>
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
					</div>
				</div>
			</a>
		</c:forEach>
		<nav>
        	<ul class="jss1025">
            	<c:if test="${info.page != 1}">
               		<li>
	                    <button onclick="location.href='${contextPath}/myPage/coming_visit?page=1'" tabindex="0" type="button" aria-current="true">
	                        <span>
	                            <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"></path></svg>
	                        </span>
	                    </button>
	                </li>
            	</c:if>
                <c:forEach var="i" begin="${info.frontPage}" end="${info.behindPage}">
		                <c:choose>
		                	<c:when test="${info.page == i}">
				                <li>
				                    <button class="jss1026" onclick="location.href='${contextPath}/myPage/coming_visit?page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
				                </li>
		                	</c:when>
		                	<c:otherwise>
				                <li>
				                    <button onclick="location.href='${contextPath}/myPage/coming_visit?page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
				                </li>
		                	</c:otherwise>
		                </c:choose>
                </c:forEach>
                <c:if test="${info.page != info.lastPage}">
	                <li>
	                    <button onclick="location.href='${contextPath}/myPage/coming_visit?page=${info.lastPage}'" tabindex="0" type="button" aria-current="true">
	                        <span class="MuiButton-label">
	                            <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                        </span>
	                    </button>
	                </li>
                </c:if>
            </ul>
        </nav>
	</body>
</html>