<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="<%=path%>/images/logo.png">
<title>Efood个人中心</title>
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=path%>/css/carousel.css" rel="stylesheet">
<link href="<%=path%>/css/customerservice.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/holder.js"></script>
<script type="text/javascript" src="<%=path%>/js/scrolltopcontrol.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#aFloatTools_Show").click(function() {
			$('#divFloatToolsView').animate({
				width : 'show',
				opacity : 'show'
			}, 'normal', function() {
				$('#divFloatToolsView').show();
			});
			$('#aFloatTools_Show').attr('style', 'display:none');
			$('#aFloatTools_Hide').attr('style', 'display:block');
		});

		$("#aFloatTools_Hide").click(function() {
			$('#divFloatToolsView').animate({
				width : 'hide',
				opacity : 'hide'
			}, 'normal', function() {
				$('#divFloatToolsView').hide();
			});
			$('#aFloatTools_Show').attr('style', 'display:block');
			$('#aFloatTools_Hide').attr('style', 'display:none');
		});
		$("#changeyzm").click(function() {
			//$("#cy").attr("src","servlet/GetYzm?t="+new Date().getTime());
			$.get("servlet/GetYzm?t=" + new Date().getTime(), function(data) {
				$("#cy").attr("src", data);
			});
		});
	});
</script>
</head>
<body>
	<jsp:include page="/user/head.jsp" />
	<jsp:include page="/user/modal.jsp" />
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron">
					<h1>
						Hi，
						<s:property value="#session.u.username" />
					</h1>
					<p>请认真修改并记住您的信息</p>
				</div>
				<div style="float:left;padding-left:20px">
					<form action="modifyUser" method="post">
						<input type="text" name="user.id" hidden="hidden"
							value="<s:property value="#session.u.id"/>" />
						<div><h3>用户名</h3>
						<input type="text" name="user.username" hidden="hidden"
							value="<s:property value="#session.u.password"/>" />
						<s:property value="#session.u.username"/></div>
						<div><h3>密码</h3>
						<input type="password" name="pwd1" class="form-control"
							value="<s:property value="#session.u.password"/>" /></div>
						<div><h3>确认密码</h3>
						<input type="password" name="user.password" class="form-control"
							value="<s:property value="#session.u.password"/>" /></div>
						<div><h3>邮箱地址</h3>
						<input type="text" name="user.email" class="form-control"
							value="<s:property value="#session.u.email"/>" /></div>
						<div><h3>联系电话</h3>
						<input type="text" name="user.telephone" class="form-control"
							value="<s:property value="#session.u.telephone"/>" /></div>
						<div><h3>联系地址</h3>
						<input type="text" name="user.address" class="form-control"
							value="<s:property value="#session.u.address"/>" /></div>
						<a type="button" href="javascript:history.go(-1);"
							style="margin-top:120px;align:right" class="btn btn-primary">取消/返回</a>&nbsp;
	      			 	<button type="submit" style="margin-top:120px;align:right"
							class="btn btn-primary">保存信息</button>
					</form>
				</div>

				
				<!--/span-->
			</div>
			<!--/row-->
		</div>
	</div>
	
	<jsp:include page="/user/foot.jsp" />
</body>
</html>