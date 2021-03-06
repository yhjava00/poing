<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${contextPath}/resources/css/search.css">
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
					<c:choose>
                   		<c:when test="${vo.countAllReview == 0}">
                   			<c:set var="star" value="${vo.star}"/>
                   		</c:when>
                   		<c:otherwise>
                            <c:set var="star" value="${vo.star / vo.countAllReview}"/>
                   		</c:otherwise>
                   	</c:choose>
					<div class="search_content" onclick="location.href='${contextPath}/store/${vo.idx}'">
						<div>
							<c:choose>
								<c:when test="${vo.main_img == 'no img'}">
									<img src="resources/test/16001534905f60679293b3e.jpeg">									
								</c:when>
								<c:otherwise>
									<img src="resources/store/${vo.idx}/${vo.main_img}">
								</c:otherwise>
							</c:choose>
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