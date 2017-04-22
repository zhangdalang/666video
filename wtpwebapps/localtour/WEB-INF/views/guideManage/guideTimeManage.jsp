<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<% String path = request.getContextPath()+"/"; %>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>

<style type="text/css">
	.calendar a{
		display: inline-block;
		width: 3.22%;
		text-align: center;
		color: black;
		text-decoration: none;
		
	}
	#ui-datepicker-div a{
		text-align: center;
	}
	#ui-datepicker-div span{
		text-align: center;
	}
</style>
<link rel="stylesheet" href="${path }resources/assets/css/jquery-ui-1.10.3.full.min.css">

<jsp:include page="../../../resources/include/pageSettings.jsp"></jsp:include>
<jsp:include page="../../../resources/include/sider.jsp"></jsp:include>
<!-- 正文开始 -->
				<div class="main-content">
					<%-- <div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-user"></i>
								<span>&nbsp;排团表</span>
							</li>

							
							
						</ul><!-- .breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search" action="${path }guideTimeManage/initialize" method="get">
								<span class="input-icon">
									<input name="key" placeholder="搜索 ..." class="nav-search-input" id="nav-search-input" autocomplete="off" type="text" value="${key }" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- #nav-search -->
					</div> --%>
					
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid"><table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
						<thead>
							<tr role="row">
								<th aria-label="Price: activate to sort column ascending" style="width: 5%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									姓名
								</th>
								<th aria-label="Price: activate to sort column ascending" style="width: 90%;" colspan="1" rowspan="1" aria-controls="sample-table-2" tabindex="0" role="columnheader" class="sorting">
									日历
									<span class="ui-spinner ui-widget ui-widget-content ui-corner-all" style="width: 71px;">
										<input aria-valuenow="2" role="spinbutton" autocomplete="off" class="ui-spinner-input" id="year" name="value" type="text" style="width:80%;">
										<a id="plusY" aria-disabled="false" role="button" tabindex="-1" class="ui-spinner-button ui-spinner-up ui-corner-tr ui-button ui-widget ui-state-default ui-button-text-only btn btn-success" style="left:50px">
											<i class="icon-plus bigger-150" style="margin-top: 2px;width: 100%;"></i>
										</a>
										<a id="minusY" aria-disabled="false" role="button" tabindex="-1" class="ui-spinner-button ui-spinner-down ui-corner-br ui-button ui-widget ui-state-default ui-button-text-only btn btn-danger" style="left:50px">
											<i class="icon-minus bigger-150" style="margin-top: 2px;width: 100%;"></i>
										</a>
									</span>
									年
									<span class="ui-spinner ui-widget ui-widget-content ui-corner-all" style="width: 50px;">
										<input aria-valuenow="2" role="spinbutton" autocomplete="off" class="ui-spinner-input" id="month" name="value" type="text" style="width:80%;">
										<a id="plusM" aria-disabled="false" role="button" tabindex="-1" class="ui-spinner-button ui-spinner-up ui-corner-tr ui-button ui-widget ui-state-default ui-button-text-only btn btn-success" style="left:30px">
											<i class="icon-plus bigger-150" style="margin-top: 2px;width: 100%;"></i>
										</a>
										<a id="minusM" aria-disabled="false" role="button" tabindex="-1" class="ui-spinner-button ui-spinner-down ui-corner-br ui-button ui-widget ui-state-default ui-button-text-only btn btn-danger" style="left:30px">
											<i class="icon-minus bigger-150" style="margin-top: 2px;width: 100%;"></i>
										</a>
									</span>
									月
								</th>
								<!-- <th aria-label="" style="width: 5%;" colspan="1" rowspan="1" role="columnheader" class="sorting_disabled">
									操作
								</th> -->
							</tr>
						</thead>

						<tbody id="table" aria-relevant="all" aria-live="polite" role="alert">
<!-- 列表循环 -->			
							
<!-- 列表循环结束 -->								
						</tbody>
					</table>
<!-- 分页查询开始 -->					
					
<!-- 分页查询结束 -->							
					</div>
				</div>
<!-- 正文结束 -->	

<!-- 增加模板 -->
			<shiro:hasPermission name="guideTime:save">
				<div aria-hidden="true" style="display: none;" id="addModel" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width:500px;margin-top: 10%;">
						<div class="modal-content">
							<div class="modal-header no-padding">
								<div id="headerName" class="table-header">
									增加排团信息
								</div>
								<div class="modal-body no-padding">
									<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
										<thead>
										</thead>
										<tbody id="">
											<tr>
												<td>
													<input type="text" id="startTime" class="form-control" placeholder="开始日期" />
												</td>
												<td>
													<input type="text" id="endTime" class="form-control" placeholder="结束日期" />
												</td>
												<td>
													<input type="text" id="endTime" class="" placeholder="备注" style="height: 34px;"/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="modal-footer no-margin-top">
									<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
										<i class="icon-remove"></i>
										取消
									</button>
									<button id="saveNew" class="btn btn-sm btn-success pull-right" data-dismiss="modal">
										<i class="icon-save"></i>
										保存
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</shiro:hasPermission>
<!-- 增加模板 结束-->
<!-- 编辑模板 -->
			<shiro:hasPermission name="guideTime:update">
				<div aria-hidden="true" style="display: none;" id="editModel" class="modal fade" tabindex="-1">
					<div class="modal-dialog" style="width:500px;margin-top: 10%;">
						<div class="modal-content">
							<div class="modal-header no-padding">
								<div id="headerName" class="table-header">
									编辑排团日期<span style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;清空开始和结束日期并无关联团号即可删除</span>
								</div>
								<div class="modal-body no-padding">
									<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
										<thead>
										</thead>
										<tbody id="">
											<tr>
												<td>
													<input type="text" id="startTime2" class="form-control" placeholder="开始日期" />
												</td>
												<td>
													<input type="text" id="endTime2" class="form-control" placeholder="结束日期" />
												</td>
												<td>
													<input type="text" id="" class="" placeholder="备注" style="height: 34px;"/>
												</td>
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
							</div>
						</div>
					</div>
				</div>
			</shiro:hasPermission>
<!-- 编辑模板 结束-->

<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>

<script src="${path }resources/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script type="text/javascript">
	$(function(){
	/* 初始化 */
		var color =["lightblue","lightcoral","lightseagreen","lightsalmon","lightgreen","lightgray","lightpink","aquamarine","burlywood","cornflowerblue"];
		$("#guideManage").addClass("open");
		$("#guideManage").children("ul").attr("style","display:block");
		$("#guideTimeManage").addClass("active");
		var date = new Date();
		var days = getDays(date.getFullYear(),date.getMonth() + 1);
		$("#plusM").prev().val(date.getMonth()+1);
		$("#plusY").prev().val(date.getFullYear());
		var from = new Date(date.getFullYear(),date.getMonth(),1);
		var to = new Date(date.getFullYear(),date.getMonth()+1,0);
		var myData = {"from":from,"to":to};
		
		$.ajax({  
			type: "GET",  
	        contentType:"application/json;charset=utf-8",  
	        url:"${path }guideTimeManage/initialize",
	        data:myData,
	        dataType: "json",  
	        async: false,  
	        success:function(data){
	        	$("#table").html("");
	        	$.each(data,function(){
	        		$("#table").append("<tr id='guideId"+this.guideId+"'>"+
	        								"<td>"+
	        									this.realName+
	        								"</td>"+
	        								"<td class='calendar'></td>"+
	        								/* "<td>"+
		        								"<a class='green' id='add' href='#addModel' role='button' data-toggle='modal' title='手动排团'>"+
													"<i class='icon-plus bigger-130'></i>"+
												"</a>"+
	        								"</td>"+ */
	        							"</tr>");
	        		var info = $("#guideId"+this.guideId).children("td").eq(1);
	        		for (var int = 1; int <= days; int++) {
						info.append("<a href='#addModel' data-toggle='modal'>"+int+"</a>");
					}
	        		var index = 0;
	        		$.each(this.tourInfo,function(tourNo,tourInfo){
	        			var start = new Date(tourInfo.startTime);
	        			var end = new Date(tourInfo.endTime);
	        			var startTime = start.getDate();
	        			var endTime = end.getDate();
	        			if(start.getMonth()+1<$("#month").val()){
	        				startTime = 1;
	        			}
	        			if(end.getMonth()+1>$("#month").val()){
	        				endTime=to.getDate();
	        			}
	        			for (var int2 = startTime-1; int2 < endTime; int2++) {
	        				info.children("a").eq(int2).attr({"style":"background-color: "+color[index]+";","title":tourNo,"class":"tourInfo","data-toggle":"modal","href":"#editModel","id":"gt"+tourInfo.id});
						}
	        			index++;
	        			if(index>=color.length){
	        				index=0;
	        			}
	        		});
	        	});
	        	$(".tourInfo").tooltip({
    				show: null,
    				position: {
    					my: "left top",
    					at: "left bottom"
    				},
    				open: function( event, ui ) {
    					ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
    				}
    			});
	        } 
		}); 
		$(".green").tooltip({
			show: null,
			position: {
				my: "left top",
				at: "left bottom"
			},
			open: function( event, ui ) {
				ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
			}
		});
		
		$("#startTime").datepicker({
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
		$("#endTime").datepicker({
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
		$("#startTime2").datepicker({
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
		$("#endTime2").datepicker({
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
	/* 年月查询 */
		$("#plusM").click(function(){
			var input = $("#month");
			var month = input.val();
			month++;
			if(month==13){
				month=1;
			}
			input.val(month);
			days = getDays($("#year").val(),month);
			$("#month").change();
			$(".green").tooltip({
				show: null,
				position: {
					my: "left top",
					at: "left bottom"
				},
				open: function( event, ui ) {
					ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
				}
			});
		});
		
		$("#minusM").click(function(){
			var input = $("#month");
			var month = input.val();
			month--;
			if(month==0){
				month=12;
			}
			input.val(month);
			days = getDays($("#year").val(),month);
			$("#month").change();
			$(".green").tooltip({
				show: null,
				position: {
					my: "left top",
					at: "left bottom"
				},
				open: function( event, ui ) {
					ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
				}
			});
		});
		
		$("#plusY").click(function(){
			var input = $("#year");
			var year = input.val();
			year++;
			input.val(year);
			days = getDays(year,$("#month").val());
			$("#year").change();
			$(".green").tooltip({
				show: null,
				position: {
					my: "left top",
					at: "left bottom"
				},
				open: function( event, ui ) {
					ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
				}
			});
		});
		
		$("#minusY").click(function(){
			var input = $("#year");
			var year = input.val();
			year--;
			input.val(year);
			days = getDays(year,$("#month").val());
			$("#year").change();
			$(".green").tooltip({
				show: null,
				position: {
					my: "left top",
					at: "left bottom"
				},
				open: function( event, ui ) {
					ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
				}
			});
		});
		
		$(".ui-spinner-input").change(function(){
			var year = $("#year").val();
			var month = $("#month").val();
			var from = new Date(year,month-1,1);
			var to = new Date(year,month,0);
			var myData = {"from":from,"to":to};
			$("#table").html("<i class='icon-spinner icon-spin orange' style='font-size: 500%;position: absolute;left: 50%;top: 200%;'></i>");
			$.ajax({  
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }guideTimeManage/initialize",
		        data:myData,
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	$("#table").html("");
		        	$.each(data,function(){
		        		$("#table").append("<tr id='guideId"+this.guideId+"'>"+
		        								"<td>"+
		        									this.realName+
		        								"</td>"+
		        								"<td class='calendar'></td>"+
		        								/* "<td>"+
		        								"<a class='green' id='add' href='#addModel' role='button' data-toggle='modal' title='手动派团'>"+
													"<i class='icon-plus bigger-130'></i>"+
												"</a>"+
	        								"</td>"+ */
		        							"</tr>");
		        		var info = $("#guideId"+this.guideId).children("td").eq(1);
		        		for (var int = 1; int <= days; int++) {
							info.append("<a href='#addModel' data-toggle='modal'>"+int+"</a>");
						}
		        		var index = 0;
		        		$.each(this.tourInfo,function(tourNo,tourInfo){
		        			var start = new Date(tourInfo.startTime);
		        			var end = new Date(tourInfo.endTime);
		        			var startTime = start.getDate();
		        			var endTime = end.getDate();
		        			if(start.getMonth()+1<$("#month").val()){
		        				startTime = 1;
		        			}
		        			if(end.getMonth()+1>$("#month").val()){
		        				endTime=to.getDate();
		        			}
		        			
		        			for (var int2 = startTime-1; int2 < endTime; int2++) {
		        				info.children("a").eq(int2).attr({"style":"background-color: "+color[index]+";","title":tourNo,"class":"tourInfo","data-toggle":"modal","href":"#editModel","id":"gt"+tourInfo.id});
							}
		        			index++;
		        			if(index>=color.length){
		        				index=0;
		        			}
		        		});
		        	});
		        	$(".tourInfo").tooltip({
        				show: null,
        				position: {
        					my: "left top",
        					at: "left bottom"
        				},
        				open: function( event, ui ) {
        					ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
        				}
        			});
		        }  
			});
		});
	/* 新增 */		
		$("#table").delegate("a:not(.tourInfo)","click",function(){
			var guideId = $(this).parents("tr").attr("id").substring(7);
			$(".pull-right").attr("name",guideId);
			$("#startTime").val($("#year").val()+"/"+$("#month").val()+"/"+$(this).text());
		});
	
	/* 保存 */
		$("#saveNew").click(function(){
			var inputs = $(".modal-content").find("input");
			var startTime = new Date(inputs.eq(0).val());
			var endTime = new Date(inputs.eq(1).val());
			var remark = inputs.eq(2).val();
			var guideId = $(this).attr("name");
			var guideTime = {guideId:guideId,startTime:startTime,endTime:endTime,remark:remark};
			var myData = JSON.stringify(guideTime);
			$.ajax({  
		        type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }guideTimeManage/save",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	if(!data){
		        		alert("添加失败，请检查输入日期是否正确");
		        	}else{
		        		$("#table").html("<i class='icon-spinner icon-spin orange' style='font-size: 500%;position: absolute;left: 50%;top: 200%;'></i>");
		        		window.location.reload();
		        		/* var start = startTime.getDate();
		        		var end = endTime.getDate();
		        		if(startTime.getMonth()+1<date.getMonth()+1){
		        			start=0;
		        		}
		        		if(endTime.getMonth()+1>date.getMonth()+1){
		        			endTime=to.getDate();
		        		}
		        		var info = $("#guideId"+guideId).children("td").eq(1);
		        		for (var int = start; int < end; int++) {
		        			info.children("a").eq(int).attr({"style":"background-color:gold;","title":remark,"class":"tourInfo"});
						}
		        		$(".tourInfo").tooltip({
	        				show: null,
	        				position: {
	        					my: "left top",
	        					at: "left bottom"
	        				},
	        				open: function( event, ui ) {
	        					ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
	        				}
	        			}); */
		        	}
		        }  
			}); 
		});
	/* 编辑 */
		var entity;
		$("#table").delegate(".tourInfo","click",function(){
			var id = $(this).attr("id").substring(2);
			var myData = {id:id};
			$.ajax({
				type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }guideTimeManage/find",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	$("#editModel").find("input").eq(0).val(data.startTime);
		        	$("#editModel").find("input").eq(1).val(data.endTime);
		        	$("#editModel").find("input").eq(2).val(data.remark);
		        	entity = data;
		        }  
			});
		});
	/* 更新 */
		$("#saveEdit").click(function(){
			entity.startTime = new Date($("#editModel").find("input").eq(0).val());
			entity.endTime = new Date($("#editModel").find("input").eq(1).val());
			entity.remark = $("#editModel").find("input").eq(2).val();
			var myData = JSON.stringify(entity);
        	$.ajax({
        		type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }guideTimeManage/update",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	if(!data){
		        		alert("修改失败，请检查输入日期是否正确");
		        	}else{
		        		$("#table").html("<i class='icon-spinner icon-spin orange' style='font-size: 500%;position: absolute;left: 50%;top: 200%;'></i>");
		        		window.location.reload();
		        	}
		        }  
        	});
		});
	/* 编辑 */
		$("#table").delegate("#edit","click",function(){
			var obj = $(this);
			var td = obj.parents("td").siblings();
			var info = {id:td.eq(-1).children("a").attr("id"),
						supplierName:td.eq(2).text(),
						regionId:td.eq(3).children("span").text(),
						phone:td.eq(5).text(),
						supplierScopeIds:td.eq(4).find("span").text().split("")};
			td.eq(2).html("<input id='update' type='text' value='"+info.supplierName+"' style='width:150px' />");
			td.eq(3).html($("#select").html());
			td.eq(3).children("select").attr("class","width-20 chosen-select");
			td.eq(3).children("select").val(info.regionId);
			td.eq(4).html($("#multiple").html());
			td.eq(4).children("select").attr("class","width-20 chosen-select");
			td.eq(4).children("select").val(info.supplierScopeIds);
			$(".chosen-select").chosen({no_results_text: "查无结果", search_contains: true});
			td.eq(3).find("select").next().attr("style","width:150px;");
			td.eq(4).find("input").attr("style","height:25px;");
			td.eq(5).html("<input id='update' type='text' value='"+info.phone+"' style='width:150px' />");
			obj.html("<i class='icon-save bigger-130'></i>").attr({"id":"save","class":"grey"});
		});
	/*回车更新 */		
		$("#table").delegate("#update","keydown",function(event){
			if(event.keyCode==13){
				var obj = $(this).parents("tr");
				var td = $(this).parents("td").siblings();
				var params = $(this).parents("tr").find("input");
		 		var supplierName = params.eq(1).val();
				var id = obj.find(".red").attr("id");
				var regionId = obj.find("select").val();
				var regionName = obj.find("select").eq(0).find("option:selected").text();
				var supplierScopeIds =obj.find("select").eq(1).val().toString();
				var supplierScopeName = obj.find("select").eq(1).find("option:selected").text();
				var phone = td.eq(5).children("input").val();
				var supplier = {id:id,supplierName:supplierName,regionId:regionId,phone:phone};
				var myData = JSON.stringify(supplier);
				var supplierId = id;
				$.ajax({  
			        type: "POST",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }supplierInfoManage/update",  
			        data:myData,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	td.eq(2).parent().html(supplierName);
			        	td.eq(3).html(regionName+"<span hidden=''>"+regionId+"</span>");
			        	td.eq(4).html(supplierScopeName+"<span hidden=''>"+supplierScopeIds+"</span>");
			        	td.eq(5).html(phone);
			        }  
				 }); 
				var ids = {supplierId:supplierId,supplierScopeIds:supplierScopeIds};
			  	$.ajax({  
			        type: "GET",  
			        contentType:"application/json;charset=utf-8",  
			        url:"${path }supplierBusiness/update",  
			        data:ids,  
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	
			        }  
				});
				obj.find("a").eq(0).html("<i class='icon-pencil bigger-130'></i>").attr({"id":"edit","class":"green"});
				obj.next().find("input").eq(1).focus().select();
			}
		});
		/* 按钮更新 */
		$("#table").delegate("#save","click",function(){
			var obj = $(this).parents("tr");
			var td = $(this).parents("td").siblings();
			var params = $(this).parents("tr").find("input");
	 		var supplierName = params.eq(1).val();
			var id = obj.find(".red").attr("id");
			var regionId = obj.find("select").val();
			var regionName = obj.find("select").eq(0).find("option:selected").text();
			var supplierScopeIds =obj.find("select").eq(1).val().toString();
			var supplierScopeName = obj.find("select").eq(1).find("option:selected").text();
			var phone = td.eq(5).children("input").val();
			var supplier = {id:id,supplierName:supplierName,regionId:regionId,phone:phone};
			var myData = JSON.stringify(supplier);
			var supplierId = id;
			$.ajax({  
		        type: "POST",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }supplierInfoManage/update",  
		        data:myData,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	td.eq(2).html(supplierName);
		        	td.eq(3).html(regionName+"<span hidden=''>"+regionId+"</span>");
		        	td.eq(4).html(supplierScopeName+"<span hidden=''>"+supplierScopeIds+"</span>");
		        	td.eq(5).html(phone);
		        }  
			 }); 
			var ids = {supplierId:supplierId,supplierScopeIds:supplierScopeIds};
		  	$.ajax({  
		        type: "GET",  
		        contentType:"application/json;charset=utf-8",  
		        url:"${path }supplierBusiness/update",  
		        data:ids,  
		        dataType: "json",  
		        async: false,  
		        success:function(data){
		        	
		        }  
			});
			obj.find("a").eq(0).html("<i class='icon-pencil bigger-130'></i>").attr({"id":"edit","class":"green"});
			obj.next().find("input").eq(1).focus().select();
		});
		
	});
	function getDays(Year,Month){
	    Month--;
	    var d = new Date(Year,Month,1);
	    d.setDate(d.getDate()+32-d.getDate());
	    return (32-d.getDate());
	}
	
</script>
