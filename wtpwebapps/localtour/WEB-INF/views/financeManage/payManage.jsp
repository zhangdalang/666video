<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="com.cts.localtour.entity.UserTable" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% 
	String path = request.getContextPath()+"/";
	UserTable user = ((UserTable)SecurityUtils.getSubject().getPrincipal());
%>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>
<style type="text/css">
	#ui-datepicker-div a{
		text-align: center;
	}
	#ui-datepicker-div span{
		text-align: center;
	}
	.accessBar{
		display: inline-block;
	}
	.accessBar a{
		padding-left: 10px;
	}
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
								<a role="button" data-toggle="modal" href="#">付款管理</a>
							</li>
						</ul><!-- .breadcrumb -->
						<div class="accessBar">
							<shiro:hasPermission name="pay:unFinance">
								<a id="cancelFinance" data-toggle="modal" href="#" title="付款申请">
									<i class="icon-reply bigger-100"></i>
									取消报送
								</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="pay:find">
								<a id="pay" data-toggle="modal" href="#" title="付款申请">
									<i class="icon-file-alt bigger-100"></i>
									付款管理
								</a>
							</shiro:hasPermission>
						</div>
						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }payManage" method="get">
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
									<th aria-label="Price: activate to sort column ascending" style="width: 15%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										团号
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 15%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										线路
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										导游可申请
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										供应商可申请
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										可申请总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										应付总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										实付总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										状态
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										团控人
									</th>
								</tr>
							</thead>
	
							<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
	<!-- 列表循环 -->				
								<c:forEach var="pay" items="${pays }" varStatus="status">
									<tr id="${pay.localTourTable.id }">
										<td class="center  sorting_1">
												<label>
													<input class="ace" type="checkbox">
													<span class="lbl"></span>
												</label>
										</td>
										<td><a id="editTour" role="button" data-toggle="modal" href="#edit">${pay.localTourTable.tourNo }</a></td>
										<td>${pay.localTourTable.tourName }</td>
										<td>${pay.loan }</td>
										<td>${pay.canCost }</td>
										<td>${pay.canPay }</td>
										<td>${pay.willPay }</td>
										<td>${pay.realPay }</td>
										<td>${pay.status }</td>
										<td>${pay.realName }</td>
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
											<a href="${path }payManage?page=${pageNo-1 }&key=${key }"><i class="icon-double-angle-left"></i></a>
										</li>
										<c:forEach var="page" begin="1" end="${pageMax }">
											<li <c:if test="${pageNo==page }">class="active"</c:if>>
												<a href="${path }payManage?page=${page }&key=${key }">${page }</a>
											</li>
										</c:forEach>
										<li <c:choose><c:when test="${pageNo==pageMax }">class="next disabled"</c:when><c:otherwise>class="next"</c:otherwise></c:choose>>
											<a href="${path }payManage?page=${pageNo+1 }&key=${key }"><i class="icon-double-angle-right"></i></a>
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
				<div aria-hidden="true" style="display: none;" id="edit" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width: 80%;">
						<div class="modal-content">
					        <div class="modal-header no-padding">
								<div class="table-header">
									团队信息
						 		</div>
						  	</div>
							<div class="modal-body no-padding">
					         	<div class="tabbable">
					         		<ul class="nav nav-tabs padding-18" id="myTab">
										<li class="active">
											<a data-toggle="tab" href="#costs3">
												<i class="green icon-credit-card bigger-120"></i>
												成本
											</a>
										</li>
									</ul>
					         	</div>
					         	<div class="tab-content no-border padding-6" style="z-index: 1400;">
					         		<div id="costs3" class="tab-pane fade in active costTable">
					         			<div class="tabbable tabs-left">
						         			<ul class="nav nav-tabs" style="width: 10%;text-align: center;">
												<li class="active">
													<a data-toggle="tab" href="#flight3">
														<i class="red icon-large icon-plane"></i>
														机票
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#hotel3">
														<i class="pink icon-large icon-building"></i>
														订房
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#meal3">
														<i class="orange icon-large icon-food"></i>
														订餐
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#ticket3">
														<i class="green icon-large icon-hdd"></i>
														门票
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#shuttle3">
														<i class="dark icon-large icon-truck"></i>
														订车
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#tickets3">
														<i class="blue icon-large icon-list-alt"></i>
														票务
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#comprehensive3">
														<i class="purple icon-large icon-money"></i>
														综费
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#other3">
														<i class="black icon-large icon-leaf"></i>
														其他
													</a>
												</li>
											</ul>
											<div class="tab-content no-padding" style="z-index: 1400;display: inline-block;float: right;right: -4px;width: 90%;overflow: visible;">
												<div id="flight3" class="tab-pane in active">
													<table class="table table-striped table-bordered table-hover no-margin">
														<thead>
															<tr>
																<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
										            </table>
												</div>
												
												<div id="hotel3" class="tab-pane">
													<table class="table table-striped table-bordered table-hover no-margin">
														<thead>
															<tr>
																<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
										            </table>
												</div>
												
												<div id="meal3" class="tab-pane">
													<table class="table table-striped table-bordered table-hover no-margin">
														<thead>
															<tr>
																<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
										            </table>
												</div>
												
												<div id="ticket3" class="tab-pane">
													<table class="table table-striped table-bordered table-hover no-margin">
														<thead>
															<tr>
																<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
										            </table>
												</div>
												
												<div id="shuttle3" class="tab-pane">
													<table class="table table-striped table-bordered table-hover no-margin">
														<thead>
															<tr>
																<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
										            </table>
												</div>
												
												<div id="tickets3" class="tab-pane">
													<table class="table table-striped table-bordered table-hover no-margin">
														<thead>
															<tr>
																<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
										            </table>
												</div>
												<div id="comprehensive3" class="tab-pane">
												<table class="table table-striped table-bordered table-hover no-margin">
													<thead>
														<tr>
															<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
									            </table>
											</div>
											
											<div id="other3" class="tab-pane">
												<table class="table table-striped table-bordered table-hover no-margin">
													<thead>
														<tr>
															<th style="width: 10%;">日期</th>
																<th style="width: 15%;">内容</th>
																<th style="width: 15%;">供应商*</th>
																<th style="width: 10%;">成本小计</th>
																<th style="width: 10%;">电汇金额</th>
																<th style="width: 8%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 8%;">导游借款</th>
																<th style="width: 8%;">挂账</th>
																<th style="width: 8%;">状态</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
									            </table>
											</div>
											<span id="changeCostBlue" class="blue">*蓝色为成本收入变更</span>
											<span id="reimbursementCostRed" class="red">*红色为报账新增成本</span>
						         			</div><!-- tab content 结束 -->
					         			</div><!-- 左tab 结束 -->
					         		</div><!-- 成本tab结束 -->
					         	</div>
					         </div>
					         <div class="modal-header no-padding">
								<div class="table-header">
									导游借款
						 		</div>
						  	</div>
						  	<div class="modal-body no-padding">
					         	<table class="table table-striped table-bordered table-hover no-margin">
									<thead>
										<tr>
											<th style="width: 10%;">日期</th>
											<th style="width: 15%;">借款额</th>
											<th style="width: 40%;">明细备注</th>
											<th style="width: 10%;">财务操作人</th>
											<th style="width: 10%;">状态</th>
											<th style="width: 2%;">
												<a class="blue addLoan" href="#">
													<i class="icon-plus bigger-130"></i>
												</a>
											</th>
										</tr>
									</thead>
									<tbody id="loanTable">
									</tbody>
					            </table>
					            <table class="table table-striped table-bordered table-hover no-margin" style="width: 64.8%;">
									<tbody>
										<tr>
											<td style="width: 20%;">借款总计</td>
											<td id="total" style="width: 30%;"></td>
											<td style="width: 20%;">最大借款额</td>
											<td id="maxLoan" style="width: 30%;"></td>
										</tr>
									</tbody>
					            </table>
					        </div>
							<div class="modal-footer no-margin-top">
								<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
									<i class="icon-remove"></i>
									取消
								</button>
								<shiro:hasPermission name="pay:update">
									<button id="saveEdit" class="btn btn-sm btn-success pull-right" data-dismiss="modal">
										<i class="icon-save"></i>
										保存
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

<script type="text/javascript">
	$(function(){
	/* 初始化 */
		/* 样式 */
		$("#financeManage").addClass("open");
		$("#financeManage").children("ul").attr("style","display:block");
		$("#payManage").addClass("active");
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
				if($(this).siblings().eq(7).text()=="已报送"){
					$("#cancelFinance").show();
				}else{
					$("#cancelFinance").hide();
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
	/* 成本 */
		/* 成本小计 */
		$(".costTable").delegate(".costPlus","blur",function(){
			var product = 1;
			var costPlus = $(this).parents("tr").find(".costPlus");
			costPlus.each(function(){
				if(isNaN(parseInt($(this).val()))){
					product = product * 0;
				}else{
					product = product * parseInt($(this).val());
				}
			})
			costPlus.last().parent().next().text(product);
		});
	
	/* 改状态 */
		$("#cancelFinance").click(function(){
			var checkbox = $("#table").find("input:checked");
			if(checkbox.length==0){
				alert("请选择一个团队");
				$(this).attr("href","#");
			}else if(checkbox.length>1){
				alert("只能选择一个团队");
				$(this).attr("href","#");
			}else{
				var id = checkbox.parent().parent().parent().attr("id");
				var myData = {id:id};
				$.ajax({
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }localTourManage/cancelFinance/",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	if(data==-1){
			        		alert("只有已报送状态的团队可以取消报送");
			        	}else{
			        		checkbox.parent().parent().parent().remove();
			        	}
			        }  
				});
			}
		});
	
	/* 编辑 */
		$("#pay").click(function(){
				var checkbox = $("#table").find("input:checked");
				if(checkbox.length==0){
					alert("请选择一个团队");
					$(this).attr("href","#");
				}else if(checkbox.length>1){
					alert("只能选择一个团队");
					$(this).attr("href","#");
				}else{
					$(this).attr("href","#edit");
					var tourId = checkbox.parent().parent().parent().attr("id");
					var myData = {tourId:tourId};
					edit(myData);
				}
		});
		/* 编辑读取 */
 		$("#table").delegate("#editTour","click",function(){
 			if($(this).parent().prev().find("input").prop("checked")){
 				$(this).parent().prev().find("input").prop("checked",false);
 			}else{
 				$(this).parent().prev().find("input").prop("checked",true);
 			}
			var myData = {tourId:$(this).parent().parent().attr("id")};
			edit(myData);
		});
		function edit(myData){
			$("#saveEdit").parent().attr("id",myData.tourId);
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }payManage/find",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
					/* 设置成本 */
		        	var flight = $("#flight3").find("tbody");
		        	var hotel = $("#hotel3").find("tbody");
		        	var meal = $("#meal3").find("tbody");
		        	var ticket = $("#ticket3").find("tbody");
		        	var shuttle = $("#shuttle3").find("tbody");
		        	var tickets = $("#tickets3").find("tbody");
		        	var comprehensive = $("#comprehensive3").find("tbody");
		        	var other = $("#other3").find("tbody");
		        	var total = 0;
		        	var maxLoan = 0;
		        	flight.html("");
		        	hotel.html("");
		        	meal.html("");
		        	ticket.html("");
		        	shuttle.html("");
		        	tickets.html("");
		        	comprehensive.html("");
		        	other.html("");
		        	/* 设置成本 */
		        	$.each(data.costs,function(){
		        		var realCost = $("<td></td>");
		        		var payStatus = $("<td></td>");
		        		var remark = $("<td></td>");
		        		var guideLoan = $("<td></td>");
		        		var bill = $("<td></td>");
		        		var remittanced = $("<td></td>");
		        		if(this.costTable.payStatus==0){
		        			if(this.costTable.lend){
		        				guideLoan.html('<i class="icon-ok bigger-130"></i>');
		        				maxLoan = (parseFloat(maxLoan) + this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2);
		        			}else{
		        				if(this.costTable.bill){
			        				bill.html('<label><input class="ace" type="checkbox" checked="checked"><span class="lbl"></span></label>');
			        			}else{
			        				bill.html('<label><input class="ace" type="checkbox"><span class="lbl"></span></label>');
			        			}
			        			realCost.html("<input id='remittance' class='form-control' type='text' value='"+this.costTable.realCost+"' />");
			        			guideLoan.html('<label><input class="ace lend" type="checkbox"><span class="lbl"></span></label>');
			        			remark.html('<input class="form-control" value="'+this.costTable.remark+'" type="text">');
		        			}
		        			payStatus.html(this.payStatus);
		        		}else{
		        			if(this.costTable.bill){
		        				bill.html('<i class="icon-ok bigger-130"></i>');
		        			}
		        			if(this.costTable.lend){
		        				guideLoan.html('<i class="icon-ok bigger-130"></i>');
		        			}
		        			if(this.costTable.remittanced){
			        			realCost.html(this.costTable.realCost);
		        			}
		        			if(this.costTable.payStatus==3&&!this.costTable.bill&&!this.costTable.remittanced&&!this.costTable.lend){
		        				payStatus.html('<a title="汇款确认" href="#" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a>');
		        			}else{
		        				payStatus.html(this.payStatus);
		        			}
		        			remark.html(this.costTable.remark);
		        			realCost.html(this.costTable.realCost);
		        		}
		        		if(this.costTable.remittanced){
		        			remittanced.html('<input type="hidden" value="true">');
		        		}else{
		        			remittanced.html('<input type="hidden" value="false">');
		        		}
		        		var tbody;
		        		if(this.costTable.supplierScopeId==1){
		        			tbody = flight;
		        		}else if(this.costTable.supplierScopeId==2){
		        			tbody = hotel;
		        		}else if(this.costTable.supplierScopeId==3){
		        			tbody = meal;
		        		}else if(this.costTable.supplierScopeId==4){
		        			tbody = ticket;
		        		}else if(this.costTable.supplierScopeId==5){
		        			tbody = shuttle;
		        		}else if(this.costTable.supplierScopeId==6){
		        			tbody = tickets;
		        		}else if(this.costTable.supplierScopeId==7){
		        			tbody = comprehensive;
		        		}else if(this.costTable.supplierScopeId==8){
		        			tbody = other;
		        		}
						var costDate = "";
						if(this.costTable.costDate!=null){
							costDate = this.costTable.costDate.replace(/-/g,'/');
						}
		        		var tr = $('<tr>'+
										'<td>'+costDate+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.supplierName+'</td>'+
										'<td><a data-toggle="modal" href="#" title="单价'+this.costTable.cost+' X 数量'+this.costTable.count+' X 天数'+this.costTable.days+'">'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</a></td>'+
										'<td>'+realCost.html()+'</td>'+
										'<td>'+this.borrowUserName+'</td>'+
										'<td>'+remark.html()+'</td>'+
										'<td>'+guideLoan.html()+'</td>'+
										'<td>'+bill.html()+'</td>'+
										'<td id="'+this.costTable.id+'"style="vertical-align: middle;">'+payStatus.html()+remittanced.html()+'</td>'+
									'</tr>');
		        		tbody.append(tr);
		        	});
		        	/* 设置成本变更 */
		        	if(data.changeCosts.length > 0){
		        		$("#changeCostBlue").attr("style","");
		        	}else{
		        		$("#changeCostBlue").attr("style","display:none");
		        	}
		        	$.each(data.changeCosts,function(){
		        		var realCost = $("<td></td>");
		        		var payStatus = $("<td></td>");
		        		var remark = $("<td></td>");
		        		var guideLoan = $("<td></td>");
		        		var bill = $("<td></td>");
		        		var remittanced = $("<td></td>");
		        		if(this.costTable.payStatus==0){
		        			if(this.costTable.lend){
		        				guideLoan.html('<i class="icon-ok bigger-130"></i>');
		        				maxLoan = (parseFloat(maxLoan) + this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2);
		        			}else{
		        				if(this.costTable.bill){
			        				bill.html('<label><input class="ace" type="checkbox" checked="checked"><span class="lbl"></span></label>');
			        			}else{
			        				bill.html('<label><input class="ace" type="checkbox"><span class="lbl"></span></label>');
			        			}
			        			realCost.html("<input id='remittance' class='form-control' type='text' value='"+this.costTable.realCost+"' />");
			        			guideLoan.html('<label><input class="ace lend" type="checkbox"><span class="lbl"></span></label>');
			        			remark.html('<input class="form-control" value="'+this.costTable.remark+'" type="text">');
		        			}
		        			payStatus.html(this.payStatus);
		        		}else{
		        			if(this.costTable.bill){
		        				bill.html('<i class="icon-ok bigger-130"></i>');
		        			}
		        			if(this.costTable.lend){
		        				guideLoan.html('<i class="icon-ok bigger-130"></i>');
		        			}
		        			if(this.costTable.remittanced){
			        			realCost.html(this.costTable.realCost);
		        			}
		        			if(this.costTable.payStatus==3&&!this.costTable.bill&&!this.costTable.remittanced&&!this.costTable.lend){
		        				payStatus.html('<a title="汇款确认" href="#" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a>');
		        			}else{
		        				payStatus.html(this.payStatus);
		        			}
		        			remark.html(this.costTable.remark);
		        			realCost.html(this.costTable.realCost);
		        		}
		        		if(this.costTable.remittanced){
		        			remittanced.html('<input type="hidden" value="true">');
		        		}else{
		        			remittanced.html('<input type="hidden" value="false">');
		        		}
		        		var tbody;
		        		if(this.costTable.supplierScopeId==1){
		        			tbody = flight;
		        		}else if(this.costTable.supplierScopeId==2){
		        			tbody = hotel;
		        		}else if(this.costTable.supplierScopeId==3){
		        			tbody = meal;
		        		}else if(this.costTable.supplierScopeId==4){
		        			tbody = ticket;
		        		}else if(this.costTable.supplierScopeId==5){
		        			tbody = shuttle;
		        		}else if(this.costTable.supplierScopeId==6){
		        			tbody = tickets;
		        		}else if(this.costTable.supplierScopeId==7){
		        			tbody = comprehensive;
		        		}else if(this.costTable.supplierScopeId==8){
		        			tbody = other;
		        		}
		        		var costDate = "";
						if(this.costTable.costDate!=null){
							costDate = this.costTable.costDate.replace(/-/g,'/');
						}
		        		var tr = $('<tr class="blue">'+
										'<td>'+costDate+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.supplierName+'</td>'+
										'<td><a data-toggle="modal" href="#" title="单价'+this.costTable.cost+' X 数量'+this.costTable.count+' X 天数'+this.costTable.days+'">'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</a></td>'+
										'<td>'+realCost.html()+'</td>'+
										'<td>'+this.borrowUserName+'</td>'+
										'<td>'+remark.html()+'</td>'+
										'<td>'+guideLoan.html()+'</td>'+
										'<td>'+bill.html()+'</td>'+
										'<td id="'+this.costTable.id+'"style="vertical-align: middle;">'+payStatus.html()+remittanced.html()+'</td>'+
									'</tr>');
		        		tbody.append(tr);
		        	});
		        	
		        	/* 设置报账成本 */
		        	if(data.reimbursementCosts.length > 0){
		        		$("#reimbursementCostRed").attr("style","");
		        	}else{
		        		$("#reimbursementCostRed").attr("style","display:none");
		        	}
		        	$.each(data.reimbursementCosts,function(){
		        		var payStatus = $("<td></td>");
		        		var remark = $("<td></td>");
		        		var bill = $("<td></td>");
		        		var remittanced = $("<td></td>");
	        			remark.html(this.costTable.remark);
		        		if(this.costTable.remittanced){
		        			remittanced.html('<input type="hidden" value="true">');
		        			payStatus.html("已汇款");
		        		}else{
		        			remittanced.html('<input type="hidden" value="false">');
		        			if(this.costTable.bill){
		        				payStatus.html('<a title="汇款确认" href="#" hidden="" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a><span>挂账</span>');
		        				bill.html('<label><input class="ace bill" type="checkbox" checked="checked"><span class="lbl"></span></label>');
		        			}else{
		        				payStatus.html('<a title="汇款确认" href="#" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a><span hidden="">挂账</span>');
		        				bill.html('<label><input class="ace bill" type="checkbox"><span class="lbl"></span></label>');
		        			}
		        		}
		        		var tbody;
		        		if(this.costTable.supplierScopeId==1){
		        			tbody = flight;
		        		}else if(this.costTable.supplierScopeId==2){
		        			tbody = hotel;
		        		}else if(this.costTable.supplierScopeId==3){
		        			tbody = meal;
		        		}else if(this.costTable.supplierScopeId==4){
		        			tbody = ticket;
		        		}else if(this.costTable.supplierScopeId==5){
		        			tbody = shuttle;
		        		}else if(this.costTable.supplierScopeId==6){
		        			tbody = tickets;
		        		}else if(this.costTable.supplierScopeId==7){
		        			tbody = comprehensive;
		        		}else if(this.costTable.supplierScopeId==8){
		        			tbody = other;
		        		}
		        		var tr = $('<tr class="red">'+
										'<td>'+(this.costTable.costDate==null?"":this.costTable.costDate.replace(/-/g,'/'))+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.supplierName+'</td>'+
										'<td><a data-toggle="modal" href="#" title="单价'+this.costTable.cost+' X 数量'+this.costTable.count+' X 天数'+this.costTable.days+'">'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</a></td>'+
										'<td>'+this.costTable.reimbursement+'</td>'+
										'<td></td>'+
										'<td></td>'+
										'<td></td>'+
										'<td>'+bill.html()+'</td>'+
										'<td id="'+this.costTable.id+'"style="vertical-align: middle;">'+payStatus.html()+remittanced.html()+'</td>'+
									'</tr>');
		        		tbody.append(tr);
		        	});
		        	
		        	/* 设置借款 */
		        	$("#loanTable").html("");
		        	$.each(data.loans,function(){
		        		var tr;
		        		var ok = $('<td></td>');
		        		if(this.loanTable.status==4){
		        			ok.html('<a title="借款确认" href="#" class="green" id="loanOk"><i class="icon-ok bigger-130"></i></a>');
		        		}
		        		if(this.loanTable.lended){
		        			tr = $('<tr>'+
		        						'<td>'+this.loanTable.loanDate+'</td>'+
		        						'<td class="loanAmountTd">'+this.loanTable.loanAmount+'</td>'+
		        						'<td>'+this.loanTable.remark+'</td>'+
		        						'<td>'+this.lenderRealName+'<input value="'+this.loanTable.lenderId+'" type="hidden"></td>'+
		        						'<td>'+this.status+'<input type="hidden" value="'+this.loanTable.status+'"></td>'+
		        						'<td id="'+this.loanTable.id+'"><input type="hidden" value="true"/></td>'+
		        					'</tr>');
		        			total = total + this.loanTable.loanAmount;
		        		}else{
		        			if(this.loanTable.status>1){
		        				tr = $('<tr>'+
		        						'<td>'+this.loanTable.loanDate+'</td>'+
		        						'<td class="loanAmountTd">'+this.loanTable.loanAmount+'</td>'+
		        						'<td>'+this.loanTable.remark+'</td>'+
		        						'<td>'+this.lenderRealName+'<input value="'+this.loanTable.lenderId+'" type="hidden"></td>'+
		        						'<td>'+this.status+'<input type="hidden" value="'+this.loanTable.status+'"></td>'+
		        						'<td id="'+this.loanTable.id+'">'+ok.html()+'<input type="hidden" value="false"/></td>'+
		        					'</tr>');
		        			}else{
		        				tr = $('<tr>'+
		        						'<td><input class="form-control datepicker" value="'+this.loanTable.loanDate+'" type="text"></td>'+
		        						'<td><input class="form-control loanAmountInput" value="'+this.loanTable.loanAmount+'" type="text"></td>'+
		        						'<td><input class="form-control" value="'+this.loanTable.remark+'" type="text"></td>'+
		        						'<td>'+this.lenderRealName+'<input value="'+this.loanTable.lenderId+'" type="hidden"></td>'+
		        						'<td>'+this.status+'<input type="hidden" value="'+this.loanTable.status+'"></td>'+
		        						'<td id="'+this.loanTable.id+'"><input type="hidden" value="false"/></td>'+
		        					'</tr>');
		        			}
		        			total = total + this.loanTable.loanAmount;
		        		}
		        		$("#loanTable").append(tr);
		        	});
		        	/* 设置借款总计、最大借款额 */
		        	$("#total").text(total);
		        	$("#maxLoan").text(maxLoan)
		        	/* 提示 */
		        	$("#edit").find("a").tooltip({
	        			show: null,
	        			position: {
	        				my: "left top",
	        				at: "left bottom"
	        			},
	        			open: function( event, ui ) {
	        				ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
	        			}
	        		});
		        	
		        	$("#edit").find(".datepicker").datepicker({
		    			showOtherMonths: true,
		    			selectOtherMonths: false,
		    		});
		        	$("#edit").find("select").chosen({no_results_text: "查无结果", search_contains: true});
		        	$(".chosen-select").next().attr("style","width:100%;");
					$(".chosen-select").next().find("input").attr("style","height:100%;");
					$(".traffic").next().attr("style","width:100%;");
					$(".traffic").next().find("input").attr("style","height:100%;");
		        }  
			});
		}
 		/* 点击电汇金额判断0 判断是否大于成本 */
    	$("#costs3").delegate("#remittance","blur",function(){
    		if($(this).val()>parseFloat($(this).parent().prev().text())){
    			$(this).val("");
    			alert("电汇金额不能大于成本金额");
    		}
    		if($(this).val()!=0){
    			$(this).parent().siblings().eq(6).html("");
    		}else{
    			$(this).parent().siblings().eq(6).html('<label><input class="ace lend" type="checkbox"><span class="lbl"></span></label>');
    			
    		}
    	});
 		/* 双击自动填充 */
    	$("#costs3").delegate("#remittance","dblclick",function(){
    		$(this).val($(this).parent().prev().text());
    	});
    	/* 勾选导游借款 */
    	$("#costs3").delegate(".lend","click",function(){
    		if($(this).prop("checked")){
    			$(this).parent().parent().siblings().eq(4).html("");
    			$(this).parent().parent().siblings().eq(6).html($(this).parent().parent().siblings().eq(6).children("input").val());
    			$("#maxLoan").html((parseFloat($("#maxLoan").html())+parseFloat($(this).parent().parent().siblings().eq(3).text())).toFixed(2));
    			$(this).parent().parent().siblings().eq(7).html("");
    			$(this).parent().parent().siblings().eq(8).html("借款");
    			$(this).parent().parent().html('<i class="icon-ok bigger-130"></i>');
    		}
    	});
    	/* 报账新增勾选挂账 */
    	$("#costs3").delegate(".bill","click",function(){
    		if($(this).prop("checked")){
    			$(this).parent().parent().next().children("a").hide();
    			$(this).parent().parent().next().children("span").show();
    		}else{
    			$(this).parent().parent().next().children("a").show();
    			$(this).parent().parent().next().children("span").hide();
    		}
    	});
    	/* 确认汇款 */
    	$("#costs3").delegate("#remittanceOk","click",function(){
    		var a = $(this);
    		var td = a.parent();
    		var value = parseFloat(td.siblings().eq(4).text());
    		a.next().val(true);
    		a.after("已汇");
    		a.remove();
    		td.prev().html("");
    	});
    	/* 增加借款 */
    	$(".addLoan").click(function(){
    		var date = (new Date()).toLocaleDateString();
    		var tr = $('<tr>'+
							'<td><input style="width:100%;" class="form-control datepicker" type="text" value="'+date+'"></td>'+
							'<td><input style="width:100%;" class="form-control loanAmountInput" type="text"></td>'+
							'<td><input style="width:100%;" class="form-control" type="text"></td>'+
							'<td><%=user.getRealName() %><input type="hidden" value="<%=user.getId() %>"></td>'+
							'<td>可借<input type="hidden" value="1"/></td>'+
							'<td><input type="hidden" value="false"/></td>'+
						'</tr>');
    		tr.find(".datepicker").datepicker({
    			showOtherMonths: true,
    			selectOtherMonths: false,
    		});
    		$("#loanTable").append(tr);
    	});
    	/* 借款总计计算 */
		$("#loanTable").delegate(".loanAmountInput","keyup",function(){
			var total = 0;
			var inputs = $("#loanTable").find(".loanAmountInput");
			var trs = $("#loanTable").children("tr");
			$.each(trs,function(){
				if($(this).children("td").eq(1).children("input").length==0){
					total = (parseFloat(total)+(isNaN(parseFloat($(this).children("td").eq(1).text()))?0:parseFloat($(this).children("td").eq(1).text()))).toFixed(2);
				}else{
					total = (parseFloat(total)+(isNaN(parseFloat($(this).children("td").eq(1).children("input").val()))?0:parseFloat($(this).children("td").eq(1).children("input").val()))).toFixed(2);
				}
			});
			if(total>parseFloat($("#maxLoan").text())){
				alert("借款总计不能大于最大借款额");
				inputs.val(0);
				$("#total").html(0);
			}else{
				$("#total").html(total);
			}
		});
    	/* 借款确认 */
    	$("#loanTable").delegate("#loanOk","click",function(){
    		var total = 0;
			var inputs = $("#loanTable").find(".loanAmountInput");
			var tds = $("#loanTable").find(".loanAmountTd");
			$.each(inputs,function(){
				total = (parseFloat(total)+(isNaN(parseFloat($(this).val()))?0:parseFloat($(this).val()))).toFixed(2);
			});
			$.each(tds,function(){
				total = (parseFloat(total)+(isNaN(parseFloat($(this).text()))?0:parseFloat($(this).text()))).toFixed(2);
			});
			if(total>parseFloat($("#maxLoan").text())){
				alert("借款总计不能大于最大借款额");
				inputs.val(0);
			}else{
				$(this).parent().prev().html('已借出<input value="4" type="hidden">');
				$(this).parent().html('<input type="hidden" value="true"/>');
			}
    	});
	/*更新 */
		$("#saveEdit").click(function(){
			var tourId = $(this).parent().attr("id");
			var costTables = new Array();
			var costTrs = $("#edit").find("#costs3").find("tbody").find("tr").not(".blue").not(".red");
			for (var int = 0; int < costTrs.length; int++) {
				var tds = costTrs.eq(int).children("td");
				var id = tds.last().attr("id");
				var remittanced = tds.last().children("input").val();
				var bill = false;
				var lend = false;
				var remark;
				var realCost;
				if(tds.eq(8).find("input").length==0){
					if(tds.eq(8).find("i").length==1){
						bill = true;
					}
				}else{
					if(tds.eq(8).find("input").prop("checked")){
						bill = true;
					}
				}
				if(tds.eq(7).find("input").length==0){
					if(tds.eq(7).find("i").length==1){
						lend = true;
					}
				}else{
					if(tds.eq(7).find("input").prop("checked")){
						lend = true;
					}
				}
				if(tds.eq(4).find("input").length==0){
					realCost = tds.eq(4).text()==""?0:tds.eq(4).text();
				}else{
					realCost = tds.eq(4).find("input").val();
				}
				if(tds.eq(6).find("input").length==0){
					remark = tds.eq(6).text();
				}else{
					remark = tds.eq(6).find("input").val();
				}
				costTables.push({
					id:id,
					realCost:realCost,
					remark:remark,
					remittanced:remittanced,
					bill:bill,
					lend:lend});
			}
			var changeCostTables = new Array();
			var changeCostTrs = $("#edit").find("#costs3").find("tbody").find("tr.blue");
			for (var int = 0; int < changeCostTrs.length; int++) {
				var tds = changeCostTrs.eq(int).children("td");
				var id = tds.last().attr("id");
				var remittanced = tds.last().children("input").val();
				var bill = false;
				var lend = false;
				var remark;
				var realCost;
				if(tds.eq(8).find("input").length==0){
					if(tds.eq(8).find("i").length==1){
						bill = true;
					}
				}else{
					if(tds.eq(8).find("input").prop("checked")){
						bill = true;
					}
				}
				if(tds.eq(7).find("input").length==0){
					if(tds.eq(7).find("i").length==1){
						lend = true;
					}
				}else{
					if(tds.eq(7).find("input").prop("checked")){
						lend = true;
					}
				}
				if(tds.eq(4).find("input").length==0){
					realCost = tds.eq(4).text()==""?0:tds.eq(4).text();
				}else{
					realCost = tds.eq(4).find("input").val();
				}
				if(tds.eq(6).find("input").length==0){
					remark = tds.eq(6).text();
				}else{
					remark = tds.eq(6).find("input").val();
				}
				changeCostTables.push({
					id:id,
					realCost:realCost,
					remark:remark,
					remittanced:remittanced,
					bill:bill,
					lend:lend});
			}
			
			var reimbursementCostTables = new Array();
			var reimbursementCostTrs = $("#edit").find("#costs3").find("tbody").find("tr.red");
			for (var int = 0; int < reimbursementCostTrs.length; int++) {
				var tds = reimbursementCostTrs.eq(int).children("td");
				var id = tds.last().attr("id");
				var remittanced = tds.last().children("input").val();
				var bill = false;
				var realCost;
				if(tds.eq(8).find("input").length==0){
					if(tds.eq(8).find("i").length==1){
						bill = true;
					}
				}else{
					if(tds.eq(8).find("input").prop("checked")){
						bill = true;
					}
				}
				reimbursementCostTables.push({
					id:id,
					remittanced:remittanced,
					bill:bill});
			}
			
			var loanTables = new Array();
			var loanTrs = $("#loanTable").children("tr");
			$.each(loanTrs,function(){
				var inputs = $(this).find("input");
				var tds = $(this).children("td");
				if(inputs.length>3){
					if(inputs.eq(1).val()!=""){
						loanTables.push({
							id:tds.last().attr("id"),
							tourId:tourId,
							loanDate:new Date(inputs.eq(0).val()),
							loanAmount:inputs.eq(1).val(),
							remark:inputs.eq(2).val(),
							lenderId:inputs.eq(3).val(),
							status:inputs.eq(4).val(),
							lended:inputs.last().val()});
					}
				}else{
					loanTables.push({
						id:tds.last().attr("id"),
						tourId:tourId,
						loanDate:new Date(tds.eq(0).text()),
						loanAmount:tds.eq(1).text(),
						remark:tds.eq(2).text(),
						lenderId:inputs.eq(0).val(),
						status:inputs.eq(1).val(),
						lended:inputs.last().val()});
				}
			});
			
			var fullPayViewModel = {tourId:tourId,costTables:costTables, changeCostTables:changeCostTables, reimbursementCostTables:reimbursementCostTables, loanTables:loanTables};
			var myData = JSON.stringify(fullPayViewModel);
			$.ajax({
		        type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }payManage/update",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	$("#saveEdit").attr("data-dismiss","")
		        	if(data==-1){
		        		alert("保存失败，提交数据异常，借款和汇款同时为true");
		        	}else if(data==-2){
		        		alert("保存失败，电汇金额不能大于成本小计");
		        	}else if(data==-3){
		        		alert("保存失败，借款总计大于最大借款额");
		        	}else if(data==1){
		        		$("#saveEdit").attr("data-dismiss","modal")
		        	}
		        }
			 });
			/* 设置列表数字 */
			var total = parseFloat($("#total").text());
			$("#table").find("#"+tourId).children("td").eq(3).text(total);
			var remittanceSum = 0;
			var realCostSum = 0;
			$.each($("#costs3").find("tbody").children("tr"),function(){
				var td = $(this).children("td").eq(4)
				if(td.html()!=""&&td.html()!=undefined){
					var remittance = td.children("input").val()
					if(remittance==undefined){
						remittanceSum = (parseFloat(remittanceSum) + parseFloat(td.text())).toFixed(2);
					}else{
						remittanceSum = (parseFloat(remittanceSum) + parseFloat(remittance)).toFixed(2);
					}
				}
				if($(this).find("input").last().val()=="true"){
					realCostSum = (parseFloat(realCostSum) + parseFloat(td.text())).toFixed(2);
				}
				
			});
			$.each($("#loanTable").children("tr"),function(){
				if($(this).find("input").last().val()=="true"){
					realCostSum = (parseFloat(realCostSum) + parseFloat($(this).children("td").eq(1).text())).toFixed(2);
				}
			});
			$("#table").find("#"+tourId).children("td").eq(4).text(remittanceSum);
			$("#table").find("#"+tourId).children("td").eq(5).text((parseFloat(total)+parseFloat(remittanceSum)).toFixed(2));
			$("#table").find("#"+tourId).children("td").eq(7).text(realCostSum);
			$("#table").find("#"+tourId).children("td").eq(8).text("可借款");
			$("#cancelFinance").hide();
		});
	});
	
</script>
