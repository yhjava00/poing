<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet"  href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <style>
            .main_img_box {
                width: 100%;
                height: 405px;
            }
            .main_img_box > img {
                width: 100%;
                height: 405px;
            }
            .category_box {
                padding-bottom: 20px;
                padding-top: 20px;
                width: 100%;
                height: 300px;
            }
            .category_title {
                padding: 8px 80px;
            }
            .category_title div {
            	display: inline;
                font-size: 1.7rem;
                border-bottom: rgba(235, 0, 25, 1) solid 1px;
            }
            .category_content_box {
                margin-top: 20px;
                padding: 0px 80px;
            }
            .category_content {
            }
            .category_content > div{
                width: 180px;
            }
            .category_content a {
                margin-left: 20px;
                margin-right: 0;
                padding-right: 10px;
                width: 180px;
            }
            .category_content img {
                width: 180px;
                height: 180px;
            }
            .category_content p {
                color: #1c2023;
                font-size: 16px;
                font-weight: 700;
                line-height: normal;
                margin-top: 8px;
                text-align: center;
            }
            .swiper-container {
                width: 100%;
                height: 100%;
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
            .swiper-pagination {
                left: 0;
                width: 100%;
            }
            .swiper-pagination > span {
                margin: 0px 5px;
            }
            .recommend_box {
                padding-bottom: 20px;
                padding-top: 20px;
                width: 100%;
            }
            .recommend_title {
                padding: 8px 80px;
            }
            .recommend_title div {
            	display: inline;
                font-size: 1.7rem;
                border-bottom: rgba(235, 0, 25, 1) solid 1px;
            }
            .recommend_content_box {
                margin-top: 20px;
                padding: 0px 80px;
            }
            .recommend_content {
            }
            .recommend_content > div{
                width: 275px;
            }
            .recommend_content a {
                /* margin-left: 20px; */
                margin-right: 0;
                /* padding-right: 10px; */
                width: 100%;
                text-align: left !important;
            }
            .recommend_content img {
                width: 275px;
                height: 275px;
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
                width:280px;
                overflow:hidden;
            }
            .swiper-pagination2 {
                left: 0;
                width: 100%;
                text-align: center;
            }
            .swiper-pagination2 > span {
                margin: 0px 5px;
            }
            .swiper-pagination3 {
                left: 0;
                width: 100%;
                text-align: center;
            }
            .swiper-pagination3 > span {
                margin: 0px 5px;
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
                                    <a href="#">
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
                    <div class="swiper-pagination2"></div>
                </div>
            </div>
            <div class="recommend_box">
                <div class="recommend_title">
                    <div>다이닝 티켓</div>
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