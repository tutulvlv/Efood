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
<title>Efood添加菜单分类</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/uniform.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/select2.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.main.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.grey.css" class="skin-color" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	function getCid(cid){
		$(":input[name='catalog.catalogid']").val(cid);
	}
</script>
</head>
<body>
	<jsp:include page="/admin/optionsBar.jsp" />
	<div id="content">
		<div id="content-header">
			<h1>管理员</h1>
		</div>
		<div id="breadcrumb">
			<a href="<%=path%>/admin/index.jsp" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> 主页</a> <a href="#">菜单管理模块</a> <a href="#"
				class="current">添加菜单分类</a>
		</div>
		<div class="widget-box">
			<div class="widget-title">
				<span class="icon"> <i class="icon-th"></i> </span>
				<h5>Static table</h5>
			</div>
			<div class="widget-content nopadding">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>菜单分类ID</th>
							<th>菜单分类名称</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:action name="showCatalog" executeResult="true" />
						<s:iterator value="#request.lc" id="c">
							<tr>
								<td><s:property value="#c.catalogid" />
								</td>
								<td><s:property value="#c.catalogname" />
								</td>
								<td><a class="btn btn-primary" data-toggle="modal" onclick="getCid(<s:property value="#c.catalogid"/>)"
									data-target="#modifyCatalog"><i class="icon-pencil icon-white"></i> Edit</a> 
									<a class="btn btn-danger"
									href="javascript:if(confirm('确实要删除该菜单分类吗?'))location='deleteCatalog?catalogid=<s:property value="#c.catalogid"/>'">
									<i class="icon-remove icon-white"></i> Delete</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modifyCatalog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改菜单分类</h4>
				</div>
				<div class="modal-body">
					<form action="modifyCatalog" method="post" style="font-size:20px">
						<p>请输入新的菜单分类名称：</p>
						<input type="text" name="catalog.catalogname" class="form-control"
							placeholder="菜单分类名称" required autofocus><br>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">提交</button>
						</div>
						<input type="hidden" name="catalog.catalogid" value=""/>
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
