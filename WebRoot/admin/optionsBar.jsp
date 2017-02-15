<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div id="header">
			<h1><a href="/admin/index.jsp">Efood Admin</a></h1>		
		</div>
		<div id="search"></div>
		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse"><a href="showAdmin?adminid=${session.a.adminid}"><i class="icon icon-user"></i> <span class="text"><s:property value="#session.a.adminname"/></span></a></li>
                <li class="btn btn-inverse"><a href="adminLogout"><i class="icon icon-share-alt"></i> <span class="text">退出登陆</span></a></li>
            </ul>
        </div>
		<div id="sidebar">
			<ul>
				<li><a href="<%=path%>/admin/index.jsp"><i class="icon icon-home"></i> <span>主页</span></a></li>
				
			 	<s:if test="#session.a.adminname =='admin'">
			 	
			 	<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>管理员模块</span> </a>
					<ul>
						<li><a href="showAdminList">管理员列表</a></li>
						<li><a href="adminAdd.jsp">添加管理员</a></li>
					</ul>
				</li>
				</s:if>
				<li><a href="showUserList"><i class="icon-user"></i> <span>用户列表</span></a></li>
				<li class="submenu">
				<a href="#"><i class="icon-star-empty"></i> <span>订单列表</span> </a>
					<ul>
						<li><a href="showPendingOrders">待处理订单</a></li>
						<li><a href="showDoneOrders">已完成订单</a></li>
					</ul>
			</li>
				<li class="submenu">
					<a href="#"><i class="icon-star-empty"></i> <span>菜单管理</span> </a>
					<ul>
						<li><a href="showAllMenu">菜单列表</a></li>
						<li><a href="catalogList.jsp">菜单分类列表</a></li>
						<li><a href="addMenu.jsp">添加菜单</a></li>
						<li><a data-toggle="modal" data-target="#addCatalog">添加菜单分类</a></li>
					</ul>
				</li>
				<li><a href="javascript:alert('请将您的意见和建议发送至本邮箱1139800505@qq.com,谢谢您的支持！！！')"><i class="icon-heart"></i> 意见反馈</a></li>
			</ul>
		</div>
<div class="modal fade" id="addCatalog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">添加菜单分类</h4>
			</div>
			<div class="modal-body">
				<form action="addCatalog" method="post"
					 style="font-size:20px">
					<p>请输入菜单分类名称：</p>
					<input type="text" name="catalog.catalogname" class="form-control"
						placeholder="菜单分类名称" required autofocus><br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>