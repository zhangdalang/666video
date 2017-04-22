<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath()+"/"; %>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>
<jsp:include page="../../../resources/include/pageSettings.jsp"></jsp:include>
<jsp:include page="../../../resources/include/sider.jsp"></jsp:include>

<link rel="stylesheet" href="${path }resources/assets/css/jquery-ui-1.10.3.full.min.css">
<link rel="stylesheet" href="${path }resources/assets/css/chosen.css" />
<style type="text/css">
	#ui-datepicker-div a{
		text-align: center;
	}
	#ui-datepicker-div span{
		text-align: center;
	}
	。default{
		position: relative;
		top: -7px;
		height: 30px;
	}
	。chosen-container{
		top: -2px;
	}
</style>
<!-- 正文开始 -->
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-user"></i>
								<a href="#">供应商使用分析</a>
							</li>
						</ul><!-- .breadcrumb -->
						<div class="accessBar" style="display: inline-block;">
							开始日期：
							<div style="display: inline-block;margin-right: 10px;margin-top: 2px;"><input id="start" class="datepicker" type="text" style="width: 100px;"></div>
							结束日期：
							<div style="display: inline-block;margin-right: 10px;margin-top: 2px;"><input id="end" class="datepicker" type="text" style="width: 100px;"></div>
							<select id="select" style="display: none;" multiple="multiple" class="chosen-select" data-placeholder="可选多个...">
								<option value="">&nbsp;</option>
							</select>
							<button id="find" class="btn btn-xs btn-success" style="width: 70px;position: relative;top: -3px;">查询</button>
							<button id="down" class="btn btn-xs btn-success" style="width: 70px;position: relative;top: -3px;margin-left: 10px;">导出Excel</button>
						</div>
					</div>
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid"><table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
						<table id="excel" aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
							<thead>
								<tr role="row">
									<th style="width: 20%;">
										供应商名
									</th>
									<th style="width: 10%;">
										应付
									</th>
									<th style="width: 10%;">
										实付
									</th>
									<th style="width: 10%;">									
										团队数量
									</th>
									<th style="width: 10%;">
										使用数量
									</th>
								</tr>
							</thead>
							<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
							</tbody>
						</table>
						*应付为领导批准，财务未汇款项。
					</div>
				</div>
<!-- 正文结束 -->									
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<!-- 日历组件依赖 -->
<script src="${path }resources/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<!-- 下拉搜索依赖 -->
<script src="${path }resources/assets/js/chosen.jquery.min.js"></script>
<!-- 导出excel组件 -->
<script src="${path }resources/assets/js/kayalshri-tableExport/tableExport.js"></script>
<script src="${path }resources/assets/js/kayalshri-tableExport/jquery.base64.js"></script>
<script type="text/javascript">
	$(function(){
	/* 初始化 */
		$("#statisticalAnalysis").addClass("open");
		$("#statisticalAnalysis").children("ul").attr("style","display:block");
		$("#supplierGains").addClass("active");
		$.ajax({
	        type: "GET",  
	        contentType:"application/json;charset=utf-8",  
	        url:"${path }supplierGains/init",
	        dataType: "json",
	        async: false,
	        success:function(data){
				$.each(data,function(){
					$("select").append('<option value="'+this.id+'">'+this.supplierName+'</option>');
				});
	        }
		});
		$("select").chosen({no_results_text: "查无结果", search_contains: true});
		$("select").next().attr("style","width: 200px;top: -3px;")
		$("select").next().find("li").attr("style","height: 25px;");
		$("select").next().find("input").attr("style","height: 25px;top: -6px;position: relative;");
	/* 日历初始化 */
		$(".datepicker").not("#arrTime,#departTime,#costTime,#incomeTime").datepicker({
			showOtherMonths: true,
			selectOtherMonths: false,
			//isRTL:true,
			/* changeMonth: true,
			changeYear: true,
			
			showButtonPanel: true,
			beforeShow: function() {
				//change button colors
				var datepicker = $(this).datepicker( "widget" );
				setTimeout(function(){
					var buttons = datepicker.find('.ui-datepicker-buttonpane')
					.find('button');
					buttons.eq(0).addClass('btn btn-xs');
					buttons.eq(1).addClass('btn btn-xs btn-success');
					buttons.wrapInner('<span class="bigger-110" />');
				}, 0);
			}  */
		});
	/* 表格收缩展开 */
		$("#table").delegate(".supplier","click",function(){
			$(".supplier"+$(this).attr("id")+".scope").toggle();
			if($(".supplier"+$(this).attr("id")+".scope").eq(0).attr("style")=="display: none;"){
				$(".supplier"+$(this).attr("id")).hide();
			}
		});
		
		$("#table").delegate(".scope","click",function(){
			$(".scope"+$(this).attr("id")).toggle();
		});
	/* 页面直接载入本月数据 */
		/* var start = new Date();
		start.setDate(1);
		var end = new Date();  
		end.setMonth(end.getMonth()+1);  
		end.setDate(0);  
		var myData = {start:start,end:end}; */
		/* $.ajax({
	        type: "GET",  
	        contentType:"application/json;charset=utf-8",  
	        url:"${path }deptGains/get",
	        data:myData,
	        dataType: "json",
	        async: false,
	        success:function(data){
	        	var table = $("#table");
	        	var index = 0
	        	var index2 = 0
				$.each(data,function(){
					if(this.type=="dept"){
						index++;
						table.append('<tr id="'+index+'" class="dept"><td class="blue">'+this.headerName+'</td><td>'+this.willCostSum+'</td><td>'+this.willIncomeSum+'</td><td>'+this.willGrossProfit+'</td><td>'+this.willGrossMargin+'%</td><td>'+this.realCostSum+'</td><td>'+this.realIncomeSum+'</td><td>'+this.realGrossProfit+'</td><td>'+this.realGrossMargin+'%</td></tr>');
					}else if(this.type=="user"){
						index2++;
						table.append('<tr id="'+index2+'" class="user dept'+index+'"><td class="green">&nbsp;&nbsp;&nbsp;&nbsp;'+this.headerName+'</td><td>'+this.willCostSum+'</td><td>'+this.willIncomeSum+'</td><td>'+this.willGrossProfit+'</td><td>'+this.willGrossMargin+'%</td><td>'+this.realCostSum+'</td><td>'+this.realIncomeSum+'</td><td>'+this.realGrossProfit+'</td><td>'+this.realGrossMargin+'%</td></tr>');
					}else{
						table.append('<tr class="user'+index2+' dept'+index+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+this.headerName+'</td><td>'+this.willCostSum+'</td><td>'+this.willIncomeSum+'</td><td>'+this.willGrossProfit+'</td><td>'+this.willGrossMargin+'%</td><td>'+this.realCostSum+'</td><td>'+this.realIncomeSum+'</td><td>'+this.realGrossProfit+'</td><td>'+this.realGrossMargin+'%</td></tr>');
					}
					$("#table").find("tr").not(".dept").hide();
				});
	        }
		}); */
	/* 导出excel */
		$("#down").click(function(){
			$('#excel').tableExport({type:'excel',escape:'false'});
		});
	/* 查询 */
		var interval;
		$("#find").click(function(){
			if($("#wait").length==0){
				if($("#start").val()==""||$("#end").val()==""){
					alert("没有选择时间起止日期");
					return;
				}
				/* if($("#select").val()==null){
					alert("没有选择供应商");
					return;
				} */
				$("#table").html("");
				var start = new Date($("#start").val());
				var end = new Date($("#end").val());
				var myData = {supplierIds:$("#select").val()==null?"":$("#select").val().join(","),start:start,end:end};
				/* var progress = $('<div id="wait" style="position: absolute;top: 300px;width: 30%;left: 45%;text-align: center;"><p>系统正在统计数据，请耐心等待</p><i class="icon-spinner icon-spin orange" style="font-size: 500%"></i></div></div>'); */
				var progress = $('<div id="wait" style="position: absolute;top: 200px;width: 30%;left: 35%;text-align: center;"><p>系统正在统计数据，请耐心等待</p><div class="progress" data-percent="0%"><div class="progress-bar" style="width:0%;"></div></div></div></div>');
				var s = 3*(end.getMonth()-start.getMonth()+1);
				$("#sample-table-2_wrapper").append(progress);
				var percent = 0;
				var interval = setInterval(function(){
					if(percent==99){
						clearInterval(interval);
					}
					$(".progress").attr("data-percent",percent+"%");
					$(".progress-bar").attr("style","width:0"+percent+"%");
					percent++;
				},s*10);
				$.ajax({
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }supplierGains/get",
			        data:myData,
			        dataType: "json",
			        async: true,
			        success:function(data){
			        	clearInterval(interval);
			        	$(".progress").attr("data-percent","100%");
						$(".progress-bar").attr("style","width:0"+percent+"100%");
			        	$("#wait").remove();
			        	var table = $("#table");
			        	var index = 0
			        	var index2 = 0
						$.each(data,function(){
							if(this.type=="supplier"){
								index++;
								table.append('<tr id="'+index+'" class="supplier"><td class="blue">'+this.headerName+'</td><td>'+this.willCostSum+'</td><td>'+this.realCostSum+'</td><td>'+this.tourCount+'</td><td>'+this.useCount+'</td></tr>');
							}else if(this.type=="scope"){
								index2++;
								table.append('<tr id="'+index2+'" class="scope supplier'+index+'"><td class="green">&nbsp;&nbsp;&nbsp;&nbsp;'+this.headerName+'</td><td>'+this.willCostSum+'</td><td>'+this.realCostSum+'</td><td>'+this.tourCount+'</td><td>'+this.useCount+'</td></tr>');
							}else{
								table.append('<tr class="scope'+index2+' supplier'+index+'"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+this.headerName+'</td><td>'+this.willCostSum+'</td><td>'+this.realCostSum+'</td><td>'+this.tourCount+'</td><td>'+this.useCount+'</td></tr>');
							}
							$("#table").find("tr").not(".supplier").hide();
						});
			        	if($("#table").html()==""){
							$("#table").html("没有查询到结果");
						}
			        }
				});
			}
		});
	});
	
</script>
