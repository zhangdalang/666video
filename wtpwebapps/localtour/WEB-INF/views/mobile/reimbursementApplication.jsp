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
					<c:if test="${reimbursement==null }">
							<div style="margin-left: 10px;"><span class="red">没有查询到借款记录</span></div>
					</c:if>
						<div>
							<table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
								<thead>
									<tr role="row">
										
									</tr>
								</thead>
	
								<tbody id="table" aria-relevant="all" aria-live="polite" role="alert" class="blue">
									<tr>
										<td style="width: 6%%"></td>
										<td style="width: 18.8%">团队预算</td>
										<td style="width: 18.8%">团队执行</td>
										<td style="width: 18.8%">应收应付</td>
										<td style="width: 18.8%">实收实付</td>
										<td style="width: 18.8%">团队报账</td>
									</tr>
									<tr>
										<td>成本</td>
										<td>${reimbursement.budgetCostSum }</td>
										<td>${reimbursement.executeCostSum }</td>
										<td>${reimbursement.willCostSum }</td>
										<td>${reimbursement.realCostSum }</td>
										<td>${reimbursement.reimbursementCostSum }</td>
									</tr>
									<tr>
										<td>收入</td>
										<td>${reimbursement.budgetIncomeSum }</td>
										<td>${reimbursement.executeIncomeSum }</td>
										<td>${reimbursement.willIncomeSum }</td>
										<td>${reimbursement.realIncomeSum }</td>
										<td>${reimbursement.reimbursementIncomeSum }</td>
									</tr>
									<tr>
										<td>毛利</td>
										<td>${reimbursement.budgetGrossProfit }</td>
										<td>${reimbursement.executeGrossProfit }</td>
										<td>${reimbursement.willGrossProfit }</td>
										<td>${reimbursement.realGrossProfit }</td>
										<td>${reimbursement.reimbursementGrossProfit }</td>
									</tr>
									<tr>
										<td>毛利率</td>
										<td>${reimbursement.budgetGrossMargin }%</td>
										<td>${reimbursement.executeGrossMargin }%</td>
										<td>${reimbursement.willGrossMargin }%</td>
										<td>${reimbursement.realGrossMargin }%</td>
										<td>${reimbursement.reimbursementGrossMargin }%</td>
									</tr>
								</tbody>
							</table>
							<span>备注：${reimbursement.headAmount }%<</span>
							<div id="${tour.id }" class="action" style="margin: 5px;">
								<shiro:hasPermission name="reimbursementApplication:cancel">
									<button class="btn btn-sm btn-danger cancelCost">驳回</button>
								</shiro:hasPermission>
								<shiro:hasPermission name="reimbursementApplication:ok">
									<button class="btn btn-sm btn-success pull-right changeCost">同意</button>
								</shiro:hasPermission>
							</div>
							<HR style="margin-top: 0px;">
						</div>			
					</div>
				</div>

<!-- 正文结束 -->	

<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		/* 获取url参数 */
        if(getUrlParam("status")==-1){//参数值
        	$("#lended").remove();
        	$(".action").remove();
        }
        
		$(".btn-success").click(function(){
			var id = $(this).parent().attr("id");
			var change = false;
			if($(this).parent().prev().children("tbody").attr("class")=="blue"){
				change = true;
			}
			$(this).parent().parent().remove();
			var myData = {id:id,change:change};
			 $.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }mobile/reimbursementApplicationOk",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        }
			 });
		});
		
		$(".btn-danger").click(function(){
			var id = $(this).parent().attr("id");
			var change = false;
			if($(this).parent().prev().children("tbody").attr("class")=="blue"){
				change = true;
			}
			$(this).parent().parent().remove();
			var myData = {id:id,change:change};
			 $.ajax({
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }mobile/reimbursementApplicationCancel",  
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
