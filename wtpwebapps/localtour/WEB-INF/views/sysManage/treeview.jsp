<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>机构树菜单树 - Bootstrap后台管理系统模版Ace下载</title>
		<meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
		<meta name="description" content="站长素材提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->
<% String path = request.getContextPath()+"/"; %>
		<link href="<%=path %>resources/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=path %>resources/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!-- ace styles -->

		<link rel="stylesheet" href="<%=path %>resources/assets/css/ace.min.css" />
		<link rel="stylesheet" href="<%=path %>resources/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=path %>resources/assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="<%=path %>resources/assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>

					
		<div class="row">
			<div class="col-sm-6">
				<div class="widget-box">
					<div class="widget-header header-color-blue2">
						<h4 class="lighter smaller">Choose Categories</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main padding-8">
							<div id="tree1" class="tree"></div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="widget-box">
					<div class="widget-header header-color-green2">
						<h4 class="lighter smaller">Browse Files</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main padding-8">
							<div id="tree2" class="tree"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
		</script>


		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script src="//apps.bdimg.com/libs/jquery/2.0.3/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=path %>resources/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=path %>resources/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=path %>resources/assets/js/bootstrap.min.js"></script>
		<script src="<%=path %>resources/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<script src="<%=path %>resources/assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
		<script src="<%=path %>resources/assets/js/fuelux/fuelux.tree.min.js"></script>

		<!-- ace scripts -->

		<script src="<%=path %>resources/assets/js/ace-elements.min.js"></script>
		<script src="<%=path %>resources/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($){

				$('#tree1').ace_tree({
					dataSource: treeDataSource ,
					multiSelect:false,
					loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
					'open-icon' : 'icon-ok',
					'close-icon' : 'icon-plus',
					'selectable' : true,
					'selected-icon' : 'icon-ok',
					'unselected-icon' : 'icon-check-empty'
				});

				$('#tree2').ace_tree({
					dataSource: treeDataSource2 ,
					loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
					'open-icon' : 'icon-folder-open',
					'close-icon' : 'icon-folder-close',
					'selectable' : false,
					'selected-icon' : null,
					'unselected-icon' : null
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
		*/
});
		</script>
	<div style="display:none"><script src='//v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
