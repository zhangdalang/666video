<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
					<a href="#">部门结构</a>
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
								<!-- PAGE CONTENT BEGINS -->

								<div class="row">
									<div class="col-sm-12">
										<div class="widget-box">
											<div class="widget-header header-color-blue2">
												<h4 class="lighter smaller">部门结构图</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-8">
													
													<div id="treeview" class="tree tree-selectable">
													<c:forEach var="dept" items="${depts }" varStatus="status">
													  <c:if test="${dept.upperDeptId==null }">
														<div class="tree-folder" style="display:block;">
															<div class="tree-folder-header" value="${dept.id }" expand="1">
																<i class ="icon-plus"></i>
																<div class="tree-folder-name">${dept.deptName }</div>
															</div>
															<div class="tree-folder-content" id="content${dept.id }"></div>
														</div>
													  </c:if>
													</c:forEach>
												</div>
											</div>
										</div>
										
									</div>
									<button class="btn btn-sm btn-info btn-view" data-toggle="modal" data-target="#userModal">
										查看
										<i class="icon-print"></i>
									</button>
									<button class="btn btn-sm btn-danger btn-del" disabled="true">
										停用
										<i class="icon-bolt"></i>
									</button>
										
								</div>
							

								<script type="text/javascript">
									var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
								</script>
								
								
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				</div>
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="userModal" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				            	姓名
				            </h4>
				         </div>
				         <div class="modal-body">
				          		 <div class="profile-user-info profile-user-info-striped">
												<div class="profile-info-row">
													<div class="profile-info-name"> 所在部门 </div>

													<div class="profile-info-value">
														<span id="deptSpan">部门</span>
													</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name"> 职务 </div>

													<div class="profile-info-value">
														<span id="positionSpan">职务</span>
													</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name"> 电话 </div>

													<div class="profile-info-value">
														<span id="telSpan">电话</span>
													</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name"> qq号 </div>

													<div class="profile-info-value">
														<span id="qqSpan">qq号</span>
													</div>
												</div>
											</div>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				         </div>
				      </div><!-- /.modal-content -->
				</div><!-- /.modal -->


<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
<!-- Required Javascript -->
<!-- page specific plugin scripts -->
	<!-- script src="${path }resources/assets/js/fuelux/data/fuelux.tree-sampledata.js"></script> -->
	<script src="${path }resources/assets/js/fuelux/fuelux.tree.min.js"></script>
	
	<!-- inline scripts related to this page -->

		<script type="text/javascript">
		$(function(){
			/* 初始化 */
					$(".nav-list").children("li").attr('class','');
					$("#systemManage").addClass("open");
					$("#systemManage").children("ul").attr("style","display:block");
					$("#deptStructure").addClass("active");
		});
		
		
		$(function(){
			$('.tree-folder').delegate(".tree-folder-header","click",function(){
				var val = $(this).attr("value");
				if ($(this).attr("expand")=="1"){
					$(this).find('i').attr("class","icon-minus");
					$(this).attr("expand","0");
					$.ajax({
				        type: "GET",  
				        contentType:"application/json;charset=utf-8", 
				        data:"deptId="+val,
				        url:"${path }deptStructure/getUserTree", 
				        dataType: "json",  
				        async: false,  
				        success:function(data){
				        	if(null!=data){
				        		for (var index = 0; index < data.length; index++) {
										$("#content"+val).append("<div class='tree-item' style='display:block' value='"+data[index].id+"' select='0'><i class='icon-remove'></i><div class='tree-item-name'>"+data[index].realName+"</div></div>");
								}
				        	}
				        }
				    }) 
				    $.ajax({
				        type: "GET",  
				        contentType:"application/json;charset=utf-8", 
				        data:"upperDeptId="+val,
				        url:"${path }deptStructure/getTree", 
				        dataType: "json",  
				        async: false,  
				        success:function(data){
				        	if(null!=data){
				        		for (var index = 0; index < data.length; index++) {
 									$("#content"+val).append("<div class='tree-folder' style='display:block;' ><div class='tree-folder-header' value='"+data[index].id+"' expand='1'><i class='icon-plus'></i><div class='tree-folder-name'>"+data[index].deptName+"</div></div><div class='tree-folder-content' id='content"+data[index].id+"'></div></div>");
								}
				        	}
				        	
				        }
				    }) 
				}
				else{
					$(this).find('i').attr("class","icon-plus");
					$(this).attr("expand","1");
					$("#content"+val).empty();
				}
			}).delegate(".tree-item","click",function(){
				var val = $(this).attr("value");
				if ($(this).attr("select")=="0"){
					$('.tree-selected').attr('class','tree-item').attr('select','0');
					$('.icon-ok').attr('class','icon-remove');
					$(this).attr("class","tree-item tree-selected");
					$(this).find('i').attr("class","icon-ok");
					$(this).attr("select","1");
				}
				else{
					$(this).attr("class","tree-item");
					$(this).find('i').attr("class","icon-remove");
					$(this).attr("select","0");
				}
			})
			
		});
		
		$(function(){
			$('.btn-view').click(function(){
				var val = $(".tree-selected").attr("value");
				$.ajax({
			        type: "GET",  
			        contentType:"application/json;charset=utf-8", 
			        data:"userId="+val,
			        url:"${path }deptStructure/getUserView", 
			        dataType: "json",  
			        async: false,  
			        success:function(data){
			        	if(null!=data){
			        		$(".modal-title").empty();
							$(".modal-title").append(data.userTable.realName);
							$("#deptSpan").empty();
							$("#deptSpan").append(data.deptName);
							$("#positionSpan").empty();
							$("#positionSpan").append(data.userTable.position);
							$("#telSpan").empty();
							$("#telSpan").append(data.userTable.phone);
							$("#qqSpan").empty();
							$("#qqSpan").append(data.userTable.qq);
			        	}
			        	
			        }
			    }) 
			})
		})
		
		

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
	

