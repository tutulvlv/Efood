<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<hr />
<!-- /END THE FEATURETTES -->
<!-- FOOTER -->
<footer>
	<HR>
	<p align="center">
		2016 &copy; 涂铝 .  &middot; <a href="http://www.hbeu.cn/">湖北工程学院</a>&middot; <a href="<%=path%>/admin/login.jsp">Efood后台</a>
	</p>
</footer>
