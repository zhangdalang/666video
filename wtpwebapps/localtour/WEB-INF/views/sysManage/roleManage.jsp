<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath()+"/"; %>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>
<jsp:include page="../../../resources/include/pageSettings.jsp"></jsp:include>
<jsp:include page="../../../resources/include/sider.jsp"></jsp:include>

<!-- 正文开始 -->	
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-user"></i>
								<a id="" href="#">角色管理</a>
							</li>

							
							
						</ul><!-- .breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }userManage" method="get">
								<span class="input-icon">
									<input name="key" placeholder="搜索 ..." class="nav-search-input" id="nav-search-input" autocomplete="off" type="text" value="${key }" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>
					<div id="r">
						<div  style="overflow: auto;height: 100%;position: relative;">
							<table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
								<thead>
									<tr role="row">
										<th>
											角色名
											<shiro:hasPermission name="role:save">
												<a id="addRole" href="#"><i style="float: right;" class="blue icon-plus bigger-130"></i></a>
											</shiro:hasPermission>
										</th>
									</tr>
								</thead>
								<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
	<!-- 列表循环 -->					<c:forEach var="role" items="${roles.roleTables }" varStatus="status">
										<tr id="${role.id }">
											<td>${role.remark }</td>
										</tr>
									</c:forEach>
	<!-- 列表循环结束 -->								
								</tbody>
							</table>
						</div>
						<!-- <button id="saveRole" class="btn btn-sm btn-success pull-left" data-dismiss="modal">
							<i class="icon-save"></i>
							保存角色
						</button> -->
					</div>
					<div id="p">
						<div style="overflow: auto;height: 100%;position: relative;">
							<table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
								<thead>
									<tr role="row">
										<th aria-label="" style="width: 1%;" colspan="1" rowspan="1" role="columnheader" class="center sorting_disabled">
											<label>
												<input id="selectAll" class="ace" type="checkbox">
												<span class="lbl"></span>
											</label>
										</th>
										<th aria-label="Domain: activate to sort column ascending" style="width: 256px;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
											权限名
										</th>
									</tr>
								</thead>
								<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
	<!-- 列表循环 -->					<c:forEach var="permissionViewModel" items="${roles.permissionViewModels }" varStatus="status">
										<tr id="${permissionViewModel.permissionTable.id }" class="${permissionViewModel.type }">
											<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>
											<td>${permissionViewModel.permissionTable.remark }</td>
										</tr>
									</c:forEach>
	<!-- 列表循环结束 -->								
								</tbody>
							</table>
						</div>
						<div>
							<shiro:hasPermission name="role:update">
								<button id="savePermission" class="btn btn-sm btn-success pull-left" data-dismiss="modal" style="margin-top: 10px;">
									<i class="icon-save"></i>
									保存权限
								</button>
								<i id="spinner" class="icon-spinner icon-spin bigger-200" style="margin-top: 10px;display: none;"></i>
							</shiro:hasPermission>
						</div>
					</div>
				</div>

<!-- 正文结束 -->	

<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
	/* 初始化 */
		$(".nav-list").children("li").attr('class','');
		$("#systemManage").addClass("open");
		$("#systemManage").children("ul").attr("style","display:block");
		$("#roleManage").addClass("active");
		$("#p").attr("style","display: inline-block;width: 50%;position: relative;float: right;height: "+$(window).height()*0.8+"px;");
		$("#r").attr("style","display: inline-block;width: 50%;position: relative;float: left;height: "+$(window).height()*0.8+"px;");
		/* 点击本行选择 */
		$("#p").find("tbody").find("td").not(".sorting_1").click(function(){
			var tr = $(this).parent();
			var input = tr.find("input");
			if(input.prop("checked")==true){
				input.prop("checked",false);
			}else{
				input.prop("checked",true);
			}
			if(tr.hasClass("menu")){
				var type =tr.attr("class").split(" ")[1];
				$("."+type).find("input").prop("checked",input.prop("checked"));
			}else if(tr.hasClass("modular")){
				var modular = tr.attr("class").split(" ")[1];
				$("."+modular).find("input").prop("checked",input.prop("checked"));
			}else{
				$(".modular."+tr.attr("class").split(" ")[0]+"."+tr.attr("class").split(" ")[1]).find("input").prop("checked",input.prop("checked"));
			}
		});
		/* 点击checkbox选择 */
		$("#p").find("tbody").find("input").click(function(){
			var tr = $(this).parent().parent().parent();
			var input = $(this);
			if(tr.hasClass("menu")){
				var type =tr.attr("class").split(" ")[1];
				$("."+type).find("input").prop("checked",input.prop("checked"));
			}else if(tr.hasClass("modular")){
				var modular = tr.attr("class").split(" ")[1];
				$("."+modular).find("input").prop("checked",input.prop("checked"));
			}
		});
		/* 全选 */
		$("#selectAll").click(function(){
			$("#p").find("input").prop("checked",$(this).prop("checked"));
		});
		/* 添加角色 */
		$("#addRole").click(function(){
			$("#r").find("tbody").prepend('<tr><td><input type="text" placeholder="回车键保存"></td></tr>');
		});
		/* 保存角色 */
		$("#r").delegate("input","keydown",function(event){
			var input = $(this);
			if(event.keyCode==13){
				roleTable={remark:input.val()};
				var myData = JSON.stringify(roleTable);
				$.ajax({
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }roleManage/save",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	input.parent().attr("id",data);
			        	input.parent().append(input.val());
			        	input.remove();
			        	$("#savePermission").parent().attr("id",data);
			        }  
				});
			}
		});
		/* 点击角色 */
		$("#r").delegate("tr","click",function(){
			$("#r").find("tbody").find("i").remove();
			$(this).children("td").append('<i class="blue bigger-130  icon-double-angle-right pull-left">');
			var roleId = $(this).attr("id");
			$("#savePermission").parent().attr("id",roleId);
			var myData = {roleId:roleId}
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }permissionSManage/find",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	$("#p").find("input").prop("checked",false);
		        	$.each(data,function(){
		        		$("#p").find("#"+this.id).find("input").prop("checked",true);
		        	});
		        }  
			});
		});
		/* 保存权限 */
		$("#savePermission").click(function(){
			var button = $(this);
			var roleId = $(this).parent().attr("id");
			if(roleId!=undefined){
				button.hide();
				$("#spinner").show();
				var inputs = $("#p").find("input:checked");
				var rolePermissionTable = new Array();
				$.each(inputs,function(){
					if($(this).parent().parent().parent().attr("id")!=""){
						rolePermissionTable.push({
							roleId:roleId,
							permissionId:$(this).parent().parent().parent().attr("id")
						});
					}
				});
				var myData = JSON.stringify(rolePermissionTable);
				$.ajax({
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }permissionSManage/update",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	button.show();
			        	$("#spinner").hide();
			        }  
				});
			}else{
				alert("没有选择角色");
			}
		});
	});
</script>
