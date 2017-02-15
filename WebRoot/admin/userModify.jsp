<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Efood用户信息修改</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="<%=path%>/admin/css/colorpicker.css" />
        <link rel="stylesheet" href="<%=path%>/admin/css/datepicker.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/uniform.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/select2.css" />		
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
				<a href="#" class="tip-bottom">用户模块</a>
				<a href="#" class="current">用户信息修改</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>用户信息修改</h5>
							</div>
							<div class="widget-content nopadding">
								<form action="modifyUser" method="post" class="form-horizontal">
									<div class="control-group">
										<label class="control-label">账号</label>
										<div class="controls">
											<input type="text" value="${request.user.username}" name="user.username"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">密码</label>
										<div class="controls">
											<input type="password" value="${request.user.password}" name="user.password"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">email</label>
										<div class="controls">
											<input type="text" value="${request.user.email}"placeholder="email" name="user.email"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">联系电话</label>
										<div class="controls">
											<input type="text" value="${request.user.telephone}" placeholder="联系电话." name="user.telephone"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">地址</label>
										<div class="controls">
											<input type="text" value="${request.user.address}" placeholder="地址" name="user.address"/>
										</div>
									</div>
									<input type="hidden" value="${request.user.id }" name="user.id"/>
								<%-- 	<input type="hidden" value="${request.a.level }" name="administrator.level"/> --%>
									<div class="form-actions">
										<button type="submit" class="btn btn-primary">保存</button>
									</div>
								</form>
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
		</div>
            <script src="<%=path%>/admin/js/jquery.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.ui.custom.js"></script>
            <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
            <script src="<%=path%>/admin/js/bootstrap-colorpicker.js"></script>
            <script src="<%=path%>/admin/js/bootstrap-datepicker.js"></script>
            <script src="<%=path%>/admin/js/jquery.uniform.js"></script>
            <script src="<%=path%>/admin/js/select2.min.js"></script>
            <script src="<%=path%>/admin/js/unicorn.js"></script>
            <script src="<%=path%>/admin/js/unicorn.form_common.js"></script>
	</body>
</html>
