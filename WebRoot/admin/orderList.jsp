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
		<title>Efood订单管理</title>
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
				<h1>待处理订单</h1>
			</div>
			<div id="breadcrumb">
				<a href="<%=path%>/admin/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
				<a href="#" class="current">订单列表</a>
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
											<th>下单用户</th>
											<th>菜肴</th>
											<th>数量</th>
											<th>下单时间</th>
											<th>单价</th>
											<th>总价</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
								<s:iterator value="#request.oil" id="o">
										<tr>
											<td><s:property value="#o.orders.user.username"/></td>
											<td><s:property value="#o.menu.menuname"/></td>
											<td><s:property value="#o.quantity"/></td>
											<td><s:property value="#o.orders.orderdate"/></td>
											<td>￥<s:property value="#o.menu.price"/></td>
											<td>￥<s:property value="#o.quantity * #o.menu.price"/></td>
											<s:if test="#o.status==0"><td>未发货</td></s:if>
											<s:elseif test="#o.status==1"><td>已发货</td></s:elseif>
											<td><s:if test="#o.status==0">
												<a class="btn btn-primary" href="javascript:if(confirm('确实要发货吗?'))location='modifyOrderStatus?orderitemid=<s:property value="#o.orderitemid"/>'"><i class="icon-pencil icon-white"></i>发货</a>
												</s:if>
												<s:else>
												<a class="btn btn-danger"  href="javascript:if(confirm('确实要删除该订单吗?'))location='deleteOrderitem?orderitemid=<s:property value="#o.orderitemid"/>'"><i class="icon-remove icon-white"></i> 删除</a>
												</s:else>
											</td>	
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
