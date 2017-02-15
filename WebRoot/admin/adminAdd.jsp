<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
	<head>
		<title>Efood后天管理员添加</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.main.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.grey.css" class="skin-color" />	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
	<body>
		<jsp:include page="/admin/optionsBar.jsp"/>
		<div id="content">
			<div id="content-header">
				<h1>管理员</h1>
			</div>
			<div id="breadcrumb">
				<a href="<%=path%>/admin/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
				<a href="#">管理员模块</a>
				<a href="#" class="current">添加管理员用户</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-pencil"></i>
								</span>
								<h5>添加管理员用户</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="form-wizard" class="form-horizontal" action="addAdmin" method="post">
									<div id="form-wizard-1" class="step">
										<div class="control-group">
											<label class="control-label">账号</label>
											<div class="controls">
												<input name="admin.adminname" type="text" />
											</div>
										</div>
											<div class="control-group">
											<label class="control-label">密码</label>
											<div class="controls">
												<input name="admin.password" type="password"  />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">联系电话</label>
											<div class="controls">
												<input name="admin.telephone" type="text"  />
											</div>
										</div>
									</div>
									<div class="form-actions">
											<!-- <input id="back" class="btn btn-primary" type="reset" value="返回" /> -->
											<input id="next" class="btn btn-primary" type="submit" value="提交" />
											<div id="status"></div>
									</div>
									<div id="submitted"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
					<div id="footer" class="span12">
						2016 &copy; TuLv. Hubei Engineering University
					</div>
				</div>
		</div>
            <script src="<%=path%>/admin/js/jquery.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.ui.custom.js"></script>
            <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.validate.js"></script>
            <script src="<%=path%>/admin/js/jquery.wizard.js"></script>
            <script src="<%=path%>/admin/js/unicorn.js"></script>
            <script src="<%=path%>/admin/js/unicorn.wizard.js"></script>
	</body>
</html>
