<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
	<head>
		<title>Efood后台</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/fullcalendar.css" />	
		<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.main.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.grey.css" class="skin-color" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
	<body>
		<jsp:include page="/admin/optionsBar.jsp" />
		<div id="style-switcher">
			<i class="icon-arrow-left icon-white"></i>
			<span>Style:</span>
			<a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
			<a href="#blue" style="background-color: #2D2F57;"></a>
			<a href="#red" style="background-color: #673232;"></a>
		</div>
		<div id="content">
			<div id="content-header">
				<h1>主页</h1>
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
				
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="alert alert-info">
							欢迎来的 <strong>Efood</strong>后台管理界面！
							<a href="#" data-dismiss="alert" class="close">×</a>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div id="footer" class="span12">
						2016 &copy; TuLv. Hubei Engineering University
					</div>
				</div>
			</div>
		</div>
            <script src="<%=path%>/admin/js/excanvas.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.ui.custom.js"></script>
            <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.flot.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.flot.resize.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.peity.min.js"></script>
            <script src="<%=path%>/admin/js/fullcalendar.min.js"></script>
            <script src="<%=path%>/admin/js/unicorn.js"></script>
            <script src="<%=path%>/admin/js/unicorn.dashboard.js"></script>
	</body>
</html>
