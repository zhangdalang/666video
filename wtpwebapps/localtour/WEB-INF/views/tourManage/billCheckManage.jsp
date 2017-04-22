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
								<a id="" role="button" data-toggle="modal" href="#">签单管理</a>
							</li>
						</ul><!-- .breadcrumb -->
						<div class="accessBar" style="display: inline-block;">
							<div style="display: inline-block;">
								<shiro:hasPermission name="billCheck:find">
									<a class="blue" id="pay" data-toggle="modal" href="#" title="付款申请">
										<i class="icon-file-alt bigger-100"></i>
										付款申请
									</a>
								</shiro:hasPermission>
							</div>
						</div>
						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }billCheckManage" method="get">
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
									<th aria-label="Price: activate to sort column ascending" style="width: 14%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										供应商
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 14%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										账期
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 14%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										本期结账日
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 14%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										本期签单总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 14%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										本期已申请总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 14%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										本期待汇款总计
									</th>
									<th aria-label="Price: activate to sort column ascending" style="width: 14%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
										本期已汇款总计
									</th>
								</tr>
							</thead>
	
							<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
	<!-- 列表循环 -->				
								<c:forEach var="bill" items="${bills }" varStatus="status">
									<tr id="${bill.supplierTable.id }">
										<td class="center  sorting_1">
												<label>
													<input class="ace" type="checkbox">
													<span class="lbl"></span>
												</label>
										</td>
										<td><a id="" role="button" data-toggle="modal" href="#">${bill.supplierTable.supplierName }</a></td>
										<td>
											<c:choose>
												<c:when test="${bill.supplierTable.accountPeriod!=null }">
													${bill.supplierTable.accountPeriod }个月
												</c:when>
											</c:choose>
										</td>
										<td><c:choose>
												<c:when test="${bill.settlementDate!=null }">
													${bill.settlementDate }
												</c:when>
											</c:choose>
										</td>
										<td>${bill.billSum }</td>
										<td>${bill.applicationSum }</td>
										<td>${bill.willRemittanceSum }</td>
										<td>${bill.remittancedSum }</td>
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
											<a href="${path }billCheckManage?page=${pageNo-1 }&key=${key }"><i class="icon-double-angle-left"></i></a>
										</li>
										<c:forEach var="page" begin="1" end="${pageMax }">
											<li <c:if test="${pageNo==page }">class="active"</c:if>>
												<a href="${path }billCheckManage?page=${page }&key=${key }">${page }</a>
											</li>
										</c:forEach>
										<li <c:choose><c:when test="${pageNo==pageMax }">class="next disabled"</c:when><c:otherwise>class="next"</c:otherwise></c:choose>>
											<a href="${path }billCheckManage?page=${pageNo+1 }&key=${key }"><i class="icon-double-angle-right"></i></a>
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
				<div aria-hidden="true" style="display: none;" id="payModel" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width: 80%;">
						<div class="modal-content">
					        <div class="modal-header no-padding">
								<div class="table-header">
									签单管理
						 		</div>
						  	</div>
						  	<div style="background-color: silver;font-size: 14px;padding: 3px;padding-left: 10px;color: white;">可付款项</div>
							<div class="modal-body no-padding">
					         	<div class="tab-content no-border padding-6" style="z-index: 1400;">
						         	<table class="table table-striped table-bordered table-hover no-margin">
										<thead>
											<tr>
												<th>
													<label>
														<input class="ace selectAllPay" type="checkbox">
														<span class="lbl"></span>
													</label>
												</th>
												<th style="width: 9%;">团号</th>
												<th style="width: 9%;">团名</th>
												<th style="width: 9%;">成本日期</th>
												<th style="width: 9%;">内容</th>
												<th style="width: 9%;">成本</th>
												<th style="width: 9%;">数量</th>
												<th style="width: 9%;">天数</th>
												<th style="width: 9%;">成本小计</th>
												<th style="width: 9%;">签单金额</th>
												<th style="width: 9%;">明细备注</th>
												<th style="width: 9%;">状态</th>
											</tr>
										</thead>
										<tbody id="canPay">
										</tbody>
									</table>
									<span id="canChangeCostBlue" class="blue" style="">*蓝色为成本收入变更</span>
									<span id="noCanPay" class="red">无可付款项</span>
					       		</div>
					       	</div>
					       	<div style="background-color: silver;font-size: 14px;padding: 3px;padding-left: 10px;color: white;">付款记录</div>
					       	<div class="modal-body no-padding">
					         	<div class="tab-content no-border padding-6" style="z-index: 1400;">
						         	<table class="table table-striped table-bordered table-hover no-margin">
										<thead>
											<tr>
												<th style="width: 9%;">团号</th>
												<th style="width: 9%;">团名</th>
												<th style="width: 9%;">成本日期</th>
												<th style="width: 9%;">内容</th>
												<th style="width: 9%;">成本</th>
												<th style="width: 9%;">数量</th>
												<th style="width: 9%;">天数</th>
												<th style="width: 9%;">成本小计</th>
												<th style="width: 9%;">签单金额</th>
												<th style="width: 9%;">明细备注</th>
												<th style="width: 9%;">状态</th>
											</tr>
										</thead>
										<tbody id="isPay">
										</tbody>
									</table>
									<span id="isChangeCostBlue" class="blue" style="">*蓝色为成本收入变更</span>
									<span id="noIsPay" class="red">无付款记录</span>
					       		</div>
					       	</div>
							<div class="modal-footer no-margin-top">
								<button id="cancel" class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
									<i class="icon-remove"></i>
									关闭
								</button>
								<!-- <a href="#" id="autoAdd" style="margin:  20px;">一键填充签单金额</a> -->
								<a href="#" id="prev" style="margin:  20px;">上一账期</a>
								<a href="#" id="next" style="margin:  20px; margin-left: 0">下一账期</a>
								<shiro:hasPermission name="billCheck:billApplication">
									<button id="payApplication" class="btn btn-sm btn-success pull-right"  data-dismiss="modal">
										<i class="icon-qrcode"></i>
										付款申请
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
		$("#gourpManage").addClass("open");
		$("#gourpManage").children("ul").attr("style","display:block");
		$("#billCheckManage").addClass("active");
		$(".modal-dialog").attr("style","width:90%;");
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
				/* if($(this).siblings().last().text()=="待审"){
					$("#reimbursementApplication").show();
				}else{
					$("#reimbursementApplication").hide();
				} */
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
		$(".selectAllPay").click(function(){
			if($(this).prop("checked")){
				$("#canPay").find("input").prop("checked",true);
			}else{
				$("#canPay").find("input").prop("checked",false);
			}
		});
		
		/* 自动填充 */
		/* $("#autoAdd").click(function(){
			var inputs = $("#canPay").find("input").not(".ace");
			$.each(inputs,function(){
				$(this).val($(this).parent().prev().text());
			});
		}); */
	
	/*查看*/
		$("#pay").click(function(){
			var checkbox = $("#table").find("input:checked");
			if(checkbox.length==0){
				alert("请选择一个供应商");
				$(this).attr("href","#");
			}else if(checkbox.length>1){
				alert("只能选择一个供应商");
				$(this).attr("href","#");
			}else{
				$(".selectAllPay").prop("checked",false);
				$(this).attr("href","#payModel");
				var supplierId = checkbox.parent().parent().parent().attr("id");
				$("#payApplication").parent().attr("id",supplierId);
				var myData = {supplierId:supplierId};
				$.ajax({
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }billCheckManage/find",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	$("#canPay").html("");
			        	$("#isPay").html("");
			        	var bill = $('<td><input style="width:100%;" value="0" type="text"></td>');
						$.each(data.costs,function(){
				        	if(this.costTable.reimbursement!=0&&this.costTable.cost!=0&&this.costTable.reimbursement!=null){
				        		bill.html(this.costTable.reimbursement.toFixed(2));
				        	}
				        	var tr = $('<tr id="'+this.costTable.id+'">'+
												'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
												'<td>'+this.localTourTable.tourNo+'</td>'+
												'<td>'+this.localTourTable.tourName+'</td>'+
												'<td>'+this.costTable.costDate+'</td>'+
												'<td>'+this.contentName+'</td>'+
												'<td>'+this.costTable.cost+'</td>'+
												'<td>'+this.costTable.count+'</td>'+
												'<td>'+this.costTable.days+'</td>'+
												'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
												'<td>'+bill.html()+'</td>'+
												'<td>'+this.costTable.remark+'</td>'+
												'<td>'+this.payStatus+'</td>'+
										'</tr>')
							if(this.costTable.payStatus>0){
								tr.children("td").eq(0).remove();
								$("#isPay").append(tr);
							}else{
								$("#canPay").append(tr);
							}
						});
						$.each(data.changeCosts,function(){
				        	if(this.costTable.reimbursement!=0&&this.costTable.cost!=0&&this.costTable.reimbursement!=null){
				        		bill.html(this.costTable.reimbursement.toFixed(2));
				        	}
				        	
				        	var tr = $('<tr id="'+this.costTable.id+'" class="blue">'+
												'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
												'<td>'+this.localTourTable.tourNo+'</td>'+
												'<td>'+this.localTourTable.tourName+'</td>'+
												'<td>'+this.costTable.costDate+'</td>'+
												'<td>'+this.contentName+'</td>'+
												'<td>'+this.costTable.cost+'</td>'+
												'<td>'+this.costTable.count+'</td>'+
												'<td>'+this.costTable.days+'</td>'+
												'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
												'<td>'+bill.html()+'</td>'+
												'<td>'+this.costTable.remark+'</td>'+
												'<td>'+this.payStatus+'</td>'+
										'</tr>')
							if(this.costTable.payStatus>0){
								tr.children("td").eq(0).remove();
								$("#isPay").append(tr);
							}else{
								$("#canPay").append(tr);
							}
						});
						$.each(data.reimbursementCosts,function(){
				        	if(this.costTable.reimbursement!=0&&this.costTable.cost!=0&&this.costTable.reimbursement!=null){
				        		bill.html(this.costTable.reimbursement.toFixed(2));
				        	}
				        	
				        	var tr = $('<tr id="'+this.costTable.id+'" class="red">'+
												'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
												'<td>'+this.localTourTable.tourNo+'</td>'+
												'<td>'+this.localTourTable.tourName+'</td>'+
												'<td>'+this.costTable.costDate+'</td>'+
												'<td>'+this.contentName+'</td>'+
												'<td>'+this.costTable.cost+'</td>'+
												'<td>'+this.costTable.count+'</td>'+
												'<td>'+this.costTable.days+'</td>'+
												'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
												'<td>'+bill.html()+'</td>'+
												'<td>'+this.costTable.remark+'</td>'+
												'<td>'+this.payStatus+'</td>'+
										'</tr>');
							tr.children("td").eq(0).remove();
							$("#isPay").append(tr);
							
						});

						/* 设置无记录 */
						if($("#canPay").children("tr").length==0){
							$("#canPay").parent().hide();
							$("#noCanPay").show();
							$("#canChangeCostBlue").hide();
						}else{
							$("#canPay").parent().show();
							$("#noCanPay").hide();
							if(data.changeCosts!=0){
								$("#canChangeCostBlue").show();
							}else{
								$("#canChangeCostBlue").hide();
							}
						}
						if($("#isPay").children("tr").length==0){
							$("#isPay").parent().hide();
							$("#noIsPay").show();
							$("#isChangeCostBlue").hide();
						}else{
							$("#isPay").parent().show();
							$("#noIsPay").hide();
							if(data.changeCosts.length!=0){
								$("#isChangeCostBlue").show();
							}else{
								$("#isChangeCostBlue").hide();
							}
						}
						/* 选择本行 */
						$("#canPay").find("td").not(".sorting_1").click(function(){
							var checkbox = $(this).siblings().eq(0).find("input");
							if(checkbox.prop("checked")){
								checkbox.prop("checked",false);
							}else{
								$("#canPay").find("input").prop("checked",false);
								checkbox.prop("checked",true);
							}
						});
			        }  
				});
			}
		});
		
	/* 账期选择 */
	var relativePeriod = 0;
	$("#next").click(function(){
		relativePeriod++;
		checkRelativePeriod(relativePeriod);
	});
	$("#prev").click(function(){
		relativePeriod--;
		checkRelativePeriod(relativePeriod);
	});
	function checkRelativePeriod(relativePeriod){
		var supplierId = $("#table").find("input:checked").parent().parent().parent().attr("id");
		var myData = {supplierId:supplierId,relativePeriod:relativePeriod};
		$.ajax({
	        type: "GET",  
	        contentType:"application/json;charset=utf-8",  
	        url:"${path }billCheckManage/find",  
	        data:myData,  
	        dataType: "json",  
	        async: false,  
	        success:function(data){
	        	$("#canPay").html("");
	        	$("#isPay").html("");
	        	var bill = $('<td><input style="width:100%;" value="0" type="text"></td>');
				$.each(data.costs,function(){
		        	if(this.costTable.reimbursement!=0&&this.costTable.cost!=0&&this.costTable.reimbursement!=null){
		        		bill.html(this.costTable.reimbursement.toFixed(2));
		        	}
		        	var tr = $('<tr id="'+this.costTable.id+'">'+
										'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
										'<td>'+this.localTourTable.tourNo+'</td>'+
										'<td>'+this.localTourTable.tourName+'</td>'+
										'<td>'+this.costTable.costDate+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.costTable.cost+'</td>'+
										'<td>'+this.costTable.count+'</td>'+
										'<td>'+this.costTable.days+'</td>'+
										'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
										'<td>'+bill.html()+'</td>'+
										'<td>'+this.costTable.remark+'</td>'+
										'<td>'+this.payStatus+'</td>'+
								'</tr>')
					if(this.costTable.payStatus>0){
						tr.children("td").eq(0).remove();
						$("#isPay").append(tr);
					}else{
						$("#canPay").append(tr);
					}
				});
				$.each(data.changeCosts,function(){
		        	if(this.costTable.reimbursement!=0&&this.costTable.cost!=0&&this.costTable.reimbursement!=null){
		        		bill.html(this.costTable.reimbursement.toFixed(2));
		        	}
		        	
		        	var tr = $('<tr id="'+this.costTable.id+'" class="blue">'+
										'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
										'<td>'+this.localTourTable.tourNo+'</td>'+
										'<td>'+this.localTourTable.tourName+'</td>'+
										'<td>'+this.costTable.costDate+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.costTable.cost+'</td>'+
										'<td>'+this.costTable.count+'</td>'+
										'<td>'+this.costTable.days+'</td>'+
										'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
										'<td>'+bill.html()+'</td>'+
										'<td>'+this.costTable.remark+'</td>'+
										'<td>'+this.payStatus+'</td>'+
								'</tr>')
					if(this.costTable.payStatus>0){
						tr.children("td").eq(0).remove();
						$("#isPay").append(tr);
					}else{
						$("#canPay").append(tr);
					}
				});
				
				$.each(data.reimbursementCosts,function(){
		        	if(this.costTable.reimbursement!=0&&this.costTable.cost!=0&&this.costTable.reimbursement!=null){
		        		bill.html(this.costTable.reimbursement.toFixed(2));
		        	}
		        	
		        	var tr = $('<tr id="'+this.costTable.id+'" class="red">'+
										'<td class="center  sorting_1"><label><input class="ace" type="checkbox"><span class="lbl"></span></label></td>'+
										'<td>'+this.localTourTable.tourNo+'</td>'+
										'<td>'+this.localTourTable.tourName+'</td>'+
										'<td>'+this.costTable.costDate+'</td>'+
										'<td>'+this.contentName+'</td>'+
										'<td>'+this.costTable.cost+'</td>'+
										'<td>'+this.costTable.count+'</td>'+
										'<td>'+this.costTable.days+'</td>'+
										'<td>'+(this.costTable.cost*this.costTable.count*this.costTable.days).toFixed(2)+'</td>'+
										'<td>'+bill.html()+'</td>'+
										'<td>'+this.costTable.remark+'</td>'+
										'<td>'+this.payStatus+'</td>'+
								'</tr>')
					tr.children("td").eq(0).remove();
					$("#isPay").append(tr);
				});

				/* 设置无记录 */
				if($("#canPay").children("tr").length==0){
					$("#canPay").parent().hide();
					$("#noCanPay").show();
					$("#canChangeCostBlue").hide();
				}else{
					$("#canPay").parent().show();
					$("#noCanPay").hide();
					if(data.changeCosts!=0){
						$("#canChangeCostBlue").show();
					}else{
						$("#canChangeCostBlue").hide();
					}
				}
				if($("#isPay").children("tr").length==0){
					$("#isPay").parent().hide();
					$("#noIsPay").show();
					$("#isChangeCostBlue").hide();
				}else{
					$("#isPay").parent().show();
					$("#noIsPay").hide();
					if(data.changeCosts.length!=0){
						$("#isChangeCostBlue").show();
					}else{
						$("#isChangeCostBlue").hide();
					}
				}
				/* 选择本行 */
				$("#canPay").find("td").not(".sorting_1").click(function(){
					var checkbox = $(this).siblings().eq(0).find("input");
					if(checkbox.prop("checked")){
						checkbox.prop("checked",false);
					}else{
						$("#canPay").find("input").prop("checked",false);
						checkbox.prop("checked",true);
					}
				});
	        }  
		});
	}
	/* 付款申请 */
		$("#payApplication").click(function(){
			var costTables = new Array();
			var changeCostTables = new Array();
			var inputs = $("#canPay").find("input.ace");
			if($("#canPay").find("input.ace:checked").length==0){
				$("#payApplication").attr("data-dismiss","");
				alert("没有选择要申请的付款项");
			}else{
				$("#payApplication").attr("data-dismiss","modal");
				var appSum = 0;
				var supplierId = $("#payApplication").parent().attr("id");
				$.each(inputs,function(){
					var tr = $(this).parent().parent().parent();
					if($(this).prop("checked")){
						if(tr.attr("class")!="blue"){
							costTables.push({
								id:tr.attr("id"),
								supplierId:supplierId,
								reimbursement:tr.find("input").eq(1).val()
							});
						}else{
							changeCostTables.push({
								id:tr.attr("id"),
								supplierId:supplierId,
								reimbursement:tr.find("input").eq(1).val()
							});
						}
						appSum = appSum + parseFloat(tr.children("td").eq(9).text());
					}
				});
				var full = {costTables:costTables,changeCostTables:changeCostTables};
				var myData = JSON.stringify(full);
				$.ajax({
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }billCheckManage/update",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	if(data==-1){
			        		$("#payApplication").attr("data-dismiss","");
			        		alert("保存失败");
			        	}else{
			        		$("#payApplication").attr("data-dismiss","modal");
			        		var td = $("#table").find("#"+supplierId).children("td").eq(5);
			        		td.text((parseFloat(td.text())+appSum).toFixed(2));
			        	}
			        }  
				});
			}
		});
	});
	
</script>
