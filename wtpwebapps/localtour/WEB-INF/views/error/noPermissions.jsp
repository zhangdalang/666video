<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../../../resources/include/header.jsp"></jsp:include>
<jsp:include page="../../../resources/include/pageSettings.jsp"></jsp:include>
<jsp:include page="../../../resources/include/sider.jsp"></jsp:include>

<div class="main-content">

					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="error-container">
									<div class="well">
										<h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="icon-random"></i>
												错误！
											</span>
											对不起，您没有权限这么做。
										</h1>

										<hr>
										<h3 class="lighter smaller">
											我们或许会尝试修复这项功能
											<i class="icon-wrench icon-animated-wrench bigger-125"></i>
											
										</h3>
										<span class="red" style="margin-top: 25px;">错误信息：${errorMsg }</span>
										<div class="space"></div>

										<div>
											<h4 class="lighter smaller">您可以尝试 ：</h4>

											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li>
													<i class="icon-hand-right blue"></i>
													阅读说明手册
												</li>

												<li>
													<i class="icon-hand-right blue"></i>
													给我们更多的信息，关于这个具体的错误是如何发生的!
												</li>
											</ul>
										</div>

										<hr>
										<div class="space"></div>

										<div class="center">
											<a href="#" class="btn btn-grey">
												<i class="icon-arrow-left"></i>
												Go Back
											</a>

											<a href="#" class="btn btn-primary">
												<i class="icon-dashboard"></i>
												Dashboard
											</a>
										</div>
									</div>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
				
<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<!-- Required Javascript -->
<!-- page specific plugin scripts -->
	<!-- script src="${path }resources/assets/js/fuelux/data/fuelux.tree-sampledata.js"></script> -->
	
	
	<!-- inline scripts related to this page -->

		<script type="text/javascript">
		$(function(){
			/* 初始化 */
					$("#operatingStatus").addClass("active");
		});
		/**
		$('#tree1').on('loaded', function (evt, data) {
		});

		$('#tree1').on('opened', function (evt, data) {
		});

		$('#tree1').on('closed', function (evt, data) {
		});

		$('#tree1').on('selected', function (evt, data) {
		});
		**/
		
		</script>
