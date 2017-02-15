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
<title>Efood菜品详情</title>
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

	});
</script>
</head>
<body>
	<jsp:include page="/user/head.jsp" />
	<jsp:include page="/user/modal.jsp" />
	<div style="width:100%;padding-top:50px;">
		<div style="width:100%;margin:0 auto;min-width:980px">
			<img src="<%=path%>/images/head.jpg" width="100%">
		</div>
		<div style="width:85%;min-width:980px;height:600px;margin :0 auto;margin-top:40px;border:1px #ccc solid">
				<div style="width:28%;margin:20px;float:left">
					<img src="<%=path%>/<s:url value="%{#request.menu.image}" />"
						style="width:100%;height:300px;min-width:200px;"> <br>
					<br>
					<div class="bshare-custom icon-medium-plus" ><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
				</div>
				<div style="width:40%;float:left;margin:20px;">
					<h3>
						<s:property value="#request.menu.menuname" />
					</h3>
					Efood快餐外卖网提供凤梨酥,大溪豆干,北埔客家擂茶,新竹贡丸,辉鸿蚵仔煎,犂记饼店,台北鸳鸯火锅,高雄蚵仔煎,双冬槟榔,万峦猪脚,台湾牡蛎,南投高粱酒等台湾美食
					<hr style="border:1px dotted #D9D9D9">
					<p>
						<span style="margin-right:30px">用料</span>
						<s:property value="#request.menu.descr" />
					</p>
					<p>
						<span style="margin-right:30px;">价格</span><span
							style="font-size:20px;color:red">￥<s:property
								value="#request.menu.price" /></span>/份
					</p>
					<%-- <p>
						<span style="margin-right:30px">单位</span>件
					</p> --%>
					<%-- <p>
						<span style="margin-right:20px">销售量</span>
						<s:property value="" />
					</p> --%>
					<p><span style="margin-right:30px">数量</span>1</p>
					<hr>
				
					<a href="addToCart?menuid=<s:property value="#request.menu.menuid"/>&quantity=1"
						class="btn btn-lg btn-primary">加入购物车</a>
					
					<br> <br> <br> <img src="<%=path%>/images/head2.jpg">
				</div>
			<%-- <div style="float:left;width:22%;margin-top:20px;min-width:180px;border:1px #F0D584 solid;background-color:#FFFCDE">
				<!-- 排行 -->
				<img src="images/paihang.jpg" style="width:100%;min-width:205px">
				<s:iterator value="#session.rankingList" id="ranking">
					
						<div>
							<div style="margin:20px;float:left">
							<a href="MenuAction!myDetail?id=<s:property value="#ranking.id"/>">
								<img src="<%=path%>/<s:property value="/#ranking.path"/>"
									width="100" height="100"></a>
							</div>
							<div style="float:left;margin-top:50px;color:#000">
								<p>
									<s:property value="#ranking.dishes" />
								</p>
								<span style="font-size:20px;color:red">￥<s:property
										value="#ranking.price" /></span>
							</div>
						</div>
					
				</s:iterator>
			</div> --%>
		</div>
		<div
			style="width:85%;min-width:980px;height:40px;border:1px #ccc solid;margin:0 auto;margin-top:25px;">
			<img src="<%=path%>/images/head3.jpg">
		</div>
		<div style="width:85%;min-width:980px;border:1px #ccc solid;margin:0 auto;margin-top:10px;">
				<div style="float:left">
					<h3>用户评论</h3>
				</div>
				<s:iterator value="#request.commentlist" id="cl">
					<div style="padding:20px;clear:both;height:150px">
						<div
							style="width:100px;height:100px;float:left;border:1px solid #CCC;">
							<img src="<%=path%>/images/personal.jpg" width="98" height="98">
							<center>
								<p>
									<s:property value="#session.u.username" />
								</p>
							</center>
						</div>
						<div style="width:650px;height:100px;float:left;border:1px solid #CCC;margin-left:20px">
							<div style="width:100%;height:55px;margin:20px">
								<s:property value="#cl.comment" />
							</div>
						</div>
					</div>
				</s:iterator>
				<div id="show"></div>
			</div>
	</div>		
	<jsp:include page="/user/foot.jsp" />
</body>
</html>
