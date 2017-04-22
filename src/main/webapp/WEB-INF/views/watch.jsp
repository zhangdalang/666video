<%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String path = request.getContextPath()+"/";
%>
<html>
	<head>
		<title>666视频</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style type="text/css">
			.main{
				height: 50%;
			}
			button{
				width: 90px;
				border: solid 1px orange;
				font-size: 15px;
				color: white;
				background-color: orange;
				height: 34px;
			}
		</style>
	</head>
	<body>
		<div class="main">
			<div>${video }</div>
		</div>
		<form action="<%=path %>reparse" method="post">
			如果不能播放请点击
			<input name="vi" type="hidden" value="${vi }">
		</form>
		<button>重新解析</button>
	</body>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("button").click(function(){
			$(this).remove();
			$("form").submit();
		});
	});
	</script>
</html>
