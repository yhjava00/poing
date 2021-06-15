<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			.reservation_box img {
				width: 150px;
				height: 150px;
				border-radius: 4px;
				float: left;
				margin-right: 15px;
			}
			.reservation_box button {
			    position: relative;
			    top: 100px;
			    left: -90px;
			    height: 30px;
			    width: 100px;
			    cursor: pointer;
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
		</style>
		<script>
			function cancel_reservation(store_idx, resDate, time, page) {
				$.ajax({
					type: 'post', 
					url: '/poing/cancelReservation.do', 
					data: {'store_idx':store_idx, 'resDate':resDate, 'time':time, 'page':page},
					success:function (data) {
						
						var state = data.state
						
						if(state==='error') {
							alert('예약 취소에 실패하였습니다.')
							return
						}
						
						location.href = '/poing/myPage/coming_visit?page=1'
						
					},
					error:function () {
						alert('에러가 발생했습니다.')
					}
				})
				$.ajax({
					
				})
			}
		</script>
	</head>
	<body>
		<h2>방문 예정 예약</h2>
		<c:if test="${empty info.itemList}">
			<div class="jss1010">
	            <span class="jss1011">
					<svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M17.618 5.968l1.453-1.453 1.414 1.414-1.453 1.453c2.981 3.731 2.528 9.142-1.032 12.326-3.56 3.184-8.986 3.033-12.364-.344C2.26 15.986 2.108 10.559 5.292 7c3.184-3.56 8.595-4.013 12.326-1.032zM12 20c2.5 0 4.812-1.334 6.062-3.5s1.25-4.834 0-7C16.812 7.334 14.501 6 12 6c-3.866 0-7 3.134-7 7s3.134 7 7 7zM11 8h2v6h-2V8zM8 1h8v2H8V1z"></path></svg>
				</span>
	            방문 예정 예약이 없습니다.
	        </div>
		</c:if>
		<c:forEach var="vo" items="${info.itemList}">
			<div class="reservation_box">
				<a href="${contextPath}/store/${vo.store_idx}">
					<img src="${contextPath}/resources/store/${vo.store_idx}/${vo.main_img}">
					<div class="reservation_info">
						<h3>${vo.store_name}</h3>
						<p>${vo.people_num}명 / ${vo.resDate} / ${vo.time}</p>
					</div>
				</a>
				<button onclick="cancel_reservation('${vo.store_idx}', '${vo.resDate}', '${vo.time}', '${info.page}')">예약취소</button>
			</div>
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