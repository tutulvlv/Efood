<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/logo.png">
<title>Efood外卖网</title>
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=path%>/css/carousel.css" rel="stylesheet">
<link href="<%=path%>/css/customerservice.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/holder.js"></script>
<script type="text/javascript" src="<%=path%>/js/scrolltopcontrol.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap.autocomplete.js"></script>
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
		$(":input[name='menuname']").autocomplete({
		    source:function(query,process){
						$.ajax({
							type:"POST",
							url:"/Efood/AutoComplete",//传入后台的地址/方法
							data:"menuname="+query,
							dataType:"text",
							success:function(data){
								return process(data.split(','));
							}
						});
				}
		});
	});
</script>
</head>
<body style="background-image:url(images/background.jpg)">
	<jsp:include page="/user/head.jsp" />
	<jsp:include page="/user/modal.jsp" />
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="<%=path%>/images/3.jpg" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>欢迎来到Efood快餐外卖网！！！！！</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="<%=path%>/images/2.jpg" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>大家记得多吃蔬菜噢！~</h1>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span> </a> <a
			class="right carousel-control" href="#myCarousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span> </a>
	</div>
	<div style="position:absolute;left:200px;top:100px">
			<form action="showMenuByName" method="post">
				<div style="float:right;margin-right:50px">
					<button type="submit" class="btn btn btn-primary">搜索菜品</button>
				</div>
				<div style="float:right;margin-right:10px">
					<input type="text" name="menuname" class="form-control"
						placeholder="输入菜品名称" required autofocus>
				</div>
			</form>
			<form action="showMenuByPrice" method="post">
				<div style="float:right;margin-right:50px">
					<button type="submit" class="btn btn btn-primary">搜索菜品</button>
				</div>
				<div style="float:right;margin-right:10px">
					
					<input type="text" name="maxprice" class="form-control" style="width:150px;" placeholder="最高价">
				</div>
				<div style="float:right;margin-right:10px">
					——
				</div>
				<div style="float:right;margin-right:10px">
					<input type="text" name="mixprice" class="form-control" style="width:150px" placeholder="最低价">
				</div>
			</form>
	</div>
	<div class="container marketing">
		<!-- Three columns of text below the carousel -->
		<div class="row" style="width:100%;">
			<div style="width:90%; margin:0 auto; float:none;">
				<s:iterator value="#request.lm" id="menu">
					<div class="col-lg-4" style="width:33.3333333%; float:left; margin-top:20px;">
						<a href="showMenuDetail?menuid=<s:property value="#menu.menuid"/>">
							<img class="img-circle" src="<%=path%>/<s:url value="%{#menu.image}"/>"
							style="width:140px;height:140px" alt="Generic placeholder image"></a>
						<h2>
							<s:property value="#menu.menuname" />
						</h2>
						<p>
							<s:property value="#menu.descr" />
						</p>
						<p>
							<span style="color:red">￥<s:property value="%{#menu.price}" /></span>
						</p>
						<p>
							<a class="btn btn-default"
								href="addToCart?menuid=<s:url value="%{#menu.menuid}"/>&quantity=1"
								role="button">加入购物车&raquo;</a>
						</p>
					</div>
				</s:iterator>
			</div>
			<div style="float:left;width:1000px;text-align:center">
				<ul class="pagination">
				<s:set name="pager" value="#request.pager"/>
				<s:if test="#pager.hasFirst">
					<li><a href="showMenuByCatalog?currentPage=1">首页</a></li>
				</s:if>
				<s:else>
					<li class="disabled"><a href="showMenuByCatalog?currentPage=1">首页</a></li>
				</s:else>
				<s:if test="#pager.hasPrevious">
					<li><a href="showMenuByCatalog?currentPage=<s:property value="#pager.currentPage-1"/>">
						上一页
					</a></li>
				</s:if>
				<s:else>
					<li class="disabled"><a href="showMenuByCatalog?currentPage=<s:property value="#pager.currentPage-1"/>">
						上一页
					</a></li>
				</s:else>
				<s:if test="#pager.hasNext">
					<li><a href="showMenuByCatalog?currentPage=<s:property value="#pager.currentPage+1"/>">
						下一页
					</a></li>
				</s:if>
				<s:else>
					<li class="disabled"><a href="showMenuByCatalog?currentPage=<s:property value="#pager.currentPage+1"/>">
						下一页
					</a></li>
				</s:else>
				<s:if test="#pager.hasLast">
					<li><a href="showMenuByCatalog?currentPage=<s:property value="#pager.totalPage"/>">
						尾页
					</a></li>
				</s:if>
				<s:else>
					<li class="disabled"><a href="showMenuByCatalog?currentPage=<s:property value="#pager.totalPage"/>">
						尾页
					</a></li>
				</s:else>
				</ul>
				<br>
				当前第<s:property value="#pager.currentPage"/>页，总共<s:property value="#pager.totalPage"/>页
			</div>
		</div>
	</div>
		<br> <br> <br> <br>
	<jsp:include page="/user/foot.jsp" />
</body>
</html>