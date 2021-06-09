<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
			.review_box {
				width: 50%;
				margin: 10px auto;
			}
			.review_title {
				height: 46px;
				position: relative;
				margin-bottom: 10px;
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
				border-radius: 50%
			}
			.review_name_box {
				position: relative;
				left: 55px;
				top: -46px;
			}
			.review_name_box > p {
				font-weight: 700;
				font-size: 14px;
			}
			.review_content {
				margin-left: 46px;
				font-size: 14px;
				font-weight: 300;
    			line-height: 20px;
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
		</style>
	</head>
	<body>
		<h2>리뷰</h2>
		<c:if test="${empty info.itemList}">
			<div class="jss1010">
	            <span class="jss1011">
					<svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M17.618 5.968l1.453-1.453 1.414 1.414-1.453 1.453c2.981 3.731 2.528 9.142-1.032 12.326-3.56 3.184-8.986 3.033-12.364-.344C2.26 15.986 2.108 10.559 5.292 7c3.184-3.56 8.595-4.013 12.326-1.032zM12 20c2.5 0 4.812-1.334 6.062-3.5s1.25-4.834 0-7C16.812 7.334 14.501 6 12 6c-3.866 0-7 3.134-7 7s3.134 7 7 7zM11 8h2v6h-2V8zM8 1h8v2H8V1z"></path></svg>
				</span>
	            작성한 리뷰가 없습니다.
	        </div>
		</c:if>
		<c:forEach var="vo" items="${info.itemList}">
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
		<nav>
        	<ul class="jss1025">
            	<c:if test="${info.page != 1}">
               		<li>
	                    <button onclick="location.href='${contextPath}/myPage/review?page=1'" tabindex="0" type="button" aria-current="true">
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
				                    <button class="jss1026" onclick="location.href='${contextPath}/myPage/review?page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
				                </li>
		                	</c:when>
		                	<c:otherwise>
				                <li>
				                    <button onclick="location.href='${contextPath}/myPage/review?page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
				                </li>
		                	</c:otherwise>
		                </c:choose>
                </c:forEach>
                <c:if test="${info.page != info.lastPage}">
	                <li>
	                    <button onclick="location.href='${contextPath}/myPage/review?page=${info.lastPage}'" tabindex="0" type="button" aria-current="true">
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