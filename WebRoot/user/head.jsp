<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<%=path%>/index.jsp">主页</a></li>
            <!-- <li><a href="page/about.html" target="blank">实体店</a></li>
			<li><a href="#">每周一荐</a></li> -->
          	<li class="dropdown">
          		<s:action name="showCatalog" executeResult="true"/>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                 	  菜单分类<b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                	<s:iterator value="#request.lc" id="catalog">
                    	<li><a href="showMenuByCatalog?catalogid=<s:property value="#catalog.catalogid"/>">
                    		<s:property value="#catalog.catalogname"/></a></li>
                    </s:iterator>
                </ul>
            </li>
          	
          </ul>
		   <ul class="nav navbar-nav navbar-right">
          
			 <li> <% if(session.getAttribute("u")==null){
			 	
			%><a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1">
				登陆
			</a></li><%}else{  %>  <a href="#" data-toggle="dropdown"><s:property value="#session.u.username"/> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<%=path%>/user/personal.jsp">个人中心</a></li>
                 <li><a href="showOrderList">我的订单</a></li>
                <li><a href="<%=path%>/user/cart.jsp">购物车</a></li>
                <li class="divider"></li>
                 <li><a href="javascript:alert('请将您的意见和建议发送至本邮箱1139800505@qq.com,谢谢您的支持！！！')">意见反馈</a></li>
                <li><a href="logout">退出</a></li>
              </ul>
              <%} %>
			 <li> <a data-toggle="modal" data-target="#myModal2">
				注册
			</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="m-sidebar"> 
	    <div class="cart"> 
	        <a href="<%=path%>/user/cart.jsp"><i id="end"></i> 
	        <span>购物车</span></a>
	    </div> 
	</div>
    