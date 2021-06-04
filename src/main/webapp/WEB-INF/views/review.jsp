<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<c:set var="store" value="${reviewInfo.store}"/>
<c:set var="reviewList" value="${reviewInfo.reviewList}"/>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			.write_review_box {
				width: 60%;
				margin: 0 auto;
			}
	        .b1020 {
	            margin: 0 0 12px 0;
	            font-size: 1.8rem;
	            text-align: center;
	        }
	        .b1021 {
				margin: 30px 0;
	            border: 1px solid rgba(207, 204, 204, 1);
	            overflow: hidden;
	            border-radius: 4px;
	        }
	        .b1022 {
	            border-top: 0 none;
	            border-bottom: 0 none;
	            margin-bottom: 0;
	            padding: 0;
	            background-color: #fff;
	        }
	        .b1023 {
	            padding-top: 30px;
	            padding-bottom: 30px;
	            padding: 40px 232px;
	            border-top: 1px solid rgba(235, 235, 235, 1);
	            margin-top: -1px;
	        }
			.b1023 > h1 {
				font-size: 24px;
				text-align: center;
				margin-top: 10px;
			}
	        .b1024 {
	            border: 0 none;
	            overflow: hidden;
	            background-color: #fff;
	            margin: 0;
	            padding: 0;
	            position: relative;
	            list-style: none;
	        }
	        .b1025 {
	            border-top: 0 none;
	            border: 0 none;
	            display: flex;
	            padding: 0 16px;
	            position: relative;
	            margin-top: -1px;
	            flex-direction: column;
	            background-color: #fff;
	            width: 100%;
	            box-sizing: border-box;
	            text-align: left;
	            align-items: center;
	            justify-content: flex-start;
	            text-decoration: none;
	        }
	        .b1026 {
	            width: 100%;
	            display: flex;
	            padding: 14px 0;
	        }
	        .b1027 {
	            width: 110px;
	            height: 110px;
	            overflow: hidden;
	            position: relative;
	            flex-grow: 0;
	            flex-basis: 110px;
	            flex-shrink: 0;
				margin: 0 auto;
	            cursor: pointer;
    			border-radius: 50%;
	        }
			.b1027 > img {
	            width: 110px;
	            height: 110px;
			}
	        .b1028 {
	            width: 100%;
	            height: 100%;
	            object-fit: cover;
	            margin: auto;
	            display: block;
	            max-width: 100%;
	        }
	        .b1029 {
	            flex-grow: 1;
	            min-width: 0;
	        }
	        .b1030 {
	            padding-right: 220px;
	            height: 100%;
	            display: flex;
	            position: relative;
	            align-items: flex-start;
	            flex-direction: column;
	        }
	        .b1031 {
	            color: rgba(60, 60, 67, 0.6);
	            font-size: .9rem;
	        }
	        .b1032 {
	            margin: 0;
				margin-top: 25px;
	            font-size: 1.0rem;
	            font-weight: 400;
	            line-height: 1.5;
	        }
	        .b1033 {
	            font-size: 1.4rem;
	            color: rgba(60, 60, 67, 0.6);
	            margin-top: 4px;
	        }
	        .b1034 {
	            border-top: 0 none;
	            border-bottom: 0 none;
	            margin-bottom: 0;
	            padding: 0;
	            background-color: #fff;
	        }
	        .b1035 {
	            padding: 40px 232px;
	            border-top: 1px solid rgba(235, 235, 235, 1);
	            margin-top: -1px;
	        }
	        .b1036 {
	            padding-top: 0;
	            text-align: center;
	        }
	        .b1037 {
	            font-size: 1.2rem;
	        }
	        .b1038 {
	            margin-top: 8px;    
	        }
	        .b1039 {
	            color: #ffb400;
	            cursor: pointer;
	            display: inline-flex;
	            position: relative;
	            font-size: 2.4rem;
	            text-align: left;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .b1040 {
	            cursor: inherit;
	        }
	        .b1041 {
	            margin: 0;
	            color: rgba(0, 0, 0, 0.26);
	            display: flex;
	            transition: transform 150ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            pointer-events: none;
	        }
	        .b1042 {
	            width: 38px;
	            height: 38px;
	            fill: currentColor;
	            display: inline-block;
	            font-size: 2.4rem;
	            transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            flex-shrink: 0;
	            user-select: none;
	        }
	        .b1043 {
	            top: 20px;
	            clip: rect(0 0 0 0);
	            color: #000;
	            width: 1px;
	            border: 0;
	            height: 1px;
	            margin: -1px;
	            padding: 0;
	            overflow: hidden;
	            position: absolute;
	        }
	        .b1044 {
	            padding: 40px 232px;
	            border-top: 1px solid rgba(235, 235, 235, 1);
	            margin-top: -1px;
	        }
	        .b1045 {
	            margin-bottom: 20px;
	            width: 100%;
	            border: 0;
	            margin: 0;
	            display: inline-flex;
	            padding: 0;
	            position: relative;
	            min-width: 0;
	            flex-direction: column;
	            vertical-align: top;
	        }
	        .b1046 {
	            font-size: 1.1rem;
	            padding-bottom: 10px;
	            color: rgba(0, 0, 0, 1);
	            position: relative;
	            transform: none !important;
	            font-weight: 500;
	            pointer-events: none;
	            transition: color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms,transform 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	            transform-origin: top left;
	            top: 0;
	            left: 0;
	            display: block;
	            padding: 0;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1;
	            margin: 10px 0;
	        }
	        .b1047 {
	            z-index: 1;
	            border: 1px solid rgba(196, 196, 198, 1);
	            padding: 0;
	            background: #fff;
	            border-radius: 4px;
	            position: relative;
	            transition: background-color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	            width: 100%;
	            color: rgba(0, 0, 0, 1);
	            cursor: text;
	            display: inline-flex;
	            font-size: 1.1rem;
	            box-sizing: border-box;
	            align-items: center;
	            font-family: Noto Sans KR,sans-serif;
	            font-weight: 400;
	            line-height: 1.1876em;
	        }
	        .b1048 {
	            height: 52px;
	            padding: 17.5px 44px 17.5px 16px;
	            z-index: 10;
	            position: relative;
	            font-size: 1.1rem;
	            box-sizing: border-box;
	            border-radius: 4px;
	            background-color: transparent;
	            -webkit-appearance: none;
	            font: inherit;
	            color: currentColor;
	            width: 100%;
	            border: 0;
	            margin: 0;
	            display: block;
	            min-width: 0;
	            background: none;
	            animation-name: mui-auto-fill-cancel;
	            letter-spacing: inherit;
	            animation-duration: 10ms;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .b1049 {
	            z-index: 1;
	            width: 100%;
	            border: 0;
	            margin: 0;
	            display: inline-flex;
	            padding: 0;
	            position: relative;
	            min-width: 0;
	            flex-direction: column;
	            vertical-align: top;
	        }
	        .b1050 {
	            border: 1px solid rgba(196, 196, 198, 1);
	            padding: 0;
	            background: #fff;
	            border-radius: 4px;
	            position: relative;
	            transition: background-color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	            width: 100%;
	            color: rgba(0, 0, 0, 1);
	            cursor: text;
	            display: inline-flex;
	            font-size: 1.1rem;
	            box-sizing: border-box;
	            align-items: center;
	            font-family: Noto Sans KR,sans-serif;
	            font-weight: 400;
	            line-height: 1.1876em;
	        }
	        .b1051 {
	            min-height: 270px;
	            padding: 17.5px 16px 17.5px;
	            z-index: 10;
	            position: relative;
	            font-size: 1.1rem;
	            box-sizing: border-box;
	            border-radius: 4px;
	            background-color: transparent;
	            -webkit-appearance: none;
	            resize: none;
	            font: inherit;
	            color: currentColor;
	            width: 100%;
	            border: 0;
	            margin: 0;
	            display: block;
	            min-width: 0;
	            background: none;
	            animation-name: mui-auto-fill-cancel;
	            letter-spacing: inherit;
	            animation-duration: 10ms;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .b1052 {
	            border-top: 0 none;
	            border-bottom: 0 none;
	            margin-bottom: 0;
	            padding: 0;
	            background-color: #fff;
	        }
	        .b1053 {
	            padding: 40px 232px;
	            border-top: 1px solid rgba(235, 235, 235, 1);
	            margin-top: -1px;
	        }
	        .b1054 {
	            width: calc(100% + 20px);
	            margin-left: -10px;
	            justify-content: space-between;
	            display: flex;
	        }
	        .b1055 {
	            overflow: hidden;
	            margin: 0 10px;
	            color: rgba(138, 138, 142, 1);
	            background-color: rgba(244, 244, 245, 1);
	            padding: 13px 16px;
	            font-size: 1.6rem;
	            box-shadow: none !important;
	            font-weight: 500;
	            text-transform: capitalize;
	            width: 100%;
	            border-color: currentColor;
	            min-width: 64px;
	            box-sizing: border-box;
	            transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,border 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1.75;
	            border-radius: 4px;
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
	            -webkit-appearance: none;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .b1056 {
	            width: 100%;
	            display: inherit;
	            align-items: inherit;
	            justify-content: inherit;
	        }
	        .b1057 {
	            top: 0;
	            left: 0;
	            right: 0;
	            bottom: 0;
	            z-index: 0;
	            overflow: hidden;
	            position: absolute;
	            border-radius: inherit;
	            pointer-events: none;
	        }
	        .b1058 {
	            overflow: hidden;
	            margin: 0 10px;
	            padding: 13px 16px;
	            font-size: 1.6rem;
	            box-shadow: none !important;
	            font-weight: 500;
	            text-transform: capitalize;
	            width: 100%;
	            color: #eb0019;
				border: 2px solid #eb0019 !important;
	            min-width: 64px;
	            box-sizing: border-box;
	            transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,border 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1.75;
	            border-radius: 4px;
	            cursor: pointer;
	            display: inline-flex;
	            outline: 0;
	            position: relative;
	            align-items: center;
	            user-select: none;
	            vertical-align: middle;
	            justify-content: center;
	            text-decoration: none;
	            -webkit-appearance: none;
	            -webkit-tap-highlight-color: transparent;
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
		<div class="write_review_box">
			<div class="b1021">
	            <div class="b1022">
	                <div class="b1023">
						<div class="b1027" onclick="location.href='store/${store.idx}'">
							<img src="resources/store/${store.idx}/${store.main_img}">
						</div>
						<h1>${store.store_name}</h1>
	                </div>
	            </div>
	            <div class="b1034">
	            	<c:if test="${empty reviewList}">
						<h3 style="margin: 10px 0px; text-align: center;">등록된 리뷰가 없습니다.</h3>
					</c:if>
	                <c:forEach var="vo" items="${reviewList}">
						<div class="review_box">
							<div class="review_title">
								<div class="review_profile">
									<img src="${contextPath}/resources/user_none.png">
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
	            </div>
				<nav>
					<ul class="jss1025">
						<c:if test="${reviewInfo.page != 1}">
							<li>
								<button onclick="location.href='${contextPath}/review?placeId=${store.idx}&page=1'" tabindex="0" type="button" aria-current="true">
									<span>
										<svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"></path></svg>
									</span>
								</button>
							</li>
						</c:if>
						<c:forEach var="i" begin="${reviewInfo.frontPage}" end="${reviewInfo.behindPage}">
								<c:choose>
									<c:when test="${reviewInfo.page == i}">
										<li>
											<button class="jss1026" onclick="location.href='${contextPath}/review?placeId=${store.idx}&page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<button onclick="location.href='${contextPath}/review?placeId=${store.idx}&page=${i}'" tabindex="0" type="button" aria-current="true">${i}</button>
										</li>
									</c:otherwise>
								</c:choose>
						</c:forEach>
						<c:if test="${reviewInfo.page != reviewInfo.lastPage}">
							<li>
								<button onclick="location.href='${contextPath}/review?placeId=${store.idx}&page=${reviewInfo.lastPage}'" tabindex="0" type="button" aria-current="true">
									<span class="MuiButton-label">
										<svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
									</span>
								</button>
							</li>
						</c:if>
					</ul>
				</nav>
	        </div>
	    </div>
	</body>
</html>