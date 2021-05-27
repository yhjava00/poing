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