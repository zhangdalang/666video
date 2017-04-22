<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<% String path = request.getContextPath()+"/"; %>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>
<style type="text/css">
	@media only screen and (max-width:460px) {
		.menu-toggler{
			display: none;
		}
		.ace-nav{
			position: absolute;
			right: 0px;
			top: -1px;
		}
		.ace-settings-container{
			display: none;
		}
		.breadcrumb{
			position: absolute;
			left: -80px;
			top: 10px;
		}
		.nav-search{
			display: none;
		}
		.row{
			display: none;
		}
	}
</style>
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
								<a id="add" href="<%=path %>localTourManage?key=${tour.tourNo }">${tour.tourNo }  ${tour.tourName }</a>
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
					
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					<div class="table-header">成本变更</div>
					<c:if test="${changes.costs.size()==0 }">
						<div style="margin-left: 10px;"><span class="red">没有查询到成本变更记录</span></div>
					</c:if>
<!-- 列表循环 -->		<c:forEach var="changeCost" items="${changes.costs }">
						<div>
							<table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
								<thead>
									<tr role="row">
										
									</tr>
								</thead>
	
								<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
									<tr>
										<td style="width: 20%">日期</td>
										<td style="width: 30%">${changeCost.costTable.costDate }</td>
										<td style="width: 20%">内容</td>
										<td style="width: 30%">${changeCost.contentName }</td>
									</tr>
									<tr>
										<td style="width: 20%">供应商</td>
										<td style="width: 30%">${changeCost.supplierName }</td>
										<td style="width: 20%">成本单价</td>
										<td style="width: 30%">${changeCost.costTable.cost }</td>
									</tr>
									<tr>
										<td style="width: 20%">数量</td>
										<td style="width: 30%">${changeCost.costTable.count }</td>
										<td style="width: 20%">天数</td>
										<td style="width: 30%">${changeCost.costTable.days }</td>
									</tr>
									<tr>
										<td style="width: 20%">合计</td>
										<td style="width: 30%" class="red"><fmt:formatNumber value="${changeCost.costTable.cost*changeCost.costTable.count*changeCost.costTable.days }" pattern="#0.00"></fmt:formatNumber></td>
										<td style="width: 20%">申请人</td>
										<td style="width: 30%">${changeCost.applicationerRealName }</td>
									</tr>
									<tr>
										<td style="width: 20%">备注</td>
										<td style="width: 30%">${changeCost.costTable.remark }</td>
										<td style="width: 20%">状态</td>
										<td style="width: 30%">${changeCost.status }</td>
									</tr>
							</tbody>
						</table>
						<div id="${changeCost.costTable.id }" class="action" style="margin: 5px;">
							<shiro:hasPermission name="changeCost:cancel">
								<button class="btn btn-sm btn-danger cancelCost">驳回</button>
							</shiro:hasPermission>
							<shiro:hasPermission name="changeCost:ok">
								<button class="btn btn-sm btn-success pull-right changeCost">同意</button>
							</shiro:hasPermission>
						</div>
						<HR style="margin-top: 0px;">
					</div>
					</c:forEach>
<!-- 列表循环结束 -->	
					<div class="table-header">收入变更</div>
					<c:if test="${changes.incomes.size()==0 }">
						<div style="margin-left: 10px;"><span class="red">没有查询到收入变更记录</span></div>
					</c:if>
					<c:forEach var="changeIncome" items="${changes.incomes }">
						<div>
							<table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
								<thead>
									<tr role="row">
										
									</tr>
								</thead>
	
								<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
									<tr>
										<td style="width: 20%">日期</td>
										<td style="width: 30%">${changeIncome.incomeTable.incomeDate }</td>
										<td style="width: 20%">客户</td>
										<td style="width: 30%">${changeIncome.customerAgencyName }</td>
									</tr>
									<tr>
										<td style="width: 20%">收入</td>
										<td style="width: 30%">${changeIncome.incomeTable.income }</td>
										<td style="width: 20%">申请人</td>
										<td style="width: 30%">${changeIncome.applicationerRealName }</td>
									</tr>
									<tr>
										<td style="width: 20%">备注</td>
										<td style="width: 30%">${changeIncome.incomeTable.remark }</td>
										<td style="width: 20%">状态</td>
										<td style="width: 30%">${changeIncome.status }</td>
									</tr>
								</tbody>
							</table>
						<div id="${changeIncome.incomeTable.id }" class="action" style="margin: 5px;">
							<shiro:hasPermission name="changeIncome:cancel">
								<button class="btn btn-sm btn-danger cancelIncome">驳回</button>
							</shiro:hasPermission>
							<shiro:hasPermission name="changeIncome:ok">
								<button class="btn btn-sm btn-success pull-right changeIcome">同意</button>
							</shiro:hasPermission>
						</div>
						<HR style="margin-top: 0px;">
					</div>
					</c:forEach>
					<div style="text-align: center;">
						<a id="changed" href="<%=path %>mobile/changeCostIncomeApplication?id=${tour.id }&status=-1">点击查看本团成本收入变更记录</a>
					</div>
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

<!-- 正文结束 -->	

<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		/* 获取url参数 */
        if(getUrlParam("status")==-1){//参数值
        	$("#changed").remove();
        	$(".action").remove();
        }
		
		$(".changeCost").click(function(){
			var id = $(this).parent().attr("id");
			$(this).parent().parent().remove();
			var myData = {id:id};
			 $.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }mobile/changeCostOk",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        }
			 });
		});
		$(".changeIcome").click(function(){
			var id = $(this).parent().attr("id");
			$(this).parent().parent().remove();
			var myData = {id:id};
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }mobile/changeIcomeOk",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        }
			 });
		});
		
		$(".cancelCost").click(function(){
			var id = $(this).parent().attr("id");
			$(this).parent().parent().remove();
			var myData = {id:id};
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }mobile/cancelCost",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        }
			 });
		});
		$(".cancelIncome").click(function(){
			var id = $(this).parent().attr("id");
			$(this).parent().parent().remove();
			var myData = {id:id};
			$.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }mobile/cancelIncome",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        }
			 });
		});
	});
	function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }
</script>
