<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">登陆</h4>
			</div>
			<div class="modal-body">
				<form action="login" method="post"
					 style="font-size:20px">
					<p>用户名：</p>
					<input type="text" name="user.username" class="form-control"
						placeholder="username" required autofocus><br>
					<p>密 码：</p>
					<input type="password" name="user.password" class="form-control"
						placeholder="password" required autofocus><br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">登陆</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">注册</h4>
			</div>
			<div class="modal-body">
				<form style="font-size:15px" action="register"
					method="post">
					用户名：<input type="text" name="user.username" class="form-control"
						placeholder="username" required autofocus><br> 密 码：<input
						type="password" name="user.password" class="form-control"
						placeholder="password" required autofocus><br> 联系电话：<input
						type="text" name="user.telephone" class="form-control"
						placeholder="telephone" required autofocus><br> 地址：<input
						type="text" name="user.address" class="form-control"
						placeholder="address" required autofocus /><br> 邮箱地址：<input
						type="text" name="user.email" class="form-control"
						placeholder="email" required autofocus /><br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">注册</button>
					</div>
				</form>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!--客服 -->
<div class="rides-cs">
	<div class="floatL">
		<a style="display:block" id="aFloatTools_Show" class="btnOpen"
			title="查看在线客服" href="javascript:void(0);">展开</a> <a
			style="display:none" id="aFloatTools_Hide" class="btnCtn"
			title="关闭在线客服" href="javascript:void(0);">收缩</a>
	</div>

	<div id="divFloatToolsView" class="floatR" style="display:none">
		<div class="cn">
			<h3 class="titZx">订餐客服</h3>
			<ul>
				<li><span>盖伦</span><a target="_blank"
					href="http://wpa.qq.com/msgrd?v=3&uin=1139800505&site=qq&menu=yes"><img
						border="0" src="http://wpa.qq.com/pa?p=2:123456:51"
						title="Efood外卖订餐" /> </a>
				</li>
			</ul>
			<h3>建议提议</h3>
			<ul>
				<li><span>瑞兹</span><a target="_blank"
					href="http://wpa.qq.com/msgrd?v=3&uin=1139800505&site=qq&menu=yes"><img
						border="0" src="http://wpa.qq.com/pa?p=2:123456:51"
						title="Efood外卖订餐" /> </a>
				</li>
			</ul>
			<h3>售后服务</h3>
			<ul>
				<li><span>信爷</span><a target="_blank"
					href="http://wpa.qq.com/msgrd?v=3&uin=1139800505&site=qq&menu=yes"><img
						border="0" src="http://wpa.qq.com/pa?p=2:123456:51"
						title="Efood外卖订餐" /> </a>
				</li>
			</ul>
		</div>
	</div>
</div>