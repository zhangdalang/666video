<%@page import="org.apache.shiro.SecurityUtils"%>
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
								<a id="createTour" role="button" data-toggle="modal" href="#">付款管理</a>
							</li>
						</ul><!-- .breadcrumb -->
	
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
									<th aria-label="" style="width: 2%;" colspan="1" rowspan="1" role="columnheader" class="center sorting_disabled">
										<label>
											<input class="ace" type="checkbox">
											<span class="lbl"></span>
										</label>
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										团号
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 15%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										线路
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										导游借款
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										供应商电汇
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										实付总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										应付金额
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										预估成本
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 10%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										出团日期
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										状态
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										团控人
									</th>
									<th aria-label="" style="width: 5%;" colspan="1" rowspan="1" role="columnheader" class="sorting_disabled">
										操作
									</th>
								</tr>
							</thead>
	
							<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
	<!-- 列表循环 -->				
								<c:forEach var="pay" items="${pays }" varStatus="status">
									<tr>
										<td class="center  sorting_1">
												<label>
													<input class="ace" type="checkbox">
													<span class="lbl"></span>
												</label>
										</td>
										<td><a id="editTour" role="button" data-toggle="modal" href="#edit">${pay.localTourTable.tourNo }</a></td>
										<td>${pay.localTourTable.tourName }</td>
										<td>${pay.loan }</td>
										<td>${pay.remittance }</td>
										<td>${pay.realPay }</td>
										<td>${pay.willPay }</td>
										<td>${pay.cost }</td>
										<td>${pay.localTourTable.startTime }</td>
										<td>
											<c:choose>
												<c:when test="${pay.localTourTable.enable }">
													${pay.status }
												</c:when>
												<c:otherwise>
													已取消
												</c:otherwise>
											</c:choose>
										</td>
										<td>${pay.realName }</td>
										<td id="${pay.localTourTable.id }">
											<c:if test="${pay.localTourTable.status==2 }">
												<a class="orange action" href="#" title="取消报送">
													<i id="0" class="icon-reply bigger-130"></i>
												</a>
											</c:if>
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
											<a href="/localtour/payManage?page=${pageNo-1 }&key=${key }"><i class="icon-double-angle-left"></i></a>
										</li>
										<c:forEach var="page" begin="1" end="${pageMax }">
											<li <c:if test="${pageNo==page }">class="active"</c:if>>
												<a href="/localtour/payManage?page=${page }&key=${key }">${page }</a>
											</li>
										</c:forEach>
										<li <c:choose><c:when test="${pageNo==pageMax }">class="next disabled"</c:when><c:otherwise>class="next"</c:otherwise></c:choose>>
											<a href="/localtour/payManage?page=${pageNo+1 }&key=${key }"><i class="icon-double-angle-right"></i></a>
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
																<th style="width: 10%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 10%;">导游借款</th>
																<th style="width: 6%;">操作</th>
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
																<th style="width: 10%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 10%;">导游借款</th>
																<th style="width: 6%;">操作</th>
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
																<th style="width: 10%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 10%;">导游借款</th>
																<th style="width: 6%;">操作</th>
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
																<th style="width: 10%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 10%;">导游借款</th>
																<th style="width: 6%;">操作</th>
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
																<th style="width: 10%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 10%;">导游借款</th>
																<th style="width: 6%;">操作</th>
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
																<th style="width: 10%;">借款人</th>
																<th style="width: 10%;">明细备注</th>
																<th style="width: 10%;">导游借款</th>
																<th style="width: 6%;">操作</th>
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
															<th style="width: 10%;">借款人</th>
															<th style="width: 10%;">明细备注</th>
															<th style="width: 10%;">导游借款</th>
															<th style="width: 6%;">操作</th>
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
															<th style="width: 10%;">借款人</th>
															<th style="width: 10%;">明细备注</th>
															<th style="width: 10%;">导游借款</th>
															<th style="width: 6%;">操作</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
									            </table>
											</div>
											<span id="changeCostBlue" class="blue">*蓝色为成本收入变更</span>		
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
											<th style="width: 10%;">借款操作人</th>
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

<!-- 下拉搜索依赖 -->
<script src="${path }resources/assets/js/chosen.jquery.min.js"></script>
<!-- 日历组件依赖 -->
<script src="${path }resources/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script type="text/javascript">
	$(function(){
	/* 初始化 */
		/* 样式 */
		$("#statementManage").addClass("open");
		$("#statementManage").children("ul").attr("style","display:block");
		$("#payManage").addClass("active");
		$("#create").find("input").attr("style","width:100%;");
		$("#create").find("select").attr("style","width:100%;");
		$(".modal-dialog").attr("style","width:70%;");
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
		$("#table").delegate(".action","click",function(){
			var obj = $(this);
			var td = obj.parent();
			var myData = {id:td.attr("id")};
			var status = obj.children("i").attr("id");
			td.html('<i class="icon-spinner icon-spin grey bigger-130"></i>');
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"/localtour/localTourManage/chanageStatus/"+status,  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	window.location.reload();
		        }  
			});
		});
	
	/* 编辑 */
		/* 编辑读取 */
 		$("#table").delegate("#editTour","click",function(){
			var myData = {tourId:$(this).parent().siblings().last().attr("id")};
			$("#saveEdit").parent().attr("id",myData.tourId);
			var tourUserName = $(this).parent().prev().text();
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"/localtour/payManage/find",  
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
		        	$.each(data.costs,function(){
		        		var realCost = $("<td></td>");
		        		var remittanceOk = $("<td></td>");
		        		var remark = $("<td></td>");
		        		var guideLoan = $("<td></td>");
		        		if(this.costTable.isRemittance){
		        			realCost.html(this.costTable.realCost);
		        			remark.html(this.costTable.remark);
		        		}else{
		        			if(this.costTable.isLend){
		        				remark.html(this.costTable.remark);
		        				guideLoan.html('<i class="icon-ok bigger-130"></i>');
		        				maxLoan = (parseFloat(maxLoan) + this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2);
		        			}else{
		        				if(this.costTable.realCost==0){
		        					realCost.html("<input id='remittance' class='form-control' type='text' value='"+this.costTable.realCost+"' />");
				        			remittanceOk.html('<a title="汇款确认" href="#" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a>');
				        			remark.html('<input class="form-control" value="'+this.costTable.remark+'" type="text">');
				        			guideLoan.html('<label><input class="ace" type="checkbox"><span class="lbl"></span></label>');
		        				}else{
		        					realCost.html("<input id='remittance' class='form-control' type='text' value='"+this.costTable.realCost+"' />");
				        			remittanceOk.html('<a title="汇款确认" href="#" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a>');
				        			remark.html('<input class="form-control" value="'+this.costTable.remark+'" type="text">');
		        				}
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
		        		var tr = $('<tr>'+
										'<td>'+this.costTable.costDate.replace(/-/g,'/')+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.supplierName+'</td>'+
										'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
										'<td>'+realCost.html()+'</td>'+
										'<td>'+this.borrowUserName+'</td>'+
										'<td>'+remark.html()+'</td>'+
										'<td>'+guideLoan.html()+'</td>'+
										'<td id="'+this.costTable.id+'"style="vertical-align: middle;">'+remittanceOk.html()+'</td>'+
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
		        		var remittanceOk = $("<td></td>");
		        		var remark = $("<td></td>");
		        		var guideLoan = $("<td></td>");
		        		if(this.costTable.isRemittance){
		        			realCost.html(this.costTable.realCost);
		        			remark.html(this.costTable.remark);
		        		}else{
		        			if(this.costTable.isLend){
		        				remark.html(this.costTable.remark);
		        				guideLoan.html('<i class="icon-ok bigger-130"></i>');
		        				maxLoan = (parseFloat(maxLoan) + this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2);
		        			}else{
		        				if(this.costTable.realCost==0){
		        					realCost.html("<input id='remittance' class='form-control' type='text' value='"+this.costTable.realCost+"' />");
				        			remittanceOk.html('<a title="汇款确认" href="#" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a>');
				        			remark.html('<input class="form-control" value="'+this.costTable.remark+'" type="text">');
				        			guideLoan.html('<label><input class="ace" type="checkbox"><span class="lbl"></span></label>');
		        				}else{
		        					realCost.html("<input id='remittance' class='form-control' type='text' value='"+this.costTable.realCost+"' />");
				        			remittanceOk.html('<a title="汇款确认" href="#" class="green" id="remittanceOk"><i class="icon-ok bigger-130"></i></a>');
				        			remark.html('<input class="form-control" value="'+this.costTable.remark+'" type="text">');
		        				}
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
		        		var tr = $('<tr class="blue">'+
										'<td>'+this.costTable.costDate.replace(/-/g,'/')+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.supplierName+'</td>'+
										'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
										'<td>'+realCost.html()+'</td>'+
										'<td>'+this.borrowUserName+'</td>'+
										'<td>'+remark.html()+'</td>'+
										'<td>'+guideLoan.html()+'</td>'+
										'<td id="'+this.costTable.id+'"style="vertical-align: middle;">'+remittanceOk.html()+'</td>'+
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
		        		if(this.loanTable.isLend){
		        			tr = $('<tr>'+
		        						'<td>'+this.loanTable.loanDate+'</td>'+
		        						'<td class="loanAmountTd">'+this.loanTable.loanAmount+'</td>'+
		        						'<td>'+this.loanTable.remark+'</td>'+
		        						'<td>'+this.lenderRealName+'<input value="'+this.loanTable.lender+'" type="hidden"></td>'+
		        						'<td>'+this.status+'</td>'+
		        						'<td id="'+this.loanTable.id+'"></td>'+
		        					'</tr>');
		        			total = total + this.loanTable.loanAmount;
		        		}else{
		        			if(this.loanTable.status>1){
		        				tr = $('<tr>'+
		        						'<td>'+this.loanTable.loanDate+'</td>'+
		        						'<td class="loanAmountTd">'+this.loanTable.loanAmount+'</td>'+
		        						'<td>'+this.loanTable.remark+'</td>'+
		        						'<td>'+this.lenderRealName+'<input value="'+this.loanTable.lender+'" type="hidden"></td>'+
		        						'<td>'+this.status+'</td>'+
		        						'<td id="'+this.loanTable.id+'">'+ok.html()+'</td>'+
		        					'</tr>');
		        			}else{
		        				tr = $('<tr>'+
		        						'<td><input class="form-control datepicker" value="'+this.loanTable.loanDate+'" type="text"></td>'+
		        						'<td><input class="form-control loanAmountInput" value="'+this.loanTable.loanAmount+'" type="text"></td>'+
		        						'<td><input class="form-control" value="'+this.loanTable.remark+'" type="text"></td>'+
		        						'<td>'+this.lenderRealName+'<input value="'+this.loanTable.lender+'" type="hidden"></td>'+
		        						'<td>'+this.status+'</td>'+
		        						'<td id="'+this.loanTable.id+'"></td>'+
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
		});
 		/* 点击电汇金额判断0 判断是否大于成本 */
    	$("#costs3").delegate("#remittance","blur",function(){
    		if($(this).val()>parseFloat($(this).parent().prev().text())){
    			$(this).val("");
    			alert("电汇金额不能大于成本金额");
    		}
    		if($(this).val()!=0){
    			$(this).parent().siblings().eq(-2).html("");
    		}else{
    			$(this).parent().siblings().eq(-2).html('<label><input class="ace" type="checkbox"><span class="lbl"></span></label>');
    			
    		}
    	});
 		/* 双击自动填充 */
    	$("#costs3").delegate("#remittance","dblclick",function(){
    		$(this).val($(this).parent().prev().text());
    	});
    	/* 勾选导游借款 */
    	$("#costs3").delegate(".ace","click",function(){
    		if($(this).prop("checked")){
    			$(this).parent().parent().siblings().last().children("a").remove();
    			$(this).parent().parent().siblings().eq(4).html("");
    			$(this).parent().parent().siblings().eq(6).html($(this).parent().parent().siblings().eq(6).children("input").val());
    			$("#maxLoan").html((parseFloat($("#maxLoan").html())+parseFloat($(this).parent().parent().siblings().eq(3).text())).toFixed(2));
    			$(this).parent().parent().html('<i class="icon-ok bigger-130"></i>');
    		}/* else{
    			$(this).parent().parent().siblings().eq(4).html('<input id="remittance" class="form-control" value="0" type="text">');
    			var a = $('<a id="remittanceOk" class="green" href="#" title="汇款确认"><i class="icon-ok bigger-130"></i></a>');
    			a.tooltip({
        			show: null,
        			position: {
        				my: "left top",
        				at: "left bottom"
        			},
        			open: function( event, ui ) {
        				ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
        			}
        		});
    			$(this).parent().parent().siblings().last().prepend(a);
    			$(this).parent().parent().siblings().eq(6).html('<input class="form-control" value="'+$(this).parent().parent().siblings().eq(6).text()+'" type="text">');
    			$("#maxLoan").html((parseFloat($("#maxLoan").html())-parseFloat($(this).parent().parent().siblings().eq(3).text())).toFixed(2));
    		} */
    	});
    	/* 确认汇款 */
    	$("#costs3").delegate("#remittanceOk","click",function(){
    		var a = $(this);
    		var td = a.parent();
    		a.remove();
    		/* var myData = {id:td.attr("id"),realCost:td.parent().find("#remittance").val()};
   			$.ajax({
   		        type: "GET",  
   		        contentType:"application/json;charset=utf-8",  
   		        url:"/localtour/payManage/isRemittance/",  
   		        data:myData,  
   		        dataType: "json",  
   		        async: false,  
   		        success:function(data){
   		        	if(data){ */
   		        		td.prev().html("");
   		        		var inputs = td.parent().find("input");
   		        		var value = inputs.eq(0).val();
   		        		inputs.eq(0).parent().html(value);
   		        		inputs.eq(1).parent().html(inputs.eq(1).val());
   		        		var realCostTd = $("#table").find("#"+$("#saveEdit").parent().attr("id")).siblings().eq(5);
   		        		var realCost = parseFloat(realCostTd.html());
   		        		realCostTd.html(parseFloat(realCost+value));
   		         	/* }
   		        }
    		}); */
    	});
    	/* 增加借款 */
    	$(".addLoan").click(function(){
    		var date = (new Date()).toLocaleDateString();
    		var tr = $('<tr>'+
							'<td><input style="width:100%;" class="form-control datepicker" type="text" value="'+date+'"></td>'+
							'<td><input style="width:100%;" class="form-control loanAmountInput" type="text"></td>'+
							'<td><input style="width:100%;" class="form-control" type="text"></td>'+
							'<td><%=((UserTable)SecurityUtils.getSubject().getPrincipal()).getRealName() %><input type="hidden" value="<%=((UserTable)SecurityUtils.getSubject().getPrincipal()).getId() %>"></td>'+
							'<td>可借</td>'+
							'<td><a title="借款确认" href="#" class="green" id="loanOk" hidden=""><i class="icon-ok bigger-130"></i></a></td>'+
						'</tr>');
    		tr.find(".datepicker").datepicker({
    			showOtherMonths: true,
    			selectOtherMonths: false,
    		});
    		tr.find("a").tooltip({
    			show: null,
    			position: {
    				my: "left top",
    				at: "left bottom"
    			},
    			open: function( event, ui ) {
    				ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
    			}
    		});
    		$("#loanTable").append(tr);
    	});
    	/* 借款总计计算 */
		$("#loanTable").delegate(".loanAmount","keyup",function(){
			var total = 0;
			var inputs = $("#loanTable").find(".loanAmount");
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
				$("#total").html(total);
				$(this).remove();
			}
    	});
	/*更新 */
		$("#saveEdit").click(function(){
			var id = $(this).parent().attr("id");
			var costTables = new Array();
			var costTrs = $("#edit").find("#costs3").find("tbody").find("tr").not(".blue");
			for (var int = 0; int < costTrs.length; int++) {
				var tds = costTrs.eq(int).children("td");
				if(tds.eq(-2).find("input").length==0){
					if(tds.eq(-2).children("i").length==0){
						if(tds.last().find("a").length==0){
							costTables.push({
								id:tds.last().attr("id"),
								remark:tds.eq(-3).text(),
								realCost:tds.eq(-5).text(),
								isRemittance:true,
								isLend:false});
						}else{
							var costInputs = costTrs.eq(int).find("input");
							costTables.push({
								id:tds.last().attr("id"),
								realCost:costInputs.eq(0).val(),
								remark:costInputs.eq(1).val(),
								isRemittance:false,
								isLend:false});
						}
					}else{
						costTables.push({
							id:tds.last().attr("id"),
							remark:tds.eq(-3).text(),
							isRemittance:false,
							isLend:true});
					}
				}else{
					var costInputs = costTrs.eq(int).find("input");
					costTables.push({
						id:tds.last().attr("id"),
						realCost:costInputs.eq(0).val(),
						remark:costInputs.eq(1).val(),
						isRemittance:false,
						isLend:false});
				}
			}
			var changeCostTables = new Array();
			var changeCostTrs = $("#edit").find("#costs3").find("tbody").find("tr.blue");
			for (var int = 0; int < changeCostTrs.length; int++) {
				var tds = changeCostTrs.eq(int).children("td");
				if(tds.eq(-2).find("input").length==0){
					if(tds.eq(-2).children("i").length==0){
						if(tds.last().find("a").length==0){
							changeCostTables.push({
								id:tds.last().attr("id"),
								remark:tds.eq(-3).text(),
								realCost:tds.eq(-5).text(),
								isRemittance:true,
								isLend:false});
						}else{
							var costInputs = changeCostTrs.eq(int).find("input");
							changeCostTables.push({
								id:tds.last().attr("id"),
								realCost:costInputs.eq(0).val(),
								remark:costInputs.eq(1).val(),
								isRemittance:false,
								isLend:false});
						}
					}else{
						changeCostTables.push({
							id:tds.last().attr("id"),
							remark:tds.eq(-3).text(),
							isRemittance:false,
							isLend:true});
					}
				}else{
					var costInputs = changeCostTrs.eq(int).find("input");
					changeCostTables.push({
						id:tds.last().attr("id"),
						realCost:costInputs.eq(0).val(),
						remark:costInputs.eq(1).val(),
						isRemittance:false,
						isLend:false});
				}
			}
			var loanTables = new Array();
			var loanTrs = $("#loanTable").children("tr");
			$.each(loanTrs,function(){
				var inputs = $(this).find("input");
				var tds = $(this).children("td");
				if(tds.last().children("a").length==0){
					loanTables.push({
							id:tds.last().attr("id"),
							tourId:id,
							loanDate:new Date(tds.eq(0).text()),
							loanAmount:tds.eq(1).text(),
							remark:tds.eq(2).text(),
							lender:inputs.eq(0).val(),
							isLend:true});
				}else{
					loanTables.push({
							id:tds.last().attr("id"),
							tourId:id,
							loanDate:new Date(inputs.eq(0).val()),
							loanAmount:inputs.eq(1).val(),
							remark:inputs.eq(2).val(),
							lender:inputs.eq(3).val(),
							isLend:false});
				}
			});
			var fullPayViewModel = {costTables:costTables,changeCostTables:changeCostTables,loanTables:loanTables};
			var myData = JSON.stringify(fullPayViewModel);
			$.ajax({
		        type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"/localtour/payManage/update",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	if(data==-1){
		        		alert("保存失败，提交数据异常，借款和汇款同时为true");
		        	}else if(data==-2){
		        		alert("保存失败，电汇金额不能大于成本小计");
		        	}else if(data==-3){
		        		alert("保存失败，借款总计大于最大借款额");
		        	}
		        }
			 });
		});
	
	});
	
</script>
