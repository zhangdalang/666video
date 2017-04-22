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
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
	
						<ul class="breadcrumb">
							<li>
								<i class="icon-user"></i>
								<a id="" role="button" data-toggle="modal" href="#">结算管理</a>
							</li>
						</ul><!-- .breadcrumb -->
						<div class="accessBar" style="display: inline-block;">
							<div style="display: inline-block;">
								<shiro:hasPermission name="settlement:find">
									<a class="" id="settlement" data-toggle="modal" href="#" title="付款申请">
										<i class="icon-legal bigger-100"></i>
										团队结算
									</a>
								</shiro:hasPermission>
							</div>
						</div>
						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }settlementManage" method="get">
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
									<th aria-label="" colspan="1" rowspan="1" role="columnheader" class="center sorting_disabled">
										<label>
											<input class="ace selectAll" type="checkbox">
											<span class="lbl"></span>
										</label>
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										团号
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										线路
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										成本总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										应付总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										实付总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										报账总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										应收总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										实收总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										实际毛利
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										实际毛利率
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										团控人
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 8%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										状态
									</th>
								</tr>
							</thead>
	
							<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
	<!-- 列表循环 -->				
								<c:forEach var="settlement" items="${settlements }" varStatus="status">
									<tr id="${settlement.localTourTable.id }">
										<td class="center  sorting_1">
												<label>
													<input class="ace" type="checkbox">
													<span class="lbl"></span>
												</label>
										</td>
										<td><a id="editTour" role="button" data-toggle="modal" href="#edit">${settlement.localTourTable.tourNo }</a></td>
										<td>${settlement.localTourTable.tourName }</td>
										<td>${settlement.costSum }</td>
										<td>${settlement.willPaySum }</td>
										<td>${settlement.realPaySum }</td>
										<td>${settlement.reimbursementSum }</td>
										<td>${settlement.willIncomeSum }</td>
										<td>${settlement.realIncomeSum }</td>
										<td>${settlement.realGrossProfit }</td>
										<td>${settlement.realGrossMargin }</td>
										<td>${settlement.userRealName }</td>
										<td>${settlement.status }</td>
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
											<a href="${path }settlementManage?page=${pageNo-1 }&key=${key }"><i class="icon-double-angle-left"></i></a>
										</li>
										<c:forEach var="page" begin="1" end="${pageMax }">
											<li <c:if test="${pageNo==page }">class="active"</c:if>>
												<a href="${path }settlementManage?page=${page }&key=${key }">${page }</a>
											</li>
										</c:forEach>
										<li <c:choose><c:when test="${pageNo==pageMax }">class="next disabled"</c:when><c:otherwise>class="next"</c:otherwise></c:choose>>
											<a href="${path }settlementManage?page=${pageNo+1 }&key=${key }"><i class="icon-double-angle-right"></i></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
<!-- 分页查询结束 -->							
					</div>
				</div>
<!-- 正文结束 -->	

<!-- 编辑模板 -->
				<div aria-hidden="true" style="display: none;" id="check" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width: 80%;">
						<div class="modal-content">
					        <div class="modal-header no-padding">
								<div class="table-header">
									结算审核
						 		</div>
						  	</div>
							<div class="modal-body no-padding">
					         	<div class="tab-content no-border padding-6" style="z-index: 1400;">
						         	<table class="table table-striped table-bordered table-hover no-margin">
										<thead>
											<tr>
												<th style="width: 6%;">&nbsp;</th>
												<th style="width: 18.8%;">团队预算</th>
												<th style="width: 18.8%;">团队执行</th>
												<th style="width: 18.8%;">应收应付</th>
												<th style="width: 18.8%;">实收实付</th>
												<th style="width: 18.8%;">团队报账</th>
											</tr>
										</thead>
										<tbody id="checkTable">
											<tr id="cost">
												<td>成本</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr id="income">
												<td>收入</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr id="grossProfit">
												<td>毛利</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr id="grossMargin">
												<td>毛利率</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
					       		</div>
					       	</div>
							<div class="modal-footer no-margin-top">
								<shiro:hasPermission name="settlement:cancel">
									<button id="cancel" class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
										<i class="icon-remove"></i>
										驳回
									</button>
								</shiro:hasPermission>
								<shiro:hasPermission name="settlement:update">
									<button id="ok" class="btn btn-sm btn-success pull-right">
										<i class="icon-qrcode"></i>
										同意
									</button>
								</shiro:hasPermission>
						 	 </div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
<!-- 编辑结束 -->
	
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>

<!-- 下拉搜索依赖 -->
<script src="${path }resources/assets/js/chosen.jquery.min.js"></script>
<!-- 日历组件依赖 -->
<script src="${path }resources/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<!-- 二维码依赖 -->
<script src="${path }resources/assets/js/jquery.qrcode.min.js"></script>
<script type="text/javascript">
	$(function(){
	/* 初始化 */
		/* 样式 */
		$("#financeManage").addClass("open");
		$("#financeManage").children("ul").attr("style","display:block");
		$("#settlementManage").addClass("active");
		$(".modal-dialog").attr("style","width:80%;");
		/* 提示 */
		$("a").tooltip({
			show: null,
			position: {
				my: "left top",
				at: "left bottom"
			},
			open: function( event, ui ) {
				ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
			}
		});
		/* 点击本行选中复选框 */
		$("#table").find("td").not(".sorting_1").click(function(){
			var checkbox = $(this).siblings().eq(0).find("input");
			if(checkbox.prop("checked")){
				checkbox.prop("checked",false);
			}else{
				$("#table").find("input").prop("checked",false);
				checkbox.prop("checked",true);
				/* 设置按钮 */
				if($(this).siblings().last().text()=="已核销"){
					$("#settlement").show();
				}else{
					$("#settlement").hide();
				}
			}
		});
		/* 全选 */
		$(".selectAll").click(function(){
			if($(this).prop("checked")){
				$("#table").find("input").prop("checked",true);
			}else{
				$("#table").find("input").prop("checked",false);
			}
		});
	
	/*查看*/
		$("#settlement").click(function(){
			var checkbox = $("#table").find("input:checked");
			if(checkbox.length==0){
				alert("请选择一个团队");
				$(this).attr("href","#");
			}else if(checkbox.length>1){
				alert("只能选择一个团队");
				$(this).attr("href","#");
			}else{
				$(this).attr("href","#check");
				var tourId = checkbox.parent().parent().parent().attr("id");
				$("#ok").parent().attr("id",tourId);
				var myData = {tourId:tourId};
				$.ajax({
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }settlementManage/find",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	$("#cost").children("td").eq(1).html('<a title="'+data.budgetCostSumInfo.replace(/,/g,"<br>")+'">'+data.budgetCostSum+'</a>');
			        	$("#cost").children("td").eq(2).html('<a title="'+data.executeCostSumInfo.replace(/,/g,"<br>")+'">'+data.executeCostSum+'</a>');
			        	$("#cost").children("td").eq(3).html('<a title="'+data.willCostSumInfo.replace(/,/g,"<br>")+'">'+data.willCostSum+'</a>');
			        	$("#cost").children("td").eq(4).html('<a title="'+data.realCostSumInfo.replace(/,/g,"<br>")+'">'+data.realCostSum+'</a>');
			        	$("#cost").children("td").eq(5).html('<a title="'+data.reimbursementCostSumInfo.replace(/,/g,"<br>")+'">'+data.reimbursementCostSum+'</a>');
			        	$("#income").children("td").eq(1).html('<a title="'+data.budgetIncomeSumInfo.replace(/,/g,"<br>")+'">'+data.budgetIncomeSum+'</a>');
			        	$("#income").children("td").eq(2).html('<a title="'+data.executeIncomeSumInfo.replace(/,/g,"<br>")+'">'+data.executeIncomeSum+'</a>');
			        	$("#income").children("td").eq(3).html('<a title="'+data.willIncomeSumInfo.replace(/,/g,"<br>")+'">'+data.willIncomeSum+'</a>');
			        	$("#income").children("td").eq(4).html('<a title="'+data.realIncomeSumInfo.replace(/,/g,"<br>")+'">'+data.realIncomeSum+'</a>');
			        	$("#income").children("td").eq(5).html('<a title="'+data.reimbursementIncomeSumInfo.replace(/,/g,"<br>")+'">'+data.reimbursementIncomeSum+'</a>');
			        	$("#grossProfit").children("td").eq(1).html(data.budgetGrossProfit);
			        	$("#grossProfit").children("td").eq(2).html(data.executeGrossProfit);
			        	$("#grossProfit").children("td").eq(3).html(data.willGrossProfit);
			        	$("#grossProfit").children("td").eq(4).html(data.realGrossProfit);
			        	$("#grossProfit").children("td").eq(5).html(data.reimbursementGrossProfit);
			        	$("#grossMargin").children("td").eq(1).html(data.budgetGrossMargin+"%");
			        	$("#grossMargin").children("td").eq(2).html(data.executeGrossMargin+"%");
			        	$("#grossMargin").children("td").eq(3).html(data.willGrossMargin+"%");
			        	$("#grossMargin").children("td").eq(4).html(data.realGrossMargin+"%");
			        	$("#grossMargin").children("td").eq(5).html(data.reimbursementGrossMargin+"%");
			        }  
				});
			}
		});
		/* 鼠标提示事件 */
		var titleText
		$("#checkTable").delegate("a","mouseenter",function(){
			titleText = $(this).attr("title");
			$(this).attr("title","");
			var div = $('<div id="title" style="position: absolute;background-color: #444;color: white; padding: 10px;"></div>');
			div.html(titleText);
			$(this).parent().append(div);
			div.hide();
			div.slideDown("fast");
		});
		$("#checkTable").delegate("a","mouseout",function(){
			$(this).attr("title",titleText);
			$("#title").remove();
		});
		/* 二维码 */
		$("#ok").mouseenter(function(){
			var tourId = $(this).parent().attr("id");
			var http = (window.document.location.href.substring(0, window.document.location.href.indexOf(window.document.location.pathname)));
			var div = $('<div id="qrcode" style="display:none;position: absolute;background-color: #444;color: white;padding: 10px;left: 45%;top: 20%;z-index: 1500;"></div>');
			$("body").append(div);
			$('#qrcode').qrcode({width: 200,height: 200,text: http+"${path }settlementManage/update?tourId="+tourId});
			div.fadeIn();
		});
		$("#ok").mouseout(function(){
			$("#qrcode").remove();
			var tourId = $(this).parent().attr("id");
			var myData = {tourId:tourId};
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }settlementManage/checkStatus", 
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	if(data==1){
		        		$("#table").find("#"+tourId).remove();
		        	}
		        }  
			});
		});
		$("#cancel").click(function(){
			var tourId = $(this).parent().attr("id");
			$("#table").find("#"+tourId).remove();
			var myData = {tourId:tourId};
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }settlementManage/cancel",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	
		        }  
			});
		});
	});
	
</script>
