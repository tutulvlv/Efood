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
<title>Efood菜单列表</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/uniform.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/select2.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.main.css" />
<link rel="stylesheet" href="<%=path%>/admin/css/unicorn.grey.css" class="skin-color" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<jsp:include page="/admin/optionsBar.jsp" />
	<div id="content">
		<div id="content-header">
			<h1>管理员</h1>
		</div>
		<div id="breadcrumb">
			<a href="<%=path%>/admin/index.jsp" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> 菜单管理</a><a href="#"
				class="current">菜单列表</a>
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
							<th>菜单名</th>
							<th>价格</th>
							<th>简介</th>
							<th>图片</th>
							<th>分类</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.lm" id="m">
							<tr>
								<td><a href="?id=<s:property value="#m.id"/>"
									style="color:#000"><s:property value="#m.menuname" /> </a></td>
								<td><s:property value="#m.price" /></td>
								<td><s:property value="#m.descr" />
								<td><img src="../<s:property value="#m.image"/> "
									width="40"></td>
								<td><s:property value="#m.catalog.catalogname" /></td>
								<td><a class="btn btn-primary"
									href="showMenuDetail?menuid=<s:property value="#m.menuid"/>"><i
										class="icon-pencil icon-white"></i> 修改</a> <a
									class="btn btn-danger"
									href="javascript:if(confirm('确实要删除该菜单吗?'))location='deleteMenu?menuid=<s:property value="#m.menuid"/>'"><i
										class="icon-remove icon-white"></i> 删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<div style="float:left;width:1000px;text-align:center">
				<ul class="pagination">
					<s:set name="pager" value="#request.pager" />
					<s:if test="#pager.hasFirst">
						<li><a href="showAllMenu?currentPage=1">首页</a></li>
					</s:if>
					<s:else>
						<li class="disabled"><a href="showAllMenu?currentPage=1">首页</a>
						</li>
					</s:else>
					<s:if test="#pager.hasPrevious">
						<li><a
							href="showAllMenu?currentPage=<s:property value="#pager.currentPage-1"/>">
								上一页 </a></li>
					</s:if>
					<s:else>
						<li class="disabled"><a
							href="showAllMenu?currentPage=<s:property value="#pager.currentPage-1"/>">
								上一页 </a></li>
					</s:else>
					<s:if test="#pager.hasNext">
						<li><a
							href="showAllMenu?currentPage=<s:property value="#pager.currentPage+1"/>">
								下一页 </a></li>
					</s:if>
					<s:else>
						<li class="disabled"><a
							href="showAllMenu?currentPage=<s:property value="#pager.currentPage+1"/>">
								下一页 </a></li>
					</s:else>
					<s:if test="#pager.hasLast">
						<li><a
							href="showAllMenu?currentPage=<s:property value="#pager.totalPage"/>">
								尾页 </a></li>
					</s:if>
					<s:else>
						<li class="disabled"><a
							href="showAllMenu?currentPage=<s:property value="#pager.totalPage"/>">
								尾页 </a></li>
					</s:else>
				</ul>
				<br> 当前第
				<s:property value="#pager.currentPage" />
				页，总共
				<s:property value="#pager.totalPage" />
				页
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
	<script src="<%=path%>/admin/js/jquery.uniform.js"></script>
	<script src="<%=path%>/admin/js/select2.min.js"></script>
	<script src="<%=path%>/admin/js/jquery.validate.js"></script>
	<script src="<%=path%>/admin/js/unicorn.js"></script>
	<script src="<%=path%>/admin/js/unicorn.form_validation.js"></script>
</body>
</html>
