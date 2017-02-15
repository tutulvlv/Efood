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
<title>Efood购物车</title>
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=path%>/css/carousel.css" rel="stylesheet">
<link href="<%=path%>/css/customerservice.css" rel="stylesheet" type="text/css" />
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
		$("#changeyzm").click(function(){
			//$("#cy").attr("src","servlet/GetYzm?t="+new Date().getTime());
			$.get("servlet/GetYzm?t="+new Date().getTime(),function(data){
					$("#cy").attr("src",data);
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
						Hi，<s:property value="#session.u.username"/></h1>
					<p>以下是您的购物车详情！</p>
				</div>
				<div>
					<div class="widget-box">
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped with-check">
								<thead style="background-color:#FFF">
									<tr>
										<th>序号</th>
										<th>商品</th>
										<th>简介</th>
										<th>数量</th>
										<th>价格</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#session.cart.items" id="cart" status="status">
										<tr>
											<td><s:property value="#status.index+1"/></td>
											<td><center>
													<%-- <a href="<%=path%>/showMenuDetail?menuid=<s:property value="#cart.value.menu.menuid"/>"> --%>
													<img src="<%=path%>/<s:property value="#cart.value.menu.image"/>" width="65" height="65">
													<span style="color:#000"><br>
													<s:property value="#cart.value.menu.menuname" />
													</span>
												<!-- 	</a> -->
												</center>
											</td>
											<td><s:property value="#cart.value.menu.descr" /></td>
											<th><s:if test="#cart.value.quantity != 1">
												<a href="updateCart?menuid=<s:property value="#cart.value.menu.menuid"/>&method=1" 
												class="btn btn-primary">-</a>
												</s:if>
												<s:property value="#cart.value.quantity"/>
												<a href="updateCart?menuid=<s:property value="#cart.value.menu.menuid"/>&method=2"
												class="btn btn-primary">+</a>
											</th>
											<td>￥<s:property value="#cart.value.menu.price"/></td>
											<td><a href="updateCart?menuid=<s:property value="#cart.value.menu.menuid"/>&method=0"
												class="btn btn-lg btn-primary">删除</a></td>
										</tr>
									</s:iterator>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6">总价：￥<s:property value="#session.cart.totalPrice"/></td>
									</tr>
									<tr>
										<td colspan="6">
											<a href="<%=path%>/index.jsp">
												<img src="<%=path%>/images/gwc_jx.gif" border="0" /></a>
											<s:if test="#session.u==null">
											<a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1">
												<img src="<%=path%>/images/gwc_buy.gif" border="0" /></a>
											</s:if>
											<s:else>
												<a href="<%=path%>/user/submitorder.jsp">
												<img src="<%=path%>/images/gwc_buy.gif" border="0" /></a>
											</s:else>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/user/foot.jsp" />
</body>
</html>
