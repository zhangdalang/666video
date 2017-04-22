<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
								<a href="#">组团社管理</a>
							</li>
						</ul><!-- .breadcrumb -->
						<div class="accessBar" style="display: inline-block;">
							<shiro:hasPermission name="customerAgency:save">
								<a class="blue" id="add" data-toggle="modal" href="#" title="新增组团社">
									<i class="icon-plus bigger-100"></i>
									新增组团社
								</a>
							</shiro:hasPermission>
						</div>
						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }customerAgencyManage" method="get">
								<span class="input-icon">
									<input name="key" placeholder="搜索 ..." class="nav-search-input" id="nav-search-input" autocomplete="off" type="text" value="${key }" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>
					
										<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid"><table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
						<thead>
							<tr role="row">
								<th aria-label="" style="width: 50px;" colspan="1" rowspan="1" role="columnheader" class="center sorting_disabled">
									<label>
										<input class="ace" type="checkbox">
										<span class="lbl"></span>
									</label>
								</th>
								<th aria-label="Domain: activate to sort column ascending" style="width: 50px;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									id
								</th>
								<th aria-label="Price: activate to sort column ascending" style="width: 187px;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									组团社名
								</th>
								<th aria-label="Price: activate to sort column ascending" style="width: 15%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									地区
								</th>
								<th aria-label="Price: activate to sort column ascending" style="width: 15%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									电话
								</th>
								<th aria-label="Clicks: activate to sort column ascending" style="width: 15%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
									有效
								</th>
								
								<th aria-label="" style="width: 15%;" colspan="1" rowspan="1" role="columnheader" class="sorting_disabled">
									操作
								</th>
							</tr>
						</thead>

							<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
<!-- 		增加模板			 -->
							<tr id="addModel" hidden="">
								<td class="center  sorting_1">
									<label>
										<input class="ace" type="checkbox">
										<span class="lbl"></span>
									</label>
								</td>
								<td class="">
									
								</td>
								<td class="">
									<input type="text">
								</td>
								<td  class="">
									
								</td>	
								<td  class="">
									<input id="submit" type="text">
								</td>
								<td class="hidden-480 ">
										<span class="label label-sm label-success">有效</span>
								</td>
								<td class="">
									
								</td>
							</tr>
<!-- 增加模板结束 -->		
<!-- 列表循环 -->								
							<c:forEach var="customerAgency" items="${customerAgencys }" varStatus="status">
								<tr id="" <%-- <c:if test="${status.index%2!=0 }"> --%>class="style:{background-color:#f9f9f9;}"<%-- </c:if> --%>>
									<td class="center  sorting_1">
										<label>
											<input class="ace" type="checkbox">
											<span class="lbl"></span>
										</label>
									</td>
									<td class="">${customerAgency.customerAgencyTable.id }</td>
									<td class="">${customerAgency.customerAgencyTable.customerAgencyName }</td>
									<td class="">
										${customerAgency.regionName }
										<span hidden="">${customerAgency.customerAgencyTable.regionId }</span>
									</td>
									<td class="">${customerAgency.customerAgencyTable.phone }</td>
									<td class="hidden-480 " id="">
									<c:choose>
										<c:when test="${customerAgency.customerAgencyTable.enable }">
											<span class="label label-sm label-success">有效</span>
										</c:when>
										<c:otherwise>
											<span class="label label-sm label-warning">无效</span>
										</c:otherwise>
									</c:choose>
									</td>
	
									<td class=" ">
										<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<shiro:hasPermission name="customerAgency:update">
												<a id="edit" class="green" href="#">
													<i class="icon-pencil bigger-130"></i>
												</a>
											</shiro:hasPermission>
											<span id="">
												<c:choose>
													<c:when test='${customerAgency.customerAgencyTable.enable }'>
														<shiro:hasPermission name="customerAgency:del">
															<a id="${customerAgency.customerAgencyTable.id }" class="red" href="#">
																<i class="icon-trash bigger-130"></i>
															</a>
														</shiro:hasPermission>
													</c:when>
													<c:otherwise>
														<shiro:hasPermission name="customerAgency:recover">
															<a id="${customerAgency.customerAgencyTable.id }" class="green" href="#">
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
											<a href="${path }customerAgencyManage?page=${pageNo-1 }&key=${key }"><i class="icon-double-angle-left"></i></a>
										</li>
										<c:forEach var="page" begin="1" end="${pageMax }">
											<li <c:if test="${pageNo==page }">class="active"</c:if>>
												<a href="${path }customerAgencyManage?page=${page }&key=${key }">${page }</a>
											</li>
										</c:forEach>
										<li <c:choose><c:when test="${pageNo==pageMax }">class="next disabled"</c:when><c:otherwise>class="next"</c:otherwise></c:choose>>
											<a href="${path }customerAgencyManage?page=${pageNo+1 }&key=${key }"><i class="icon-double-angle-right"></i></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
<!-- 分页查询结束 -->							
					</div>
				</div>
<!--部门树模板开始 -->
				<div id="treeView" hidden="">
				  <div id="" class="widget-body" style="position: absolute;width: 300px;margin-left: -9px;margin-top: 20px;display:none;" > 
				   <div class="widget-main padding-8"> 
				    <div id="tree0" class="tree tree-selectable"> 
				  
				    </div> 
				   </div> 
				  </div>
				</div>
<!--部门树模板结束 -->
<!-- 正文结束 -->	
<!-- 下拉搜索开始 -->
<link rel="stylesheet" href="${path }resources/assets/css/chosen.css" />
				<div id="select">
					<select hidden="" style="display: none;" class="" data-placeholder="Choose a Country...">
						<option value="">&nbsp;</option>
						<c:forEach var="region" items="${regions }" varStatus="status">
						<option value="${region.id }">${region.regionName }</option>
						</c:forEach>												
					</select>
				</div>
<!-- 下拉搜索结束 -->					
										
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<!-- 下拉搜索依赖 -->
<script src="${path }resources/assets/js/chosen.jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		
	/* 初始化 */
			$("#customerManage").addClass("open");
			$("#customerManage").children("ul").attr("style","display:block");
			$("#customerAgencyManage").addClass("active");
			$("#addModel").children("td").eq(3).html($("#select").html());
			
	/* 新增 */		
			$("#add").click(function(){
				var isChange = false;
				$("#table").prepend("<tr>"+$("#addModel").html()+"</tr>");
				$("#table").find("select").eq(0).attr("class","width-20 chosen-select");
				$(".chosen-select").chosen({no_results_text: "查无结果", search_contains: true});
				$("#table").find("select").next().attr("style","width:200px;");
				$("#table").find("input").not("#submit").keydown(function(event){
					if(event.keyCode==13&&isChange||event.keyCode==13&&$("#table").find("input").index($(this))==1){
						$(this).parents("td").next().find("input").focus().select();
						isChange = false;
					}
				});
				$("#table").find("select").change(function(){isChange = true;});
			});
	/* 回车保存 */		
		$("#table").delegate("#submit","keydown",function(event){
			if(event.keyCode==13){
				var obj = $(this).parents("tr");
				var input = $(this);
				var customerAgencyName = obj.find("input").eq(1).val();
				var regionId = obj.find("select").val();
				var regionName = obj.find("option:selected").text();
				var phone = obj.find("input").eq(3).val();
				var customerAgency = {customerAgencyName:customerAgencyName,regionId:regionId,phone:phone};
				var myData = JSON.stringify(customerAgency);
			 	$.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }customerAgencyManage/save",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	input.parent().prev().prev().html(customerAgencyName);
			        	input.parent().prev().html(regionName+"<span hidden=''>"+regionId+"</span>");
			        	input.parent().html(phone);
			        }  
				 });
				obj.next().find("input").eq(1).focus().select();
			}
		});
	
	
	/* 删除 */
		$("#table").delegate(".red","click",function(){
			var obj = $(this);
			var myData = {id:obj.attr("id")};
			$.ajax({  
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }customerAgencyManage/del",  
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
			var myData = {id:obj.attr("id")};
			$.ajax({  
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }customerAgencyManage/recover",  
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
	/* 编辑 */
		$("#table").delegate("#edit","click",function(){
			var obj = $(this);
			var td = obj.parents("td").siblings();
			var info = {id:td.eq(-1).children("a").attr("id"),
						customerAgencyName:td.eq(2).text(),
						regionId:td.eq(3).children("span").text(),
						phone:td.eq(4).text()};
			td.eq(2).html("<input id='update' type='text' value='"+info.customerAgencyName+"' style='width:150px' />");
			td.eq(3).html($("#select").html());
			td.eq(3).children("select").attr("class","width-20 chosen-select");
			td.eq(3).children("select").val(info.regionId);
			$(".chosen-select").chosen({no_results_text: "查无结果", search_contains: true});
			td.eq(4).html("<input id='update' type='text' value='"+info.phone+"' style='width:150px' />");
			obj.html("<i class='icon-save bigger-130'></i>").attr({"id":"save","class":"grey"});
		});
	/*回车更新 */		
		$("#table").delegate("#update","keydown",function(event){
			if(event.keyCode==13){
				var obj = $(this).parents("tr");
				var params = $(this).parents("tr").find("input");
		 		var customerAgencyName = params.eq(1).val();
				var id = obj.find(".red").attr("id");
				var regionId = obj.find("select").val();
				var regionName = obj.find("option:selected").text();
				var phone = params.eq(3).val();
				var customerAgency = {id:id,customerAgencyName:customerAgencyName,regionId:regionId,phone:phone};
				var myData = JSON.stringify(customerAgency);
				$.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }customerAgencyManage/update",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	params.eq(1).parent().html(customerAgencyName);
			        	obj.find("select").parent().html(regionName+"<span hidden=''>"+regionId+"</span>");
			        	params.eq(3).parent().html(phone);
			        }  
				 }); 
				obj.find("a").eq(0).html("<i class='icon-pencil bigger-130'></i>").attr({"id":"edit","class":"green"});
				obj.next().find("input").eq(1).focus().select();
			}
		});
		/* 按钮更新 */
		$("#table").delegate("#save","click",function(){
			var obj = $(this).parents("tr");
			var params = $(this).parents("tr").find("input");
	 		var customerAgencyName = params.eq(1).val();
			var id = obj.find(".red").attr("id");
			var regionId = obj.find("select").val();
			var regionName = obj.find("option:selected").text();
			var phone = params.eq(3).val();
			var customerAgency = {id:id,customerAgencyName:customerAgencyName,regionId:regionId,phone:phone};
			var myData = JSON.stringify(customerAgency);
			$.ajax({  
		        type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }customerAgencyManage/update",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	params.eq(1).parent().html(customerAgencyName);
		        	obj.find("select").parent().html(regionName+"<span hidden=''>"+regionId+"</span>");
		        	params.eq(3).parent().html(phone);
		        }  
			 }); 
			obj.find("a").eq(0).html("<i class='icon-pencil bigger-130'></i>").attr({"id":"edit","class":"green"});
			obj.next().find("input").eq(1).focus().select();
		});
			
	
	});
	
</script>
