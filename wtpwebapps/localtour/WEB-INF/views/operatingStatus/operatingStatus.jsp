<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	String path = request.getContextPath()+"/";
%>
<jsp:include page="../../../resources/include/header.jsp"></jsp:include>
<jsp:include page="../../../resources/include/pageSettings.jsp"></jsp:include>
<jsp:include page="../../../resources/include/sider.jsp"></jsp:include>

	<div class="main-content">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>

			<ul class="breadcrumb">
				<li>
					<i class="icon-globe"></i>
					<a href="#">经营状况</a>
				</li>
			</ul><!-- .breadcrumb -->

			<div class="nav-search" id="nav-search">
				<form class="form-search">
					<span class="input-icon">
						<input placeholder="搜索 ..." class="nav-search-input" id="nav-search-input" autocomplete="off" type="text">
						<i class="icon-search nav-search-icon"></i>
					</span>
				</form>
			</div><!-- #nav-search -->
		</div>
		
		<div class="page-content">
		<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid"><table aria-describedby="sample-table-2_info" id="sample-table-2" class="table table-striped table-bordered table-hover dataTable">
						<!-- <div class="page-header align-right">
								<small>
									<i class="icon-double-angle-right"></i>
									
								</small>
						</div>/.page-header -->
						<div class="row">
							<div class="col-xs-12">
							<ul class="nav nav-tabs" id="myTab">
								<li class="active">
									<a data-toggle="tab" href="#stat">
										<i class="green icon-signal bigger-110"></i>
										系统使用情况
									</a>
								</li>
								
								<li class="">
									<a data-toggle="tab" href="#notification">
										<i class="red icon-comment bigger-110"></i>
										通知系统
									</a>
								</li>
								
								<li class="">
									<a data-toggle="tab" href="#calendar">
										<i class="blue icon-calendar bigger-110"></i>
										日历
									</a>
								</li>
							</ul>
							<div class="space"></div>
							
							<div class="tab-content no-border no-padding">
								<!--业务统计板块  -->
								<div id="stat" class="tab-pane active">
									<div class="col-sm-12">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-flat">
												<h4 class="lighter">
													<i class="icon-signal"></i>
													团控做团数量（每日24点更新）
												</h4>
												<div class="widget-toolbar">
													<a href="#" data-action="collapse">
														<i class="icon-chevron-up"></i>
													</a>
												</div>
											</div>
	
											<div class="widget-body">
												<div class="widget-main padding-4">
													<div id="tourCount">
													
													</div>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
										<div class="widget-box transparent">
											<div class="widget-header widget-header-flat">
												<h4 class="lighter">
													<i class="icon-signal"></i>
													团队待操作状态（每日24点更新）
												</h4>
												<div class="widget-toolbar">
													<a href="#" data-action="collapse">
														<i class="icon-chevron-up"></i>
													</a>
												</div>
											</div>
	
											<div class="widget-body">
												<div class="widget-main padding-4">
													<div id="tourState">
													</div>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div>	
								</div>
								<!--业务统计结束  -->

								<!--部门通知板块  -->
								<div id="notification" class="tab-pane">
									<div class="col-sm-12">
								<div class="widget-box ">
									<div class="widget-header">
										<h4 class="lighter smaller">
											<i class="icon-comment blue"></i>
											部门会话
										</h4>
									</div>

									<div class="widget-body">
										<div class="widget-main no-padding">
											<div class="dialogs">
												<div class="itemdiv dialogdiv">
													<div class="user">
														<img alt="Alexa's Avatar" src="assets/avatars/avatar1.png">
													</div>

													<div class="body">
														<div class="time">
															<i class="icon-time"></i>
															<span class="green">4秒钟前</span>
														</div>

														<div class="name">
															<a href="#">Alexa</a>
														</div>
														<div class="text">大家好啊</div>

														<div class="tools">
															<a href="#" class="btn btn-minier btn-info">
																<i class="icon-only icon-share-alt"></i>
															</a>
														</div>
													</div>
												</div>

												<div class="itemdiv dialogdiv">
													<div class="user">
														<img alt="John's Avatar" src="assets/avatars/avatar.png">
													</div>

													<div class="body">
														<div class="time">
															<i class="icon-time"></i>
															<span class="blue">38秒以前</span>
														</div>

														<div class="name">
															<a href="#">John</a>
														</div>
														<div class="text">框架很好用嘛</div>

														<div class="tools">
															<a href="#" class="btn btn-minier btn-info">
																<i class="icon-only icon-share-alt"></i>
															</a>
														</div>
													</div>
												</div>

												<div class="itemdiv dialogdiv">
													<div class="user">
														<img alt="Bob's Avatar" src="assets/avatars/user.jpg">
													</div>

													<div class="body">
														<div class="time">
															<i class="icon-time"></i>
															<span class="orange">2分钟以前</span>
														</div>

														<div class="name">
															<a href="#">Bob</a>
															<span class="label label-info arrowed arrowed-in-right">admin</span>
														</div>
														<div class="text">欢迎大家使用ACE后台管理系统.</div>

														<div class="tools">
															<a href="#" class="btn btn-minier btn-info">
																<i class="icon-only icon-share-alt"></i>
															</a>
														</div>
													</div>
												</div>

												<div class="itemdiv dialogdiv">
													<div class="user">
														<img alt="Jim's Avatar" src="assets/avatars/avatar4.png">
													</div>

													<div class="body">
														<div class="time">
															<i class="icon-time"></i>
															<span class="grey">3分钟以前</span>
														</div>

														<div class="name">
															<a href="#">Jim</a>
														</div>
														<div class="text">大家多提提BUG</div>

														<div class="tools">
															<a href="#" class="btn btn-minier btn-info">
																<i class="icon-only icon-share-alt"></i>
															</a>
														</div>
													</div>
												</div>

												<div class="itemdiv dialogdiv">
													<div class="user">
														<img alt="Alexa's Avatar" src="assets/avatars/avatar1.png">
													</div>

													<div class="body">
														<div class="time">
															<i class="icon-time"></i>
															<span class="green">4分钟以前</span>
														</div>

														<div class="name">
															<a href="#">Alexa</a>
														</div>
														<div class="text">继续支持ACE后台系统</div>

														<div class="tools">
															<a href="#" class="btn btn-minier btn-info">
																<i class="icon-only icon-share-alt"></i>
															</a>
														</div>
													</div>
												</div>
											</div>

											<form>
												<div class="form-actions">
													<div class="input-group">
														<input placeholder="Type your message here ..." type="text" class="form-control" name="message">
														<span class="input-group-btn">
															<button class="btn btn-sm btn-info no-radius" type="button">
																<i class="icon-share-alt"></i>
																发送
															</button>
														</span>
													</div>
												</div>
											</form>
										</div><!-- /widget-main -->
									</div><!-- /widget-body -->
								</div><!-- /widget-box -->
							</div>
								</div>
							</div>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				</div>
				</div>
				
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<!-- Required Javascript -->
<!-- page specific plugin scripts -->
	<!-- 图表组件 -->
	<script src="${path }resources/assets/js/jscharts.js"></script>
	<!-- inline scripts related to this page -->

	<script type="text/javascript">
	$(function(){
		/* 初始化 */
		$("#operatingStatus").addClass("active");
		/* 使用状况 */
		$.ajax({
	        type: "GET",  
	        contentType:"application/json;charset=utf-8",  
	        url:"${path }operatingStatus/getAllSysUsage",
	        async: false,  
	        success:function(data){
	        	/* 团队数量 */
	        	var displayCount = 20;/* 显示个数 */
	        	var tourCount = new Array();
				$.each(data,function(index){
					if(index==displayCount){
						return false;
					}
					tourCount.push([this.userRealName,this.tourCount]);
				});
				
				/* 排序规则 */
				function order(a,b){
					return b[1] - a[1];
				}
				tourCount = tourCount.sort(order);
				if(tourCount.length<displayCount){
					for (var int = tourCount.length; int < 30; int++) {
						tourCount.push(["",0]);
					}
				}
				
				var tourCountChart = new JSChart('tourCount', 'bar');  
				tourCountChart.setDataArray(tourCount);
				tourCountChart.setAxisNameX("姓名");
				tourCountChart.setAxisNameY("团数");
				tourCountChart.setSize($("#tourCount").width(),300);
				var time = new Date().getTime();
			    var lastMonth = new Date(time - 90*24*60*60*1000);
			    var nextMonth = new Date(time + 90*24*60*60*1000);
				tourCountChart.setTitle(lastMonth.getFullYear()+"年"+(lastMonth.getMonth()+1)+"月 至 "+nextMonth.getFullYear()+"年"+(nextMonth.getMonth()+1)+"月 出发团队");
				tourCountChart.draw();  
				
				/* 团队状态 */
				var tourState = [["团控新建",0],["待经理审批",0],["待财务借款",0],["待团控借款（待进行）",0],["进行中团队",0],["待团控申请结算",0],["待团控报账",0],["待经理审核报账",0],["待财务核销",0],["待财务结算",0]];
				$.each(data,function(index){
					tourState[0][1] = tourState[0][1]+this.createCount;
					tourState[1][1] = tourState[1][1]+this.auditingCount;
					tourState[2][1] = tourState[2][1]+this.financeCount;
					tourState[3][1] = tourState[3][1]+this.canLendCount;
					tourState[4][1] = tourState[4][1]+this.ongoingCount;
					tourState[5][1] = tourState[5][1]+this.finishCount;
					tourState[6][1] = tourState[6][1]+this.balanceCount;
					tourState[7][1] = tourState[7][1]+this.reimbursementCount;
					tourState[8][1] = tourState[8][1]+this.verificationCount;
					tourState[9][1] = tourState[9][1]+this.settlementCount;
				});
				var tourCountChart = new JSChart('tourState', 'bar');  
				tourCountChart.setDataArray(tourState);
				tourCountChart.setAxisNameX("状态");
				tourCountChart.setAxisNameY("团数");
				tourCountChart.setSize($("#tourState").width(),300);
				tourCountChart.setTitle(lastMonth.getFullYear()+"年"+(lastMonth.getMonth()+1)+"月 至 "+nextMonth.getFullYear()+"年"+(nextMonth.getMonth()+1)+"月 出发团队");
				tourCountChart.draw();  
	        }
		});
	});
	</script>
