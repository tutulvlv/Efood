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
<title>Efood订单列表</title>
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
	function getOid(oid){
		$(":input[name='orderitemid']").val(oid);
	}
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
					<p>以下是您的订单详情！</p>
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
										<th>评价</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#request.orderitems" id="orderitem" status="status">
										<tr>
											<td><s:property value="#status.index+1"/></td>
											<td><center>
													<%-- <a href="MenuAction!myDetail?id=<s:property value="#orderitem.menu.menuid"/>"> --%>
														<img src="<%=path%>/<s:property value="#orderitem.menu.image"/>"
														width="65" height="65"> <span style="color:#000"><br>
															<s:property value="#orderitem.menu.menuname" /> </span> 
														<!-- </a> -->
												</center>
											</td>
											<td><s:property value="#orderitem.menu.descr" /></td>
											<th><s:property value="#orderitem.quantity" />
											</th>
											<td>￥<s:property value="#orderitem.menu.price" /></td>
											<td><s:if test="#orderitem.comment==null">
													<a onclick="getOid(<s:property value="#orderitem.orderitemid"/>)" 
													data-toggle="modal" data-target="#comment" class="btn btn-danger">评价</a>
												</s:if>
												<s:else><s:property value="#orderitem.comment" /></s:else></td>
											<td><s:if test="#orderitem.status==0">
													<font>未发货</font>
												</s:if> <s:else>
													<s:if test="#orderitem.status==1">
														<font>已发货</font>
													</s:if>
													<s:else>已签收</s:else>
												</s:else></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/user/foot.jsp"/>
	<div class="modal fade" id="comment" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">评论</h4>
				</div>
				<div class="modal-body">
					<form action="saveComment"
						method="post" style="font-size:20px">
						<input type="text" hidden="hidden" name="orderitemid" value=""/>
						<textarea name="comment" rows="10" cols="60"></textarea>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">提交</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
