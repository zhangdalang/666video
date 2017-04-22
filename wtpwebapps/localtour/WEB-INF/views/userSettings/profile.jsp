<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="com.cts.localtour.entity.UserTable" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
								<h4 class="header blue bolder smaller">基本资料修改</h4>
								<div>
									<table>
										<tbody id="info">
											<tr>
												<td>电话:</td>
												<td><input type="text" value="<shiro:principal property="phone"/>" /></td>
											</tr>
											<tr>
												<td>qq:</td>
												<td><input type="text" value="<shiro:principal property="qq"/>" /></td>
											</tr>
											<tr>
												<td>邮箱:</td>
												<td><input type="text" value="<shiro:principal property="email"/>" /></td>
											</tr>
										</tbody>
									</table>
									<div id="<shiro:principal property="id"/>">
										<button id="saveInfo" class="btn btn-sm btn-success pull-left" data-dismiss="modal">
											<i class="icon-save"></i>
											保存
										</button>
									</div>
								</div>
								<hr>
								<h4 class="header blue bolder smaller">密码修改</h4>
								<div>
									<span class="red">${msg }</span>
									<table>
										<tbody id="password">
											<tr>
												<td>原始密码:</td>
												<td><input type="password" value="" /></td>
											</tr>
											<tr>
												<td>新密码:</td>
												<td><input type="password" value="" /></td>
											</tr>
											<tr>
												<td>再次输入新密码:</td>
												<td><input type="password" value="" /></td>
											</tr>
												
											
										</tbody>
									</table>
									<div id="<shiro:principal property="id"/>">
										<button id="savePassWord" class="btn btn-sm btn-success pull-left" data-dismiss="modal">
											<i class="icon-save"></i>
											保存
										</button>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</div>
				</div>
<!-- 正文结束 -->	
	
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		$("#password").find("input").val("");
		$("#saveInfo").click(function(){
			var inputs = $("#info").find("input");
			var phone = inputs.eq(0).val();
			var qq = inputs.eq(1).val();
			var email = inputs.eq(2).val();
			var user = {id:$(this).parent().attr("id"),
						phone:phone,
						qq:qq,
						email:email};
			var myData = JSON.stringify(user);
			$.ajax({
				type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }profile/updateInfo",  
		        data:myData,  
		        dataType: "json",
		        async: false,
		        success:function(data){
		        	
		        }
			});
			alert("保存成功");
			/* 此处因为从Subjec取出的信息必须重新登录才能正确显示 */
			inputs.eq(0).val(phone);
			inputs.eq(1).val(qq);
			inputs.eq(2).val(email);
		});
		$("#savePassWord").click(function(){
			var inputs = $("#password").find("input");
			var old = inputs.eq(0).val();
			var new1 = inputs.eq(1).val();
			var new2 = inputs.eq(2).val();
			var myData = {id:$(this).parent().attr("id"), old:old, new1:new1, new2:new2};
			$.ajax({
				type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }profile/updatePw",  
		        data:myData,  
		        dataType: "json",
		        async: false,
		        success:function(data){
		        	if(data==1){
		    			alert("保存成功");
		        	}else{
		    			alert("原始密码错误或两次新密码输入不一致");
		        	}
		        }
			});
		});
	});
</script>
