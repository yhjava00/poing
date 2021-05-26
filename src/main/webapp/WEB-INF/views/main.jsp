<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <style>
            .main_img_box {
                width: 100%;
                height: 405px;
            }
            .main_img_box > img {
                width: 100%;
                height: 405px;
            }
            .collection_box {
                overflow: hidden;
                position: relative;
                padding-bottom: 20px;
                padding-top: 20px;
                width: 100%;
                height: 300px;
            }
            .collection_title {
                padding: 8px 80px;
            }
            .collection_title div {
            	display: inline;
                font-size: 1.7rem;
                border-bottom: rgba(235, 0, 25, 1) solid 1px;
            }
            .collection_content_box {
                margin-top: 20px;
                padding: 0px 80px;
                overflow: hidden;
            }
            .collection_content {
                overflow: hidden;
            }
            .collection_content > div{
                float: left;
                width: 180px;
            }
            .collection_content a {
                margin-left: 20px;
                margin-right: 0;
                padding-right: 10px;
                width: 180px;
            }
            .collection_content img {
                width: 180px;
                height: 180px;
            }
            .collection_content p {
                color: #1c2023;
                font-size: 16px;
                font-weight: 700;
                line-height: normal;
                margin-top: 8px;
            }
        </style>
        <title>Insert title here</title>
    </head>
    <body>
        <div class="main_img_box">
            <img src="https://hitable2020images.blob.core.windows.net/sites/tablenjoy%2F2021-04%2F1618913880647_1920_%EC%82%AC%EC%9A%A9%EC%9E%90_PC_%EB%A9%94%EC%9D%B8%EB%A1%A4%EB%A7%81%EB%B0%B0%EB%84%88_%EA%B0%80%EC%A0%95%EC%9D%98%EB%8B%AC%EA%B8%B0%ED%9A%8D%EC%A0%84.jpg">
        </div>
        <div class="collection_box">
            <div class="collection_title">
            	<div>음식 종류</div>
            </div>
            <div class="collection_content_box">
                <div class="collection_content">
                    <div>
                        <a href="#">
                            <div>
                                <img src="https://c2.poing.co.kr/banner/MjAyMDA3/15954786725f191290043f6.png">
                            </div>
                            <p>브런치</p>
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <div>
                                <img src="https://c2.poing.co.kr/banner/MjAyMDA3/15954786725f191290043f6.png">
                            </div>
                            <p>브런치</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>