<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			.main_header {
	            background: #ffffff;
	            position: fixed;
	            top: 0;
	            left: 0;
	            width: 100%;
	            z-index: 100;
	            box-shadow: 0 0 8px 0 rgb(0 0 0 / 12%);
	            height: 80px;
	        }
	        .logo-holder {
	            float: left;
	            position: relative;
	            top: 25px;
	            height: 50px;
	            margin-left: 50px;
	        }
	        .logo-holder img {
	            height: 70%;
	            width: auto;
	        }
	        .header_search {
	            float: left;
	            margin-left: 30px;
	            position: relative;
	            top: 20px;
	        }
	        .header_search > div {
	            float: left;
	            border-radius: 20px;
	            overflow: hidden;
	            background: #fff;
	            border: rgba(235, 0, 25, 1) solid 1px;
	        }
	        .header_search input {
	            border: none;
	            height: 40px;
	            line-height: 40px;
	            padding: 0 20px;
	            float: left;
	            width: 300px;
	            outline: none;
	        }
	        .header_search button {
	            background-color: #fff;
	            height: 40px;
	            border: none;
	            color: #16bab4;
	            line-height: 40px;
	            border-top-right-radius: 20px;
	            border-bottom-right-radius: 20px;
	            padding: 0 30px;
	            cursor: pointer;
	            float: left;
	        }
	        .header_search span {
	            width: 100%;
	            display: flex;
	            align-items: inherit;
	            justify-content: inherit;
	        }
	        .search_btn_img {
	            width: 22px;
	            height: 22px;
	            fill: currentColor;
	            display: inline-block;
	            font-size: 2.4rem;
	            transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            flex-shrink: 0;
	            user-select: none;
	        }
	        .search_btn_img > path {
	            fill: rgba(235, 0, 25, 1);
	        }
	        .header_menu {
	            float: right;
	            position: relative;
	            top: 14px;
	            opacity: 1;
	            right: 0;
	            visibility: visible;
	            margin-right: 50px;
	        }
	        .header_menu nav {
	            position: relative;
	            float: right;
	            display: block;
	        }
	        .header_menu ol, ul {
	            list-style: none;
	        }
	        .header_menu li {
	            float: left;
	            position: relative;
	            padding-top: 5px;
	            height: 70px;
	        }
	        .header_menu a {
	            float: left;
	            padding: 10px;
	            font-size: 18px;
	            font-style: normal;
	            font-weight: 700;
	            text-transform: none;
	            line-height: 25px;
	            letter-spacing: 0px;
	            color: #555;
	            transition: all 100ms linear;
	        }
		</style>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<title>Insert title here</title>
	</head>
	<body>
		<header class="main_header">
	        <div></div>
	        <div>
	            <div class="logo-holder">
	                <a href="/poing">
	                    <img src="https://m.poing.co.kr/images/logo.png">
	                </a>
	            </div>
	            <div class="header_search">
	                <div>
	                    <input type="text" placeholder="레스토랑을 검색하세요">
	                    <button onclick="">
	                        <span>
	                            <svg class="search_btn_img" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
	                                <path d="M18.031 16.617l4.283 4.282-1.415 1.415-4.282-4.283C15.024 19.308 13.042 20.003 11 20c-4.968 0-9-4.032-9-9s4.032-9 9-9 9 4.032 9 9c.003 2.042-.692 4.024-1.969 5.617zm-2.006-.742C17.295 14.57 18.003 12.82 18 11c0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7 1.82.003 3.57-.706 4.875-1.975l.15-.15z"></path>
	                            </svg>
	                        </span>
	                    </button>
	                </div>
	            </div>
	            <div class="header_menu">
	                <nav>
	                    <ul>
	                        <li>
	                            <a href="login">로그인</a>
	                        </li>
	                        <li>
	                            <a href="#">고객센터</a>
	                        </li>
	                    </ul>
	                </nav>
	            </div>
	        </div>
	    </header>
	</body>
</html>