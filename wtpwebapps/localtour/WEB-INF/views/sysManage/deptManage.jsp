<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath()+"/"; %>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>

<link rel="stylesheet" href="<%=path %>resources/assets/css/jquery-ui-1.10.3.full.min.css">
<link rel="stylesheet" href="<%=path %>resources/assets/css/chosen.css" />

<jsp:include page="../../../resources/include/pageSettings.jsp"></jsp:include>
<jsp:include page="../../../resources/include/sider.jsp"></jsp:include>
	
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li id="menu">
								<i class="icon-user"></i>
								<a href="#">部门管理</a>
							</li>
						</ul><!-- .breadcrumb -->
						<div class="accessBar" style="display: inline-block;">
							<shiro:hasPermission name="dept:save">
								<a id="addDept" data-toggle="modal" href="#addModel" title="新增部门" style="padding-left: 10px;">
									<i class="icon-plus bigger-100"></i>
									新增部门
								</a>
							</shiro:hasPermission>
						</div>
						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }deptManage/search">
								<span class="input-icon">
									<input id="search" name="key" placeholder="搜索 ..." class="nav-search-input" id="nav-search-input" autocomplete="off" type="text">
									<i class="icon-search nav-search-icon"></i>
									
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>

					<!-- /.page-content -->
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					<table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
						<thead>
							<tr role="row">
								<th aria-label="" style="width: 98px;" colspan="1" rowspan="1" role="columnheader" class="center sorting_disabled">
									<label>
										<input class="ace" type="checkbox">
										<span class="lbl"></span>
									</label>
								</th>
								<th aria-label="Domain: activate to sort column ascending" style="width: 256px;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									部门名
								</th>
								<th aria-label="Price: activate to sort column ascending" style="width: 187px;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									上级部门
								</th>
								<th aria-label="Clicks: activate to sort column ascending" style="width: 204px;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
									主管领导
								</th>
								
								<th aria-label="Status: activate to sort column ascending" style="width: 246px;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="hidden-480 sorting">
									状态
								</th>
								<th aria-label="" style="width: 263px;" colspan="1" rowspan="1" role="columnheader" class="sorting_disabled">
									操作
								</th>
							</tr>
						</thead>

							<tbody id="deptTable" aria-relevant="all" aria-live="polite" role="alert">
								
							<c:forEach var="deptViewMode" items="${deptViewModes }" varStatus="status">
								<tr>
									<td class="center  sorting_1">
										<label>
											<input class="ace" type="checkbox">
											<span class="lbl"></span>
										</label>
									</td>
	
									<td>
										<a class="findUser" role="button" data-toggle="modal" href="#modal-table">${deptViewMode.deptTable.deptName }</a>
									</td>
									<td class="">
										${deptViewMode.upperDeptName }
										<input type="hidden" value="${deptViewMode.deptTable.upperDeptId }" />
										<input type="hidden" value="${deptViewMode.deptTable.deptLevel }" />
									</td>
									<td class="hidden-480 ">
										${deptViewMode.managerName }
									</td>
	
									<td class="hidden-480">
									<c:choose>
										<c:when test="${deptViewMode.deptTable.enable }">
											<span class="label label-sm label-success">有效</span>
										</c:when>
										<c:otherwise>
											<span class="label label-sm label-warning">无效</span>
										</c:otherwise>
									</c:choose>
									</td>
	
									<td id="${deptViewMode.deptTable.id }">
										<shiro:hasPermission name="dept:save">
											<a id="edit" class="green" href="#">
												<i class="icon-pencil bigger-130"></i>
											</a>
										</shiro:hasPermission>
										<c:choose>
											<c:when test='${deptViewMode.deptTable.enable }'>
												<shiro:hasPermission name="dept:del">
													<a class="red" href="#">
														<i class="icon-trash bigger-130"></i>
													</a>
												</shiro:hasPermission>
											</c:when>
											<c:otherwise>
												<shiro:hasPermission name="dept:del">
													<a class="green undo" href="#">
														<i class="icon-undo bigger-130"></i>
													</a>
												</shiro:hasPermission>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								</c:forEach>
							</tbody>
							</table>
								<div class="row"><div class="col-sm-6">
									<div id="sample-table-2_info" class="dataTables_info">共  ${counts } 个结果 </div>
								</div><div class="col-sm-6">
								<div class="dataTables_paginate paging_bootstrap">
									<ul class="pagination">
										<li <c:choose><c:when test="${pageNo==1 }">class="prev disabled"</c:when><c:otherwise>class="prev"</c:otherwise></c:choose>>
											<a href="${path }deptManage?page=${pageNo-1 }&key=${key }"><i class="icon-double-angle-left"></i></a>
											</li>
										<c:forEach var="page" begin="1" end="${pageMax }">
											<li <c:if test="${pageNo==page }">class="active"</c:if>>
												<a href="${path }deptManage?page=${page }&key=${key }">${page }</a>
											</li>
										</c:forEach>
										<li <c:choose><c:when test="${pageNo==pageMax }">class="next disabled"</c:when><c:otherwise>class="next"</c:otherwise></c:choose>>
											<a href="${path }deptManage?page=${pageNo+1 }&key=${key }"><i class="icon-double-angle-right"></i></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
<!-- 	用户查看	 -->		
				<div aria-hidden="true" style="display: none;" id="modal-table" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width: 1000px">
						<div class="modal-content">
							<div class="modal-header no-padding">
								<div id="headerName" class="table-header">
									
									
								</div>
							</div>

							<div class="modal-body no-padding">
								<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
									<thead>
										<tr>
											<th>用户名</th>
											<th>姓名</th>
											<th>职位</th>
											<th>电话</th>
											<th>qq</th>
											<th>状态</th>
										</tr>
									</thead>

									<tbody id="userTable">
																
									</tbody>
								</table>
							</div>

							<div class="modal-footer no-margin-top">
								<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
									<i class="icon-remove"></i>
									Close
								</button>

								<ul class="pagination pull-right no-margin">
									<li class="prev disabled">
										<a href="#">
											<i class="icon-double-angle-left"></i>
										</a>
									</li>

									<li class="active">
										<a href="#">1</a>
									</li>

									<li>
										<a href="#">2</a>
									</li>

									<li>
										<a href="#">3</a>
									</li>

									<li class="next">
										<a href="#">
											<i class="icon-double-angle-right"></i>
										</a>
									</li>
								</ul>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div>



<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<!-- 下拉搜索依赖 -->
<script src="<%=path %>resources/assets/js/chosen.jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		/* 初始化 */
		$(".nav-list").children("li").attr('class','');
	    $("#systemManage").addClass("open");
	    $("#systemManage").children("ul").attr("style","display:block");
	    $("#deptManage").addClass("active");
	    var user;
	    $.ajax({  
	        type: "GET",  
	        contentType:"application/json;charset=utf-8",  
	        url:"${path }userManage/getCreateInfo",
	        dataType: "json",  
	        async: false,  
	        success:function(data){
	        	user = data;
	        }  
		});
	    /* 新增部门 */
	    $("#addDept").click(function(){
	    	var tr = $('<tr id="addDeptTr">'+
							'<td class="center sorting_1">'+
								'<label>'+
									'<input class="ace" type="checkbox">'+
									'<span class="lbl"></span>'+
								'</label>'+
							'</td>'+
							'<td>'+
								'<input type="text" />'+
							'</td>'+
							'<td>'+
								'<a href="#" class="showTree">点击选择</a>'+
								'<input type="hidden" value="" />'+
								'<input type="hidden" value="" />'+
							'</td>'+
							'<td>'+
								'<select style="display: none;" multiple="multiple" class="width-20 chosen-select" id="form-field-select-4" data-placeholder="可选多个..."><option value="">&nbsp;</option></select>'+
							'</td>'+
							'<td>'+
									'<span class="label label-sm label-success">有效</span>'+
							'</td>'+
							'<td>'+
								'<a id="save" class="grey" href="#"><i class="icon-save bigger-130"></i></a>'+
							'</td>'+
						'</tr>');
	    	$.each(user,function(){
	    		tr.find("select").append('<option value="'+this.id+'">'+this.realName+'&nbsp;&nbsp;&nbsp;&nbsp;'+this.userName+'&nbsp;&nbsp;&nbsp;&nbsp;</option>');
	    	});
	    	tr.find("select").chosen({no_results_text: "查无结果", search_contains: true});
	    	tr.find("select").next().attr("style","width:100%;");
	    	tr.find("select").next().find("input").attr("style","height:100%;");
			$("#deptTable").prepend(tr);
		});
	    /* 显示部门树 */
	    $("#deptTable").delegate(".showTree","click",function(){
			var tree = $('<div id="deptTree" class="widget-body" style="position: absolute;width: 300px;margin-left: -9px;margin-top: 20px;display:none;">'+
							'<div class="widget-main padding-8">'+
								'<div id="tree0" class="tree tree-selectable">'+
								'</div>'+
							'</div>'+
						'</div>');
			$("#deptTree").remove();
			$(this).parent().append(tree);
			$.ajax({
				type: "POST",  
				contentType:"application/json;charset=utf-8",  
				url:"${path }deptManage/getDeptTree", 
				dataType: "json",  
				async: false,  
				success:function(data){
					var maxLevel = 0;
					for (var int = 0; int < data.length; int++) {
						if(data[int].deptLevel>maxLevel){
							maxLevel=data[int].deptLevel;
						}
					}
			       	for (var level = 1; level <= maxLevel; level++) {             /* 等级循环  */
			       		for (var index = 0; index < data.length; index++) {
			        		if(data[index].deptLevel==level){					/* 寻找当前等级的部门 */
								if(level==1){
									$("#tree0").append("<div class='tree-folder' style='display: block;'>"+
															"<div class='tree-folder-header'>"+
																"<i class='icon-minus'></i>"+
																"<div class='tree-folder-name' level='"+data[index].deptLevel+"'>"+data[index].deptName+"</div>"+
															"</div>"+
															"<div id='tree"+data[index].id+"' style='display: block;' class='tree-folder-content'></div>"+
															"<div class='tree-loader' style='display: none;'>"+
																"<div class='tree-loading'>"+
																	"<i class='icon-refresh icon-spin blue'></i>"+
																"</div>"+
															"</div>"+
														"</div>");
								}else{
									$("#tree"+data[index].upperDeptId).append("<div class='tree-folder' style='display: block;'>"+
																					"<div class='tree-folder-header'>"+
																						"<i class='icon-minus'></i>"+
																						"<div class='tree-folder-name' level='"+data[index].deptLevel+"'>"+data[index].deptName+"</div>"+
																					"</div>"+
																					"<div id='tree"+data[index].id+"' style='display: block;' class='tree-folder-content'></div>"+
																					"<div class='tree-loader' style='display: none;'>"+
																						"<div class='tree-loading'>"+
																							"<i class='icon-refresh icon-spin blue'></i>"+
																						"</div>"+
																					"</div>"+
																				"</div>");
								}
			        		}
			        	}
					}
				}  
			});
			$("#deptTree").slideDown();
	    });
	    /* 部门展开收缩 */
	    $("#deptTable").delegate(".icon-minus","click",function(){
	    	$(this).attr("class","icon-plus");
	    	$(this).parent().next().slideToggle();
	    });
	    $("#deptTable").delegate(".icon-plus","click",function(){
	    	$(this).attr("class","icon-minus");
	    	$(this).parent().next().slideToggle();
	    });
	    /* 点击设置上级部门 */
	    $("#deptTable").delegate(".tree-folder-header","click",function(){
	    	$(this).parents("td").children("a").text($(this).children(".tree-folder-name").text());
	    	$(this).parents("td").children("input").eq(0).val($(this).next().attr("id").substr(4));
	    	$(this).parents("td").children("input").eq(1).val(parseInt($(this).children(".tree-folder-name").attr("level"))+1);
	    	$("#deptTree").remove();
	    });
	    /* 保存 */
	    $("#deptTable").delegate("#save","click",function(){
	    	var tr = $(this).parent().parent();
	    	var inputs = tr.find("input");
	    	var select = tr.find("select");
			if(inputs.eq(2).val()==""){
	    		alert("请选择上级部门");
	    	}else{
	    		var dept = {id:tr.children("td").last().attr("id"),deptName:inputs.eq(1).val(),upperDeptId:inputs.eq(2).val(),deptLevel:inputs.eq(3).val(),managerIds:select.val()==null?"":select.val().toString(),enable:tr.children("td").eq(-2).children("span").attr("class")=="label label-sm label-success"?true:false};
	    		var myData = JSON.stringify(dept);
		    	$.ajax({
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }deptManage/save",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	var tds = tr.children("td");
			        	tds.eq(1).html('<a id="name'+data+'" role="button" data-toggle="modal" href="#modal-table">'+dept.deptName+'</a>');
			        	tds.eq(2).html(tds.eq(2).children("a").text());
			        	tds.eq(3).html(select.find('option:selected').text());
			        	tds.last().attr("id",data);
			        	tds.last().html('<a id="edit" class="green" href="#"><i class="icon-pencil bigger-130"></i></a><a class="red" href="#"><i class="icon-trash bigger-130" style="padding-left: 3px;"></i></a>');
			        }  
			 	}); 
	    	}
	    });
	    /* 更新 */
	    $("#deptTable").delegate("#update","click",function(){
	    	var tr = $(this).parent().parent();
	    	var inputs = tr.find("input");
	    	var select = tr.find("select");
			if(inputs.eq(2).val()==""){
	    		alert("请选择上级部门");
	    	}else{
	    		var dept = {id:tr.children("td").last().attr("id"),deptName:inputs.eq(1).val(),upperDeptId:inputs.eq(2).val(),deptLevel:inputs.eq(3).val(),managerIds:select.val()==null?"":select.val().toString(),enable:tr.children("td").eq(-2).children("span").attr("class")=="label label-sm label-success"?true:false};
	    		var myData = JSON.stringify(dept);
		    	$.ajax({
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }deptManage/update",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	var tds = tr.children("td");
			        	tds.eq(1).html('<a id="name'+data+'" role="button" data-toggle="modal" href="#modal-table">'+dept.deptName+'</a>');
			        	tds.eq(2).html(tds.eq(2).children("a").text());
			        	tds.eq(3).html(select.find('option:selected').text());
			        	tds.last().attr("id",data);
			        	tds.last().html('<a id="edit" class="green" href="#"><i class="icon-pencil bigger-130"></i></a><a class="red" href="#"><i class="icon-trash bigger-130" style="padding-left: 3px;"></i></a>');
			        }  
			 	}); 
	    	}
	    });
	    
	    /* 删除 */
	    $("#deptTable").delegate(".red","click",function(){
	    	var a = $(this);
	    	var td = $(this).parent();
	    	var dept={id:td.attr("id"),enable:false};
	    	var myData = JSON.stringify(dept);
    		$.ajax({  
   		        type: "POST",  
   		        contentType:"application/json;charset=utf-8",  
   		        url:"${path }deptManage/del",  
   		        data:myData,  
   		        dataType: "json",  
   		        async: false,  
   		        success:function(data){
	        		td.prev().html("<span class='label label-sm label-warning'>无效</span>");
	        		a.html('<i class="icon-undo bigger-130"></i>');
	        		a.attr("class","green undo");
   		        }  
   		 	});  
	    });
	    /* 恢复 */
	    $("#deptTable").delegate(".undo","click",function(){
	    	var a = $(this);
	    	var td = $(this).parent();
	    	var dept={id:td.attr("id"),enable:true};
	    	var myData = JSON.stringify(dept);
    		$.ajax({  
   		        type: "POST",  
   		        contentType:"application/json;charset=utf-8",  
   		        url:"${path }deptManage/del",  
   		        data:myData,  
   		        dataType: "json",  
   		        async: false,  
   		        success:function(data){
	        		td.prev().html("<span class='label label-sm label-success'>有效</span>");
	        		a.html('<i class="icon-trash bigger-130"></i>');
	        		a.attr("class","red");
   		        }  
   		 	});  
	    });
	    /* 编辑 */
	    $("#deptTable").delegate("#edit","click",function(){
	    	var tds = $(this).parent().siblings();
	    	$(this).parent().prepend('<a id="update" class="grey" href="#"><i class="icon-save bigger-130"></i></a>');
	    	$(this).remove();
	    	tds.eq(1).html('<input type="text" value="'+tds.eq(1).children("a").text()+'" class="form-control" />');
	    	tds.eq(2).html('<a href="#" class="showTree">'+tds.eq(2).text()+'</a><input value="'+tds.eq(2).children("input").eq(0).val()+'" type="hidden"><input value="'+tds.eq(2).children("input").eq(1).val()+'" type="hidden">');
	    	tds.eq(3).html('<select style="display: none;" multiple="multiple" class="width-20 chosen-select" id="form-field-select-4" data-placeholder="可选多个..."><option value="">&nbsp;</option></select>');
	    	$.each(user,function(){
	    		tds.eq(3).children("select").append('<option value="'+this.id+'">'+this.realName+'&nbsp'+this.userName+'&nbsp;&nbsp;&nbsp;&nbsp;</option>');
	    	});
	    	tds.eq(3).children("select").chosen({no_results_text: "查无结果", search_contains: true});
	    	tds.eq(3).children("select").next().attr("style","width:100%;");
	    	tds.eq(3).children("select").next().find("input").attr("style","height:100%;");
	    	
	    });
	    /* 查看部门员工 */
	    $("#deptTable").delegate(".findUser","click",function(){
		    $("#headerName").html("<button type='button' class='close' data-dismiss='modal' aria-hidden='true'><span class='white'>×</span></button>"+$(this).text());
			var myData={id:$(this).parent().siblings().last().attr("id")};
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }deptManage/getUserByDept",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	$("#userTable").empty();
		        	$(data).each(function(i,user){
		        		$("#userTable").append("<tr><th>"+user.userName+"</th><th>"+user.realName+"</th><th>"+user.position+"</th><th>"+user.phone+"</th><th>"+user.qq+"</th><th>"+user.enable+"</th></tr>");
		        	});
		        }  
			});  
	    });
	});
	/* 批量保存 */
	/* function save(){
		var depts = [];
		for (var int = 1; int < addID; int++) {
			deptName = $("#add"+int).find("input[name='deptName']").val();
			upperDeptId = $("#add"+int).find("input[name='upperDeptID']").val();
			deptLevel= $("#add"+int).find("input[name='deptLevel']").val();
			var dept = {deptName:deptName,upperDeptId:upperDeptId,deptLevel:deptLevel,enable:true};
			depts[int-1] = dept;
		}
		var myData = JSON.stringify(depts);
			 $.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }deptManage/save",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){  
			        	location.reload();
			        }  
			 });  
	} */
</script>