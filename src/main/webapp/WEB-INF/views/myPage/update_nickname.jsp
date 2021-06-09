<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
	        .a1120 {
	            margin: 0 0 30px 0;
	            font-size: 1.7rem;
	        }
	        .a1121 {
	            border: 1px solid rgba(207, 204, 204, 1);
	            overflow: hidden;
	            border-radius: 4px;
	        }
	        .a1122 {
	            font-size: .9rem;
	            font-weight: 400;
	            border-bottom: 0 none;
	            margin-bottom: 0;
	            justify-content: center;
	            background-color: rgba(244, 244, 245, 1);
	            display: flex;
	            padding: 22px 16px;
	            position: relative;
	        }
	        .a1123 {
	            border-top: 0 none;
	            border-bottom: 0 none;
	            margin-bottom: 0;
	            padding: 0;
	        }
	        .a1124 {
	            padding: 40px 232px;
	            border-top: 1px solid rgba(235, 235, 235, 1);
	            margin-top: -1px;
	        }
	        .a1125 {
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
	        .a1126 {
	            font-size: 1.0rem;
	            padding-bottom: 10px;
	            color: rgba(0, 0, 0, 1);
	            position: relative;
	            transform: none !important;
	            font-weight: 700;
	            pointer-events: none;
	            z-index: 1;
	            transition: color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms,transform 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	            transform-origin: top left;
	            top: 0;
	            left: 0;
	            display: block;
	            padding: 0;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1;
	
	        }
	        .a1127 {
	            z-index: 1;
	            margin: 10px 0;
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
	        .a1128 {
	            height: 52px;
	            padding: 15px 15px;
	            z-index: 10;
	            position: relative;
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
	        .a1129 {
	            width: calc(100% + 20px);
	            margin-left: -10px;
	            display: flex;
	            justify-content: space-between;
	        }
	        .a1130 {
	            margin: 0 10px;
	            padding: 13px 16px;
	            font-size: 1.0rem;
	            box-shadow: none !important;
	            font-weight: 500;
	            text-transform: capitalize;
	            width: 100%;
	            color: #fff;
	            background-color: rgba(196, 187, 171, 1);
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
	        .a1131 {
	            width: 100%;
	            display: inherit;
	            align-items: inherit;
	            justify-content: inherit;
	        }
	        .a1132 {
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
	    </style>
	    <script>
	    	function update_nickname() {
	    		var nickname = $('.nickname').val()
	    		
	    		if(nickname === '') {
	    			alert('닉네임을 입력해주세요.')
	    			return
	    		}
	    		
	    		var f = document.f
	    		
	    		f.method = 'post'
	    		f.action = '/poing/update_nickname.do'
	    		f.submit()
	    		
	    	}
	    </script>
	</head>
	<body>
		<h2 class="a1120">닉네임 변경</h2>
	    <form name="f">
	        <div class="a1121">
	            <div class="a1123">
	                <div class="a1124">
	                    <div class="a1125">
	                        <label class="a1126" data-shrink="true">${info.member.nickname}</label>
	                        <div class="a1127">
	                            <input aria-invalid="false" name="nickname" placeholder="새로운 닉네임을 입력해주세요" type="text" class="a1128 nickname">
	                        </div>
	                    </div>
	                    <div class="a1129">
	                        <button onclick="update_nickname()" class="a1130">
	                            <span class="a1131">확인</span>
	                            <span class="a1132"></span>
	                        </button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </form>
	</body>
</html>