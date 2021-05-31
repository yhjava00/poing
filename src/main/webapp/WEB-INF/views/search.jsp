<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			.search_box {
				width: 70%;
				margin: 0 auto;
			}
			.search_box > h2 {
				display: inline-block;
				border-bottom: 2px solid rgba(236, 36, 57, 1);
				margin-bottom: 5px;
			}
			.search_box > p {
				color: #838383;
    			font-size: 14px;
			}
			.search_content_box {
				margin-top: 50px;
				overflow: hidden;
			}
			.search_content {
				float: left;
				cursor: pointer;
				padding: 10px;
			}
			.search_content img {
    			border-radius: 5px;
				height: 275px;
				width: 275px;
			}
			.recommend_p1 {
                color: #1c2023;
                font-size: 16px;
                font-weight: 700;
                line-height: normal;
                margin-top: 8px;
                text-align: left;
                
            }
            .recommend_p2 {    
                color: #c4bbab;
                font-size: 12px;
                font-weight: 300;
                line-height: 18px;
                text-align: left;
                text-overflow:ellipsis;
                white-space:nowrap;
                word-wrap:normal;
                width:290px;
                overflow:hidden;
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
		<title>Insert title here</title>
	</head>
	<body>
		<div class="search_box">
			<c:choose>
			<c:when test="${!empty searchMap.search}">
				<h2>${searchMap.search}</h2>
			</c:when>
			<c:otherwise>
				<h2>전체보기</h2>
			</c:otherwise>
			</c:choose>
			<p>${searchMap.totSearchNO} 레스토랑</p>
			<div class="search_content_box">
				<c:forEach var="vo" items="${searchMap.searchList}">
					<div class="search_content">
						<div>
							<img src="resources/main_img/${vo.main_img}">
							<p class="recommend_p1">${vo.store_name}</p>
							<p class="recommend_p2">${vo.introduce}</p>
							<p class="recommend_p2">${vo.location1} · ${vo.location2}</p>
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
						</div>
					</div>
				</c:forEach>
			</div>
			<nav>
	            <ul class="jss1025">
	            	<c:if test="${searchMap.page != 1}">
                		<li>
		                    <button onclick="location.href='${contextPath}/search?search=${searchMap.search}&page=1'" tabindex="0" type="button" aria-current="true">
		                        <span>
		                            <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"></path></svg>
		                        </span>
		                    </button>
		                </li>
	            	</c:if>
	                <c:forEach var="i" begin="${searchMap.frontPage}" end="${searchMap.behindPage}">
			                <c:choose>
			                	<c:when test="${searchMap.page == i}">
					                <li>
					                    <button class="jss1026" onclick="location.href='${contextPath}/search?search=${searchMap.search}&page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
					                </li>
			                	</c:when>
			                	<c:otherwise>
					                <li>
					                    <button onclick="location.href='${contextPath}/search?search=${searchMap.search}&page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
					                </li>
			                	</c:otherwise>
			                </c:choose>
	                </c:forEach>
	                <c:if test="${searchMap.page != searchMap.lastPage}">
		                <li>
		                    <button onclick="location.href='${contextPath}/search?search=${searchMap.search}&page=${searchMap.lastPage}'" tabindex="0" type="button" aria-current="true">
		                        <span class="MuiButton-label">
		                            <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
		                        </span>
		                    </button>
		                </li>
	                </c:if>
	            </ul>
	        </nav>
		</div>
	</body>
</html>