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
		<title>Efood用户列表</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap-responsive.min.css" />
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
				<a href="#" class="current">用户列表</a>
			</div>
			<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-th"></i>
								</span>
								<h5>Static table</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>账号</th>
											<th>密码</th>
											<th>联系电话</th>
											<th>地址</th>
											<th>email</th>
										</tr>
									</thead>
									<tbody>
								<s:iterator value="#request.userList" id="ul">
										<tr>
											<td><s:property value="#ul.username"/></td>
											<td><s:property value="#ul.password"/></td>
											<td><s:property value="#ul.telephone"/></td>
											<td><s:property value="#ul.address"/></td>
											<td><s:property value="#ul.email"/></td>
											<td><a class="btn btn-primary" href="showUser?id=<s:property value="#ul.id"/>"><i class="icon-pencil icon-white"></i> 修改</a>
									<a class="btn btn-danger"  href="javascript:if(confirm('确实要删除该用户吗?'))location='deleteUser?id=<s:property value="#ul.id"/>'"><i class="icon-remove icon-white"></i> 删除</a></td>
										</tr>
									</s:iterator>
									</tbody>
								</table>							
							</div>
						</div>
					
		</div>
		<div class="row-fluid">
					<div id="footer" class="span12">
						2016 &copy; TuLv. Hubei Engineering University
					</div>
				</div>
            <script src="<%=path%>/admin/js/jquery.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.ui.custom.js"></script>
            <script src="<%=path%>/admin/js/bootstrap.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.uniform.js"></script>
            <script src="<%=path%>/admin/js/select2.min.js"></script>
            <script src="<%=path%>/admin/js/jquery.validate.js"></script>
            <script src="<%=path%>/admin/js/unicorn.js"></script>
            <script src="<%=path%>/admin/js/unicorn.form_validation.js"></script>
	</body>
</html>
