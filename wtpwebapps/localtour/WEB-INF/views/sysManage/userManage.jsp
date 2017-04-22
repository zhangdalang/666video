<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<a>用户管理</a>
							</li>
						</ul><!-- .breadcrumb -->
						<div class="accessBar" style="display: inline-block;">
							<shiro:hasPermission name="user:save">
								<a id="add" data-toggle="modal" href="#addModel" title="新增用户" style="padding-left: 10px;">
									<i class="icon-plus bigger-100"></i>
									新增用户
								</a>
							</shiro:hasPermission>
						</div>

						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }userManage" method="get">
								<span class="input-icon">
									<input name="key" placeholder="搜索 ..." class="nav-search-input" id="nav-search-input" autocomplete="off" type="text" value="${key }" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>
					
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
						<table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
							<thead>
								<tr role="row">
									<th aria-label="Domain: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										用户名
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										姓名
									</th>
									<th aria-label="Clicks: activate to sort column ascending" style="width: 20%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
										部门
									</th>
									<th aria-label="Clicks: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
										角色
									</th>
									<th aria-label="Status: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
										职位
									</th>
									<th aria-label="Status: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
										电话
									</th>
									<th aria-label="Status: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
										qq
									</th>
									<th aria-label="Status: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
										状态
									</th>
									<th aria-label="" style="width: 10%;" colspan="1" rowspan="1" role="columnheader" class="sorting_disabled">
										操作
									</th>
								</tr>
							</thead>
	
							<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
	<!-- 列表循环 -->								
								<c:forEach var="user" items="${users }" varStatus="status">
									<tr>
										<td>${user.userTable.userName }</td>
										<td>${user.userTable.realName }</td>
										<td>${user.deptName }</td>
										<td>${user.roleNames }</td>
										<td>${user.userTable.position }</td>
										<td>${user.userTable.phone }</td>
										<td>${user.userTable.qq }</td>
										<td class="hidden-480 ">
										<c:choose>
											<c:when test="${user.userTable.enable }">
												<span class="label label-sm label-success">有效</span>
											</c:when>
											<c:otherwise>
												<span class="label label-sm label-warning">无效</span>
											</c:otherwise>
										</c:choose>
										</td>
		
										<td class=" ">
											<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<shiro:hasPermission name="user:reset">
													<a id="reset" class="blue" href="#">
														<i class="icon-refresh bigger-120"></i>
													</a>
												</shiro:hasPermission>
												<shiro:hasPermission name="user:update">
													<a id="edit" data-toggle="modal" class="green" href="#editModel">
														<i class="icon-pencil bigger-130"></i>
													</a>
												</shiro:hasPermission>
												<span>
													<c:choose>
														<c:when test='${user.userTable.enable }'>
															<shiro:hasPermission name="user:del">
																<a id="${user.userTable.id }" class="red" href="#">
																	<i class="icon-trash bigger-130"></i>
																</a>
															</shiro:hasPermission>
														</c:when>
														<c:otherwise>
															<shiro:hasPermission name="user:recover">
																<a id="${user.userTable.id }" class="green" href="#">
																	<i class="icon-undo bigger-130"></i>
																</a>
															</shiro:hasPermission>
														</c:otherwise>
													</c:choose>
												</span>
											</div>
		
											<div class="visible-xs visible-sm hidden-md hidden-lg">
												<div class="inline position-relative">
													<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
														<i class="icon-caret-down icon-only bigger-120"></i>
													</button>
		
													<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
														<li>
															<a data-original-title="View" href="#" class="tooltip-info" data-rel="tooltip" title="">
																<span class="blue">
																	<i class="icon-refresh bigger-120"></i>
																</span>
															</a>
														</li>
		
														<li>
															<a data-original-title="Edit" href="#" class="tooltip-success" data-rel="tooltip" title="">
																<span class="green">
																	<i class="icon-edit bigger-120"></i>
																</span>
															</a>
														</li>
		
														<li>
															<a data-original-title="Delete" href="#" class="tooltip-error" data-rel="tooltip" title="">
																<span class="red">
																	<i class="icon-trash bigger-120"></i>
																</span>
															</a>
														</li>
													</ul>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
	<!-- 列表循环结束 -->								
							</tbody>
						</table>
<!-- 分页查询开始 -->					
						<div class="row">
							<div class="col-sm-6">
								<div id="sample-table-2_info" class="dataTables_info">共  ${counts } 个结果 </div>
							</div>
							<div class="col-sm-6">
								<div class="dataTables_paginate paging_bootstrap">
									<ul class="pagination">
										<li <c:choose><c:when test="${pageNo==1 }">class="prev disabled"</c:when><c:otherwise>class="prev"</c:otherwise></c:choose>>
											<a href="${path }userManage?page=${pageNo-1 }&key=${key }"><i class="icon-double-angle-left"></i></a>
										</li>
										<c:forEach var="page" begin="1" end="${pageMax }">
											<li <c:if test="${pageNo==page }">class="active"</c:if>>
												<a href="${path }userManage?page=${page }&key=${key }">${page }</a>
											</li>
										</c:forEach>
										<li <c:choose><c:when test="${pageNo==pageMax }">class="next disabled"</c:when><c:otherwise>class="next"</c:otherwise></c:choose>>
											<a href="${path }userManage?page=${pageNo+1 }&key=${key }"><i class="icon-double-angle-right"></i></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
<!-- 分页查询结束 -->							
					</div>
				</div>
<!--部门树模板开始 -->
				<!-- <div id="treeView" hidden="">
				  <div class="widget-body" style="position: absolute;width: 300px;margin-left: -9px;margin-top: 20px;display:none;" > 
				   <div class="widget-main padding-8"> 
				    <div id="tree0" class="tree tree-selectable"> 
				  
				    </div> 
				   </div> 
				  </div>
				</div> -->
<!--部门树模板结束 -->
<!-- 正文结束 -->

<!-- 新增模板 -->
				<div aria-hidden="true" style="display: none;" id="addModel" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width: 80%;">
						<div class="modal-content">
					        <div class="modal-header no-padding">
								<div class="table-header">
									新增用户
						 		</div>
						  	</div>
							<div class="modal-body no-padding">
					         	<table class="table table-striped table-bordered table-hover incomeTable">
									<tbody>
										<tr>
											<td style="width: 25%">用户名</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
											<td style="width: 25%">真实姓名</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
										</tr>
										<tr>
											<td>职位</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
											<td>电话</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
										</tr>
										<tr>
											<td>qq</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
											<td>部门</td>
											<td style="width: 25%"><input id="deptId" style="width: 100%" type="text" /></td>
										</tr>
									</tbody>
					            </table>
					        </div>
					        <div id="r" style="position: relative;height: 300px;top: -20px;">
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
												<th>
													角色名
												</th>
											</tr>
										</thead>
										<tbody id="roleTable" aria-relevant="all" aria-live="polite" role="alert">
										</tbody>
									</table>
								</div>
								<!-- <button id="saveRole" class="btn btn-sm btn-success pull-left" data-dismiss="modal">
									<i class="icon-save"></i>
									保存角色
								</button> -->
							</div>
							<div class="modal-footer no-margin-top">
								<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
									<i class="icon-remove"></i>
									取消
								</button>
								<button id="save" class="btn btn-sm btn-success pull-right" data-dismiss="modal">
									<i class="icon-save"></i>
									保存
								</button>
						 	 </div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
<!-- 新增结束 -->
<!-- 编辑模板 -->
				<div aria-hidden="true" style="display: none;" id="editModel" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width: 80%;">
						<div class="modal-content">
					        <div class="modal-header no-padding">
								<div class="table-header">
									编辑用户
						 		</div>
						  	</div>
							<div class="modal-body no-padding">
					         	<table class="table table-striped table-bordered table-hover incomeTable">
									<tbody id="userInfo">
										<tr>
											<td style="width: 25%">用户名</td>
											<td style="width: 25%"></td>
											<td style="width: 25%">真实姓名</td>
											<td style="width: 25%"></td>
										</tr>
										<tr>
											<td>职位</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
											<td>电话</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
										</tr>
										<tr>
											<td>qq</td>
											<td style="width: 25%"><input style="width: 100%" type="text" /></td>
											<td>部门</td>
											<td style="width: 25%"></td>
										</tr>
										<tr>
											<td>查看部门</td>
											<td style="width: 25%"><input id="checkDept" style="width: 100%" type="text" /></td>
										</tr>
									</tbody>
					            </table>
					        </div>
					        <div id="r" style="position: relative;height: 300px;top: -20px;">
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
												<th>
													角色名
												</th>
											</tr>
										</thead>
										<tbody id="roleTable" aria-relevant="all" aria-live="polite" role="alert">
										</tbody>
									</table>
								</div>
								<!-- <button id="saveRole" class="btn btn-sm btn-success pull-left" data-dismiss="modal">
									<i class="icon-save"></i>
									保存角色
								</button> -->
							</div>
							<div class="modal-footer no-margin-top">
								<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
									<i class="icon-remove"></i>
									取消
								</button>
								<button id="saveEdit" class="btn btn-sm btn-success pull-right" data-dismiss="modal">
									<i class="icon-save"></i>
									保存
								</button>
						 	 </div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
<!-- 编辑结束 -->
		
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<script type="text/javascript">
	var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
</script>
<script src="<%=path %>resources/assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>									
<script src="<%=path %>resources/assets/js/fuelux/fuelux.tree.min.js"></script>
<script type="text/javascript">
	$(function(){
	/* 初始化 */
			$(".nav-list").children("li").attr('class','');
			$("#systemManage").addClass("open");
			$("#systemManage").children("ul").attr("style","display:block");
			$("#userManage").addClass("active");
			/* 删除 */
			$("#table").delegate(".red","click",function(){
				var obj = $(this);
				var myData = {id:obj.attr("id"),userName:obj.parent().parent().parent().siblings().eq(1).children("a").text()};
				$.ajax({  
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }userManage/del",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	obj.attr("class","green");
			        	obj.children("i").attr("class","icon-undo bigger-130");
			        	var span = obj.parents("td").prev().children("span");
			        	span.attr("class","label label-sm label-warning");
			        	span.text("无效");
			        }  
				}); 
			});
		/* 恢复 */
			$("#table").delegate("span .green","click",function(){
				var obj = $(this);
				var myData = {id:obj.attr("id"),userName:obj.parent().parent().parent().siblings().eq(1).children("a").text()};
				$.ajax({  
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }userManage/recover",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	obj.attr("class","red");
			        	obj.children("i").attr("class","icon-trash bigger-130");
			        	var span = obj.parents("td").prev().children("span");
			        	span.attr("class","label label-sm label-success");
			        	span.text("有效");
			        }  
				}); 
			});
		
		/* 重置密码 */		
			$("#table").delegate("#reset","click",function(){
				var obj = $(this).parents("tr");
				var id = obj.find(".red").attr("id");
				var myData = {id:id};
				$.ajax({  
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }userManage/reset",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
						alert("密码重置成功");
			        }  
				 }); 
			});
		/* 新增用户 */
			$("#add").click(function(){
				if($("#roleTable").children("tr").length==0){
					$.ajax({
				        type: "GET",
				        contentType:"application/json;charset=utf-8",
				        url:"${path }userManage/initRole",
				        dataType: "json",
				        async: false,
				        success:function(data){
							$.each(data,function(){
								$("#roleTable").append('<tr id="'+this.id+'">'+
															'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
															'<td>'+this.remark+'</td>'+
														'</tr>');
							});
				        }
					}); 
				}
			});
		/* 选择本行 */
			$("#roleTable").delegate("td:not(.sorting_1)","click",function(){
				if($(this).prev().find("input").prop("checked")){
					$(this).prev().find("input").prop("checked",false);
				}else{
					$(this).prev().find("input").prop("checked",true);
				}
			});
			$("#editModel").find("#roleTable").delegate("td:not(.sorting_1)","click",function(){
				if($(this).prev().find("input").prop("checked")){
					$(this).prev().find("input").prop("checked",false);
				}else{
					$(this).prev().find("input").prop("checked",true);
				}
			});
		/* 选择部门 */
			$("#deptId").click(function(){
				if($("#tree1").length==0){
					$(this).parent().append('<div class="widget-body" style="position: absolute;z-index: 200;"><div id="tree1" class="tree"></div></div>');
					var tree_data;
					$.ajax({
				        type: "GET",
				        contentType:"application/json;charset=utf-8",
				        url:"${path }deptManage/getTree",
				        dataType: "json",
				        async: false,
				        success:function(data){
				        	tree_data = data;
				        }
					}); 
					var treeDataSource = new DataSourceTree({data: tree_data});
					$('#tree1').ace_tree({
						dataSource: treeDataSource ,
						multiSelect:true,
						loadingHTML:'',
						'open-icon' : 'icon-minus',
						'close-icon' : 'icon-plus',
						'selectable' : true,
						'selected-icon' : 'icon-ok',
						'unselected-icon' : 'icon-remove'
					});
				}else{
					$(".widget-body").show();
				}
			});
		/* 设置部门 */
			var addDeptCache = "";
			$("#addModel").delegate(".tree-folder-name","click",function(){
				$("#deptId").val($(this).attr("id"));
				$(".widget-body").hide();
				addDeptCache = $(this).text();
			});
		
		/* 保存 */
			$("#save").click(function(){
				var inputs = $("#addModel").find("input");
		 		var userName = inputs.eq(0).val();
				var realName = inputs.eq(1).val();
				var position = inputs.eq(2).val();
				var phone = inputs.eq(3).val();
				var qq = inputs.eq(4).val();
				var deptId = inputs.eq(5).val();
				var userTable = {userName:userName,realName:realName,deptId:deptId,position:position,phone:phone,qq:qq};
				var roleTables = new Array();
				var trs = $("#roleTable").children("tr");
				$.each(trs,function(){
					if($(this).find("input").prop("checked")){
						roleTables.push({
							id:$(this).attr("id"),
							remark:$(this).children("td").eq(1).text()
						});
					}
				});
				var full = {userTable:userTable,roleTables:roleTables};
				var myData = JSON.stringify(full);
				$.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }userManage/save",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	if(data==-1){
			        		alert("用户名，部门为必填项");
			        	}else if(data==-2){
			        		alert("用户名存在或数据库字段异常");
			        	}else if(data>0){
			        		var roleNames = "";
			        		$.each(roleTables,function(){
			        			roleNames = this.remark+"&nbsp;&nbsp;"+roleNames;
			        		});
			        		$("#table").prepend('<tr>'+
			        								'<td>'+userName+'</td>'+
			        								'<td>'+realName+'</td>'+
			        								'<td>'+addDeptCache+'</td>'+
			        								'<td>'+roleNames+'</td>'+
			        								'<td>'+position+'</td>'+
			        								'<td>'+phone+'</td>'+
			        								'<td>'+qq+'</td>'+
			        								'<td><span class="label label-sm label-success">有效</span></td>'+
			        								'<td><div class="visible-md visible-lg hidden-sm hidden-xs action-buttons"><a id="reset" class="blue" href="#"><i class="icon-refresh bigger-120"></i></a><a id="edit" class="green" href="#"><i class="icon-pencil bigger-130"></i></a><span><a id="'+data+'" class="red" href="#"><i class="icon-trash bigger-130"></i></a></span></div></td>'+
			        							'</tr>');
			        	}
			        }  
				 }); 
			});
		/* 编辑 */
		$("#table").delegate("#edit","click",function(){
			var userId = $(this).next().children("a").attr("id");
			$("#saveEdit").parent().attr("id",userId);
			var myData = {userId:userId}
			$.ajax({  
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }userManage/find",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	var tds = $("#userInfo").find("td");
		        	tds.eq(1).text(data.userTable.userName);
		        	tds.eq(3).text(data.userTable.realName);
		        	tds.eq(5).children("input").val(data.userTable.position);
		        	tds.eq(7).children("input").val(data.userTable.phone);
		        	tds.eq(9).children("input").val(data.userTable.qq);
		        	tds.eq(11).text(data.deptName);
		        	tds.eq(13).children("input").val(data.userTable.dataDeptIds);
		        	var tbody = $("#editModel").find("#roleTable");
		        	if(tbody.children("tr").length==0){
						$.ajax({
					        type: "GET",
					        contentType:"application/json;charset=utf-8",
					        url:"${path }userManage/initRole",
					        dataType: "json",
					        async: false,
					        success:function(data){
								$.each(data,function(){
									tbody.append('<tr id="'+this.id+'">'+
																'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
																'<td>'+this.remark+'</td>'+
															'</tr>');
								});
					        }
						}); 
					}
		        	tbody.find("input").prop("checked",false);
		        	$.each(data.roleTables,function(){
		        		tbody.children("#"+this.id).find("input").prop("checked",true);
		        	});
		        }  
			});
		});
		
		/* 选择查看部门 */
		$("#checkDept").click(function(){
			if($("#tree2").length==0){
				$(this).parent().append('<div class="widget-body" style="position: absolute;z-index: 200;"><div id="tree2" class="tree"></div></div>');
				var tree_data;
				$.ajax({
			        type: "GET",
			        contentType:"application/json;charset=utf-8",
			        url:"${path }deptManage/getTree",
			        dataType: "json",
			        async: false,
			        success:function(data){
			        	tree_data = data;
			        }
				}); 
				var treeDataSource = new DataSourceTree({data: tree_data});
				$('#tree2').ace_tree({
					dataSource: treeDataSource ,
					multiSelect:true,
					loadingHTML:'',
					'open-icon' : 'icon-minus',
					'close-icon' : 'icon-plus',
					'selectable' : true,
					'selected-icon' : 'icon-ok',
					'unselected-icon' : 'icon-remove'
				});
			}else{
				$(".widget-body").show();
			}
		});
	/* 设置查看部门 */
		var checkDeptCache = "";
		$("#editModel").delegate(".tree-folder-name","click",function(){
			if($("#checkDept").val()==""){
				$("#checkDept").val($(this).attr("id"));
				checkDeptCache = $(this).text();
			}else{
				$("#checkDept").val($("#checkDept").val()+", "+$(this).attr("id"));
				checkDeptCache = checkDeptCache+", "+$(this).text();
			}
			$(".widget-body").hide();
		});
		
		/* 更新 */
		$("#saveEdit").click(function(){
			var inputs = $("#userInfo").find("input");
			var id = $(this).parent().attr("id");
			var position = inputs.eq(0).val();
			var phone = inputs.eq(1).val();
			var qq = inputs.eq(2).val();
			var dataDeptIds = inputs.eq(3).val();
			var userTable = {id:id,position:position,phone:phone,qq:qq,dataDeptIds:dataDeptIds};
			var roleTables = new Array();
			var trs = $("#editModel").find("#roleTable").find("tr");
			$.each(trs,function(){
				if($(this).find("input").prop("checked")){
					roleTables.push({
						id:$(this).attr("id"),
						remark:$(this).children("td").eq(1).text()
					});
				}
			});
			var full = {userTable:userTable,roleTables:roleTables};
			var myData = JSON.stringify(full);
			$.ajax({  
		        type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }userManage/update",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	if(data==-1){
		        		alert("参数错误");
		        	}else{
		        		var roleNames = "";
		        		$.each(roleTables,function(){
		        			roleNames = this.remark+"  "+roleNames;
		        		});
		        		var tds = $("#table").find("#"+id).parent().parent().parent().siblings();
		        		tds.eq(3).text(roleNames);
		        		tds.eq(4).text(position);
		        		tds.eq(5).text(phone);
		        		tds.eq(6).text(phone);
		        	}
		        }  
			 }); 
		});
	/* 新增 */		
			/* $("#add").click(function(){
				$("#table").prepend("<tr>"+$("#addModel").html()+"</tr>");
				$("#table").find("input").not("#submit").keydown(function(event){
					if(event.keyCode==13){
						if($(this).parent().next().children("input").attr("id")=="deptId"){
							$(this).parent().next().next().children("input").focus().select();
						}else{
							$(this).parent().next().children("input").focus().select();
						}
					}
				});
			}); */
	/* 回车保存 */		
		/* $("#table").delegate("#submit","keydown",function(event){
			if(event.keyCode==13){
				var obj = $(this).parents("tr");
				var params = $(this).parents("tr").find("input");
		 		var userName = params.eq(1).val();
				var realName = params.eq(2).val();
				var deptId = params.eq(3).val();
				var deptName =  params.eq(3).parent().text();
				var position = params.eq(4).val();
				var phone = params.eq(5).val();
				var qq = params.eq(6).val();
				var user = {userName:userName,realName:realName,deptId:deptId,position:position,phone:phone,qq:qq};
				var myData = JSON.stringify(user);
				$.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }userManage/save",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	params.eq(1).parent().html(userName);
			        	params.eq(2).parent().html(realName);
			        	params.eq(3).parent().html(deptName);
			        	params.eq(4).parent().html(position);
			        	params.eq(5).parent().html(phone);
			        	params.eq(6).parent().html(qq);
			        }  
				 }); 
				obj.next().find("input").eq(1).focus().select();
			}
		}); */
	
	/* 编辑 */
		/* $("#table").delegate("#edit","click",function(){
			var obj = $(this);
			var td = obj.parents("td").siblings();
			var info = {id:td.eq(-1).children("a").attr("id"),
						userName:td.eq(1).children("a").text(),
						realName:td.eq(2).text(),
						deptId:td.eq(3).children("input").val(),
						deptName:td.eq(3).text(),
						position:td.eq(4).text(),
						phone:td.eq(5).text(),
						qq:td.eq(6).text()};
			var myData = JSON.stringify(info);
			td.eq(1).html("<input type='text' value='"+info.userName+"' style='width:150px' />");
			td.eq(2).html("<input type='text' value='"+info.realName+"' style='width:150px' />");
			td.eq(3).html("<a id='showTree' herf='#' style='cursor:pointer'>"+info.deptName+"</a>");
			td.eq(3).append("<input id='deptId' value='"+info.deptId+"' type='hidden' style='width:150px' />");
			td.eq(4).html("<input type='text' value='"+info.position+"' style='width:100px' />");
			td.eq(5).html("<input type='text' value='"+info.phone+"' style='width:100px' />");
			td.eq(6).html("<input id='update' type='text' value='"+info.qq+"' style='width:100px' />");
			obj.html("<i class='icon-save bigger-130'></i>").attr({"id":"save","class":"grey"});
		}); */
		/* 更新 */		
		/* $("#table").delegate("#update","keydown",function(event){
			if(event.keyCode==13){
				var obj = $(this).parents("tr");
				var params = $(this).parents("tr").find("input");
		 		var userName = params.eq(1).val();
				var realName = params.eq(2).val();
				var deptId = params.eq(3).val();
				var deptName =  params.eq(3).parent().text();
				var position = params.eq(4).val();
				var phone = params.eq(5).val();
				var qq = params.eq(6).val();
				var id = obj.find(".red").attr("id");
				var user = {id:id,userName:userName,realName:realName,deptId:deptId,position:position,phone:phone,qq:qq};
				var myData = JSON.stringify(user);
				$.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }userManage/update",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	params.eq(1).parent().html("<a id='' role='button' data-toggle='modal' href='#modal-table'>"+userName+"</a>");
			        	params.eq(2).parent().html(realName);
			        	params.eq(3).parent().html(deptName).append("<input value='"+deptId+"' type='hidden'>");
			        	params.eq(4).parent().html(position);
			        	params.eq(5).parent().html(phone);
			        	params.eq(6).parent().html(qq);
			        }  
				 }); 
				obj.next().find("input").eq(1).focus().select();
			}
		}); */
		/* 按钮更新 */
		/* $("#table").delegate("#save","click",function(){
				var obj = $(this).parents("tr");
				var params = $(this).parents("tr").find("input");
		 		var userName = params.eq(1).val();
				var realName = params.eq(2).val();
				var deptId = params.eq(3).val();
				var deptName =  params.eq(3).parent().text();
				var position = params.eq(4).val();
				var phone = params.eq(5).val();
				var qq = params.eq(6).val();
				var id = obj.find(".red").attr("id");
				var user = {id:id,userName:userName,realName:realName,deptId:deptId,position:position,phone:phone,qq:qq};
				var myData = JSON.stringify(user);
				$.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }userManage/update",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	params.eq(1).parent().html("<a id='' role='button' data-toggle='modal' href='#modal-table'>"+userName+"</a>");
			        	params.eq(2).parent().html(realName);
			        	params.eq(3).parent().html(deptName).append("<input value='"+deptId+"' type='hidden'>");
			        	params.eq(4).parent().html(position);
			        	params.eq(5).parent().html(phone);
			        	params.eq(6).parent().html(qq);
			        }  
				 }); 
				$(this).html("<i class='icon-pencil bigger-130'></i>").attr({"id":"edit","class":"green"});
			}); */
		
		/* 更改部门 */
		/* $("#table").delegate("#showTree","click",function(){
			var obj = $(this);
			var html = $("#treeView").html();
			$(obj).parent().append(html);
			$(obj).next().next().attr("id","deptTree");
			$("#tree0").empty();
	 			 $.ajax({  
				        type: "POST",  
				        contentType:"application/json;charset=utf-8",  
				        url:"${path }deptManage/getTree", 
				        dataType: "json",  
				        async: false,  
				        success:function(data){
				        	var maxLevel = 0;
				        	for (var int = 0; int < data.length; int++) {
				        		if(data[int].deptLevel>maxLevel){
				        			maxLevel=data[int].deptLevel;
				        		}
				        	}
				        	for (var level = 1; level <= maxLevel; level++) {            
				        		for (var index = 0; index < data.length; index++) {       
					        		if(data[index].deptLevel==level){					
										if(level==1){
											$("#tree0").append("<div class='tree-folder' style='display: block;'><div class='tree-folder-header'><i class='icon-minus' onclick='sildeDept(this)'></i><div class='tree-folder-name' onclick='setUpperDept(this,"+data[index].id+","+data[index].deptLevel+")'>"+data[index].deptName+"</div></div><div id='tree"+data[index].id+"' style='display: block;' class='tree-folder-content'></div><div class='tree-loader' style='display: none;'><div class='tree-loading'><i class='icon-refresh icon-spin blue'></i></div></div></div>");
											
										}else{
											$("#tree"+data[index].upperDeptId).append("<div class='tree-folder' style='display: block;'><div class='tree-folder-header'><i class='icon-minus' onclick='sildeDept(this)'></i><div class='tree-folder-name' onclick='setUpperDept(this,"+data[index].id+","+data[index].deptLevel+")'>"+data[index].deptName+"</div></div><div id='tree"+data[index].id+"' style='display: block;' class='tree-folder-content'></div><div class='tree-loader' style='display: none;'><div class='tree-loading'><i class='icon-refresh icon-spin blue'></i></div></div></div>");
											
										}
					        		}
					        	}
							}

				 			$("#deptTree").slideDown();
				        }  
				 }); 
		}); */
		
	
	
	});
	/* function setUpperDept(obj,deptId,level){
		$(obj).parents("td").children("input").val(deptId);
		$(obj).parents("td").children("a").text($(obj).html());
		$("#deptTree").remove();
	}
	
	function sildeDept(obj){
		if($(obj).attr("class")=="icon-minus"){
			$(obj).attr("class","icon-plus");
		}else{
			$(obj).attr("class","icon-minus");
		}
		$(obj).parent().next().slideToggle();
	} */
	
</script>
