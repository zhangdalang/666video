<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="shiro-ex" tagdir="/WEB-INF/tags" %>
<%@ page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="com.cts.localtour.entity.UserTable" language="java"%>
<% UserTable user = (UserTable)SecurityUtils.getSubject().getPrincipal();
	request.setAttribute("path", request.getContextPath()+"/");
%>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<!-- <div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div> --><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
					
						<shiro:hasPermission name="operatingStatus:manage">
							<li id="operatingStatus">
								<a href="${path }operatingStatus">
									<i class="icon-dashboard"></i>
									<span class="menu-text"> 经营状况 </span>
								</a>
							</li>
						</shiro:hasPermission>
						
						<shiro-ex:hasAnyPermissions name="toDoReimbursement:manage or toDoBill:manage">
							<li id="toDoManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-suitcase"></i>
									<span class="menu-text"> 待办事项</span>
									<b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<shiro:hasPermission name="toDoReimbursement:manage">
										<li id="toDoReimbursementApplication">
											<a href="${path }toDoReimbursement">
												<i class="icon-double-angle-right"></i>
												报账审核
											</a>
										</li>
									</shiro:hasPermission>
									<shiro:hasPermission name="toDoBill:manage">
										<li id="toDoBillApplication">
											<a href="${path }toDoBill">
												<i class="icon-double-angle-right"></i>
												供应商付款审核
											</a>
										</li>
									</shiro:hasPermission>
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>
						
						<shiro-ex:hasAnyPermissions name="localTour:manage or billCheck:manage">
							<li id="gourpManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-flag"></i>
									<span class="menu-text"> 团队管理 </span>
									<b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<shiro:hasPermission name="localTour:manage">
										<li id="localTourManage">
											<a href="${path }localTourManage">
												<i class="icon-double-angle-right"></i>
												${sessionScope.isMice?"会展系统":"地接系统"}
											</a>
										</li>
									</shiro:hasPermission>
									<shiro:hasPermission name="billCheck:manage">
										<li id="billCheckManage">
											<a href="${path }billCheckManage">
												<i class="icon-double-angle-right"></i>
												签单管理
											</a>
										</li>
									</shiro:hasPermission>	
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>
						
						<shiro-ex:hasAnyPermissions name="guideTime:manage or guide:manage">
							<li id="guideManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-github-alt"></i>
									<span class="menu-text"> 导游管理 </span>
	
									<b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<shiro:hasPermission name="guideTime:manage">
										<li id="guideTimeManage">
											<a href="${path }guideTimeManage">
												<i class="icon-double-angle-right"></i>
												导游排团表
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="guide:manage">
										<li id="guideManager">
											<a href="${path }guideManage">
												<i class="icon-double-angle-right"></i>
												导游管理
											</a>
										</li>
									</shiro:hasPermission>
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>
						
						<shiro-ex:hasAnyPermissions name="pay:manage or revenue:manage or balance:manage or settlement:manage or bill:manage">
							<li id="financeManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-desktop"></i>
									<span class="menu-text"> 财务管理</span>
	
									<b class="arrow icon-angle-down"></b>
								</a>
								
								<ul class="submenu">
									<shiro:hasPermission name="pay:manage">
										<li id="payManage">
											<a href="${path }payManage">
												<i class="icon-double-angle-right"></i>
												付款管理
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="revenue:manage">
										<li id="revenueManage">
											<a href="${path }revenueManage">
												<i class="icon-double-angle-right"></i>
												收款管理
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="balance:manage">
										<li id="balanceManage">
											<a href="${path }balanceManage">
												<i class="icon-double-angle-right"></i>
												核销管理
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="settlement:manage">
										<li id="settlementManage">
											<a href="${path }settlementManage">
												<i class="icon-double-angle-right"></i>
												结算管理
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="bill:manage">
										<li id="billManage">
											<a href="${path }billManage">
												<i class="icon-double-angle-right"></i>
												挂账管理
											</a>
										</li>
									</shiro:hasPermission>
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>
						
						<shiro-ex:hasAnyPermissions name="customerAgency:manage or customer:manage">
							<li id="customerManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-group"></i>
									<span class="menu-text"> 客户管理 </span>
	
									<b class="arrow icon-angle-down"></b>
								</a>
	
								<ul class="submenu">
									<shiro:hasPermission name="customerAgency:manage">
										<li id="customerAgencyManage">
											<a href="${path }customerAgencyManage">
												<i class="icon-double-angle-right"></i>
												组团社管理
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="customer:manage">
										<li>
											<a href="${path }customerManage">
												<i class="icon-double-angle-right"></i>
												个人客户
											</a>
										</li>
									</shiro:hasPermission>
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>
						
						<shiro-ex:hasAnyPermissions name="supplierInfo:manage">
							<li id="supplierManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-edit"></i>
									<span class="menu-text"> 供应商管理 </span>
	
									<b class="arrow icon-angle-down"></b>
								</a>
	
								<ul class="submenu">
									<shiro:hasPermission name="supplierInfo:manage">
										<li id="supplierInfoManage">
											<a href="${path }supplierInfoManage">
												<i class="icon-double-angle-right"></i>
												供应商信息管理
											</a>
										</li>
									</shiro:hasPermission>
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>
						
							<li id="statisticalAnalysis">
								<a href="#" class="dropdown-toggle">
									<i class="icon-bar-chart"></i>
									<span class="menu-text"> 统计分析 </span>
	
									<b class="arrow icon-angle-down"></b>
								</a>
	
								<ul class="submenu">
									<li id="tourDetails">
										<a href="${path }tourDetails">
											<i class="icon-double-angle-right"></i>
											台账统计
										</a>
									</li>
									<li id="deptGains">
										<a href="${path }deptGains">
											<i class="icon-double-angle-right"></i>
											部门盈利统计
										</a>
									</li>
									<li id="supplierGains">
										<a href="${path }supplierGains">
											<i class="icon-double-angle-right"></i>
											供应商使用分析
										</a>
									</li>
								</ul>
							</li>
						
						<shiro-ex:hasAnyPermissions name="businessType:manage or tourType:manage or visitorType:manage or region:manage or supplier:manage or content:manage">
							<li id="dataManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-list-alt"></i>
									<span class="menu-text"> 数据管理 </span>
									<b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<shiro:hasPermission name="businessType:manage">
										<li id="businessTypeManage">
											<a href="${path }businessTypeManage">
												<i class="icon-double-angle-right"></i>
												业务类型
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="tourType:manage">
										<li id="tourTypeManage">
											<a href="${path }tourTypeManage">
												<i class="icon-double-angle-right"></i>
												团队类型
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="visitorType:manage">
										<li id="visitorTypeManage">
											<a href="${path }visitorTypeManage">
												<i class="icon-double-angle-right"></i>
												游客类型
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="region:manage">
										<li id="regionManage">
											<a href="${path }regionManage">
												<i class="icon-double-angle-right"></i>
												国家地区
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="supplier:manage">
										<li id="supplierScopeManage">
											<a href="${path }supplierScopeManage">
												<i class="icon-double-angle-right"></i>
												供应范围
											</a>
										</li>
									</shiro:hasPermission>
									
									<shiro:hasPermission name="content:manage">
										<li id="contentManage">
											<a href="${path }contentManage">
												<i class="icon-double-angle-right"></i>
												供应内容
											</a>
										</li>
									</shiro:hasPermission>
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>
						
						<shiro-ex:hasAnyPermissions name="user:manage or dept:manage or deptStructure:manage or role:manage">
							<li id="systemManage">
								<a href="#" class="dropdown-toggle">
									<i class="icon-cog"></i>
									<span class="menu-text"> 系统管理 </span>
									<b class="arrow icon-angle-down"></b>
								</a>
								<ul class="submenu">
									<shiro:hasPermission name="user:manage">
										<li id="userManage">
											<a href="${path }userManage">
												<i class="icon-double-angle-right"></i>
												用户管理
											</a>
										</li>
									</shiro:hasPermission>
									<shiro:hasPermission name="role:manage">
										<li id="roleManage">
											<a href="${path }roleManage">
												<i class="icon-double-angle-right"></i>
												角色管理
											</a>
										</li>
									</shiro:hasPermission>
									<shiro:hasPermission name="dept:manage">
										<li id="deptManage">
											<a href="${path }deptManage">
												<i class="icon-double-angle-right"></i>
												部门管理
											</a>
										</li>
									</shiro:hasPermission>
									<shiro:hasPermission name="deptStructure:manage">
										<li id="deptStructure">
											<a href="${path }deptStructure">
												<i class="icon-double-angle-right"></i>
												组织架构
											</a>
										</li>
									</shiro:hasPermission>
								</ul>
							</li>
						</shiro-ex:hasAnyPermissions>

					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
