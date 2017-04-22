<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="com.cts.localtour.entity.UserTable" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath()+"/"; %>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>
<style type="text/css">
	#ui-datepicker-div a{
		text-align: center;
	}
	#ui-datepicker-div span{
		text-align: center;
	}
	/* #checkTable a {
		position:relative;
	}
	#checkTable a:hover:before {
		position:absolute;
		top:20px;
		left:0;
		content:attr(title);
		color:#000000;
		border:1px solid #242424;
		background-color:#E5E5E5;
	} */
</style>

<link rel="stylesheet" href="${path }resources/assets/css/jquery-ui-1.10.3.full.min.css">
<link rel="stylesheet" href="${path }resources/assets/css/chosen.css" />

<jsp:include page="../../../resources/include/pageSettings.jsp"></jsp:include>
<jsp:include page="../../../resources/include/sider.jsp"></jsp:include>
<!-- 正文开始 -->
				<div class="main-content">
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
						<div class="tab-content profile-edit-tab-content">
							<div id="edit-basic" class="tab-pane in active">
								<h4 class="header blue bolder smaller">微信设置</h4>
								<div class="row">
									<p>如需使用通知功能请使用微信扫描下方二维码，关注港中旅企业号。</p>
									<img alt="二维码" src="${path }resources/assets/images/settings/qrcode.jpg">
									<div><p  style="display: inline-block;">是否接收微信通知：</p>
										<label>
											<input name="switch-field-1" class="ace ace-switch ace-switch-6" type="checkbox" checked="checked">
											<span class="lbl"></span>
										</label>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</div>
				</div>
<!-- 正文结束 -->	
	
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>

