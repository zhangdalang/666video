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
			margin-top: 100px;
		}
		.main div{
			text-align: center;
		}
		.main #logo{
			width: 100px;
			height: 100px;
		}
		.main input{
			margin-top: 50px;
			width: 30%;;
			line-height: 30px;
			border: solid 1px orange;
			font-size: 15px;
			text-indent: 6px;
		}
		.main button{
			width: 90px;
			border: solid 1px orange;
			font-size: 15px;
			color: white;
			background-color: orange;
			height: 34px;
			margin-left: -8px;
			margin-top: 50px;
		}
		.main p{
			font-size: 13px;
			color: gray;
		}
		.main a{
			font-size: 13px;
			color: gray;
		}
		
		.logos_lists {
			margin-top: 30px;
		    padding-left: 30%;
		    padding-right: 30%;
			}
			
			.logos_lists div{
			    display: inline-block;
			    width: 30%;
			    height:60px;
			    text-align: center;
			}
			.logos_lists table{
				width: 100%;
				text-align: center;
			}
			.logos_lists img{
				width: 50%;
				margin-bottom: 30px;
			}
		
		@media screen and (max-width: 800px) {
			.main input{
				margin-top: 50px;
				width: 70%;;
				line-height: 30px;
				border: solid 1px orange;
				font-size: 15px;
				text-indent: 6px;
			}
			.main #logo{
				width: 100px;
				height: 100px;
			}
			
			.logos_lists {
			margin-top: 30px;
		    padding-left: 10%;
		    padding-right: 10%;
			}
			
			.logos_lists div{
			    display: inline-block;
			    width: 30%;
			    height:60px;
			    text-align: center;
			}
			.logos_lists table{
				width: 100%;
				text-align: center;
			}
			.logos_lists img{
				width: 80%;
				margin-bottom: 30px;
			}
		}
		
	</style>
</head>
<body>
	<div class="main">
		<div>
			<img id="logo" alt="666视频" src="<%=path %>resources/logo.jpg">
		</div>
		<div>
			<form action="<%=path %>go" method="post">
			<input name="url" type="text" placeholder="复制视频链接到这里" autocomplete="off">
			<button>马上观看</button>
			</form>
			<p>支持以下网站vip视频播放(点击图片直接跳转)</p>
		</div>
	</div>
	<div class="logos_lists">
		<table>
			<tr>
				<td><a target="_blank" href="http://www.youku.com/"><img src="<%=path %>resources/images/youkulogo.png"></a></td>
				<td><a target="_blank" href="http://www.iqiyi.com/"><img src="<%=path %>resources/images/iqiyi.png"></a></td>
				<td><a target="_blank" href="http://v.qq.com/"><img src="<%=path %>resources/images/qqlogo.png"></a></td>
			</tr>
			<tr>
				<td><a target="_blank" href="http://www.mgtv.com/"><img src="<%=path %>resources/images/hunantvlogo.png"></a></td>
				<td><a target="_blank" href="http://www.le.com/"><img src="<%=path %>resources/images/letvlogo.png"></a></td>
				<td><a target="_blank" href="http://tv.sohu.com/"><img src="<%=path %>resources/images/sohulogo.png"></a></td>
			</tr>
			<tr>
				<td><a target="_blank" href="http://www.wasu.cn/"><img src="<%=path %>resources/images/wasulogo.png"></a></td>
				<td><a target="_blank" href="http://www.pptv.com/"><img src="<%=path %>resources/images/pptv.png"></a></td>
				<td><a target="_blank" href="http://www.acfun.tv/"><img src="<%=path %>resources/images/acfun.png"></a></td>
			</tr>
			<tr>
				<td><a target="_blank" href="http://www.bilibili.com/"><img src="<%=path %>resources/images/bilibili.png"></a></td>
				<td><a target="_blank" href="http://www.fun.tv/"><img src="<%=path %>resources/images/fengxing.gif"></a></td>
				<td><a target="_blank" href="http://www.tudou.com/"><img src="<%=path %>resources/images/tudoulogo.png"></a></td>
			</tr>
		</table>
	</div>
</body>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("button").attr("disabled", false);
	var press = 0
	var x = $('button').offset().left; 
	var y = $('button').offset().top; 
	var a = $('<a id="x"><img alt="" src="<%=path %>resources/images/x.png" style="width: 20px;height: 20px;"></a>');
	$("button").after(a);
	a.attr("style","position: absolute;opacity: 0.2;left:"+(x-25)+";top:"+(y+7)+";");
	$("#x").click(function(){
		$("input").val("");
	});
	$('button').click(function(){
		$(this).text("正在解析");
		press++;
		if(press==2){
			$(this).attr("disabled", true);
		}
	});
});
</script>
</html>
