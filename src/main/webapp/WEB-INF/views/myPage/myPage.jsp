<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="${contextPath}/resources/css/myPage.css?b">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="${contextPath}/resources/js/myPage_event.js?a"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <title>Insert title here</title>
    </head>
    <body>
	    <div class="headBox">
	        <div class="box1">
	            <a href="${contextPath}/myPage/update" style="display: flex;">
	                <div class="jss1027">
	                    <c:choose>
                    		<c:when test="${empty info.member.profile_img}">
                          		<img class="a1150" src="${contextPath}/resources/user_none.png">
                    		</c:when>
                    		<c:otherwise>
                          		<img class="a1150" src="${contextPath}/resources/profile/${info.member.id}/${info.member.profile_img}">
                    		</c:otherwise>
                    	</c:choose>
	                    <span>편집</span>
	                </div>
	                <div style="float: left; margin: auto; margin-left: 10px;">
	                    <span class="jss1001">
	                        ${info.member.nickname}
	                        <svg class="gearImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M2 12c0-.865.11-1.703.316-2.504 1.126.06 2.191-.518 2.755-1.495.564-.977.533-2.188-.081-3.134 1.209-1.19 2.7-2.052 4.335-2.505.512 1.006 1.545 1.64 2.674 1.64s2.162-.634 2.674-1.64c1.634.453 3.126 1.316 4.335 2.505-.615.946-.646 2.158-.082 3.135.565.977 1.63 1.555 2.757 1.495.206.8.316 1.638.316 2.503 0 .865-.11 1.703-.316 2.504-1.127-.06-2.191.518-2.756 1.495-.565.977-.533 2.188.081 3.134-1.209 1.19-2.7 2.052-4.335 2.505-.512-1.006-1.545-1.64-2.674-1.64s-2.162.634-2.674 1.64c-1.634-.453-3.126-1.316-4.335-2.505.615-.946.646-2.158.082-3.135-.565-.977-1.63-1.555-2.757-1.495C2.11 13.704 2 12.866 2 12zm4.804 3c.63 1.091.81 2.346.564 3.524.408.29.842.541 1.297.75.917-.821 2.104-1.275 3.335-1.274 1.26 0 2.438.471 3.335 1.274.455-.209.889-.46 1.297-.75-.253-1.204-.052-2.459.564-3.524.615-1.066 1.601-1.867 2.77-2.25.046-.499.046-1.001 0-1.5-1.17-.383-2.156-1.184-2.771-2.25-.616-1.065-.817-2.32-.564-3.524-.408-.29-.842-.541-1.297-.75C14.418 5.546 13.23 6.001 12 6c-1.23 0-2.418-.453-3.335-1.274-.455.209-.89.46-1.297.75C7.621 6.68 7.42 7.935 6.804 9c-.615 1.066-1.601 1.867-2.77 2.25-.046.499-.046 1.001 0 1.5 1.17.383 2.156 1.184 2.771 2.25h-.001zM12 15c-1.657 0-3-1.343-3-3s1.343-3 3-3 3 1.343 3 3-1.343 3-3 3zm0-2c.552 0 1-.448 1-1s-.448-1-1-1-1 .448-1 1 .448 1 1 1z"></path></svg>
	                    </span>
	                    <p style="margin: 5px 0;">${info.member.id}</p>
	                </div>
	            </a>
	        </div>
	        <div class="box1">
	            <a href="${contextPath}/myPage/coming_visit">
	                <div class="boxInA">
						<svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M17.618 5.968l1.453-1.453 1.414 1.414-1.453 1.453c2.981 3.731 2.528 9.142-1.032 12.326-3.56 3.184-8.986 3.033-12.364-.344C2.26 15.986 2.108 10.559 5.292 7c3.184-3.56 8.595-4.013 12.326-1.032zM12 20c2.5 0 4.812-1.334 6.062-3.5s1.25-4.834 0-7C16.812 7.334 14.501 6 12 6c-3.866 0-7 3.134-7 7s3.134 7 7 7zM11 8h2v6h-2V8zM8 1h8v2H8V1z"></path></svg>
	                    <span class="spanInBox">방문 예정 예약</span>
	                    <strong class="numInBox">${info.totComingVisit}</strong>
	                    <svg class="arrowImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                </div>
	            </a>
	        </div>
	        <div class="box1">
	            <a href="${contextPath}/myPage/review">
	                <div class="boxInA">
	                    <svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M6.455 19L2 22.5V4c0-.552.448-1 1-1h18c.552 0 1 .448 1 1v14c0 .552-.448 1-1 1H6.455zM4 18.385L5.763 17H20V5H4v13.385zm8.018-3.685l-3.359-3.36c-.568-.568-.79-1.397-.582-2.173.208-.777.814-1.383 1.59-1.591.777-.208 1.606.014 2.174.582l.177.177.177-.177c.568-.568 1.397-.79 2.173-.582.777.208 1.383.814 1.591 1.59.208.777-.014 1.606-.582 2.174l-3.36 3.359.001.001z"></path></svg>
	                    <span class="spanInBox">리뷰</span>
	                    <strong class="numInBox">${info.totMyReview}</strong>
	                    <svg class="arrowImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                </div>
	            </a>
	        </div>
	        <div class="box1">
	            <a href="${contextPath}/myPage/like_store">
	                <div class="boxInA">
						<svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path stroke="#38383A" stroke-width="2" fill="#fff" fill-rule="evenodd" d="M21.179 12.794l.013.014L12 22l-9.192-9.192.013-.014C.607 10.213.757 6.361 3.165 3.96 5.573 1.558 9.425 1.419 12 3.64c2.575-2.221 6.427-2.082 8.835.32 2.408 2.401 2.558 6.253.344 8.834z"></path></svg>
	                    <span class="spanInBox">좋아요</span>
	                    <strong class="numInBox">${info.totLikeStore}</strong>
	                    <svg class="arrowImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                </div>
	            </a>
	        </div>
	    </div>
	
	    <div class="mainBox">
	
	        <div class="sideBox">
	            <div class="reviewBox">
	                <div>
	                    <h3 class="jss1006">메뉴</h3>
	                </div>
	                <div class="jss283">
	                    <a class="jss1007" href="${contextPath}/myPage/coming_visit">
	                        <span class="jss288">방문 예정 예약</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	                <div class="jss283">
	                    <a class="jss1007" href="${contextPath}/myPage/past_reservation">
	                        <span class="jss288">지난 예약</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	                <div class="jss283">
	                    <a class="jss1007" href="${contextPath}/myPage/review">
	                        <span class="jss288">리뷰</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	                <div class="jss283">
	                    <a class="jss1007" href="${contextPath}/myPage/like_store">
	                        <span class="jss288">좋아요</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	            </div>
	            <c:if test="${loginCheck == 'admin@gmail.com'}">
	            	<div class="reviewBox">
		                <div>
		                    <h3 class="jss1006">관리자 전용 메뉴</h3>
		                </div>
		                <div class="jss283">
		                    <a class="jss1007" href="${contextPath}/myPage/admin_store_add">
		                        <span class="jss288">매장 등록</span>
		                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
		                    </a>
		                </div>
		            </div>
	            </c:if>
	            <c:if test="${not empty storeCheck}">
	            	<div class="reviewBox">
		                <div>
		                    <h3 class="jss1006">매장 전용 메뉴</h3>
		                </div>
		                <div class="jss283">
		                    <a class="jss1007" href="${contextPath}/myPage/store_coming_visit">
		                        <span class="jss288">매장 예약</span>
		                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
		                    </a>
		                </div>
		                <div class="jss283">
		                    <a class="jss1007" href="${contextPath}/myPage/store_past_reservation">
		                        <span class="jss288">지난 매장 예약</span>
		                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
		                    </a>
		                </div>
		                <div class="jss283">
		                    <a class="jss1007" href="${contextPath}/myPage/store_modify">
		                        <span class="jss288">매장 정보 수정</span>
		                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
		                    </a>
		                </div>
		            </div>
	            </c:if>
	        </div>
	        
	        <div class="contentBox">
	            <main>
	                
	                <c:choose>
	                	<c:when test="${path == 'past_reservation'}">
	                		<jsp:include page="pastReservation.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'review'}">
	                		<jsp:include page="review.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'coming_visit'}">
	                		<jsp:include page="comingVisit.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'like_store'}">
	                		<jsp:include page="likeStore.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'update'}">
	                		<jsp:include page="update.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'update_nickname'}">
	                		<jsp:include page="update_nickname.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'update_password'}">
	                		<jsp:include page="update_password.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'withdrawal'}">
	                		<jsp:include page="withdrawal.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'store_past_reservation'}">
	                		<jsp:include page="store_past_reservation.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'store_coming_visit'}">
	                		<jsp:include page="store_coming_visit.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'store_modify'}">
	                		<jsp:include page="storeModify.jsp"></jsp:include>
	                	</c:when>
	                	<c:when test="${path == 'admin_store_add'}">
	                		<jsp:include page="admin_store_add.jsp"></jsp:include>
	                	</c:when>
	                </c:choose>
	                
	            </main>
	        </div>
	    </div>
    </body>
</html>