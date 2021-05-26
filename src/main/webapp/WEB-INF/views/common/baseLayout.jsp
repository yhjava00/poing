<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			* {
	            margin: 0;
	            padding: 0;
	        }
	        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
	            border: none;
	            outline: 0;
	            font-weight: inherit;
	            font-style: inherit;
	            font-size: 100%;
	            font-family: 'Noto Sans KR', '맑은 고딕', 'Malgun Gothic', '돋움','Quicksand', Sans-serif!important;
	            vertical-align: baseline;
	            text-decoration: none;
	            margin: 0;
	            padding: 0;
	        }
	        p {
			    font-size: 13px;
			    line-height: 24px;
			    font-weight: 400;
			    color: #878C9F;
			}
	        a {
	            text-decoration: none;
	            position: relative;
	            color: #000;
	        }
	        .content {
	        	margin-top: 80px;
			    width: 100%;
			    position: relative;
			    z-index: 4;
			    float: left;
			    background: #fff;
	        }
		</style>
		<title><tiles:insertAttribute name="title"/></title>
	</head>
	<body>
		
		<tiles:insertAttribute name="header"/>
		
		<div class="content">
			<tiles:insertAttribute name="body"/>
		</div>
		
		<tiles:insertAttribute name="footer"/>
		
	</body>
</html>