<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%--  <base href="<%=basePath%>"> --%>
    
    <title>My JSP '1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="../css/basic.css" />
	<link rel="stylesheet" href="../css/column.css" />

  </head>
  
  <body>
  	<jsp:useBean id="goodsClass" class="com.JavaBean.GoodsClass" scope="page"></jsp:useBean>
    <jsp:useBean id="goodsBean" class="com.JavaBean.GoodsBean" scope="page"></jsp:useBean>
    <% 
    String goodsId=request.getParameter("goodsId");
    %>
    
    <%
    goodsClass=goodsBean.getGoodsInfo(goodsId);
    %>
    
    <header id="header">
	<div class="sec-center">
    	<h1 class="h1-logo">web订餐</h1>
        <nav class="link">
        	<h2 class="none">网站导航</h2>
            <ul>
                <li class="active"><a href="index.jsp">首页</a></li>
	                <li><a href="###">美食资讯</a></li>
	                <li><a href="cart/cart.jsp">我的购物车</a></li>
	                <li><a href="cart/OrderInfo.jsp">订单查询</a></li>
	                <li><a href="manager/a.jsp">网站简介</a></li>
            </ul>
        </nav> 
    </div>
	</header>
	
	<div id="headline">
		<div class="center">
			<hgroup>
				<h2>美食资讯</h2>
				<h3>介绍各种最新美食信息、资讯要闻、美食攻略等</h3>	
			</hgroup>
		</div>
	</div>

	<div id="container">
	<aside class="sidebar">
		<div>
        	<h2>菜品推荐</h2>
            <div class="tag">
            <ul>
					<li><a href="###">红烧排骨</a></li>
					<li><a href="###">红烧鱼</a></li>
					<li><a href="###">卤猪耳</a></li>
					<li><a href="###">手抓肉</a></li>
					<li><a href="###">四喜丸子</a></li>
					<li><a href="###">玉米排骨</a></li>
					<li><a href="###">麻婆豆腐</a></li>
					<li><a href="###">红烧肉</a></li>
					<li><a href="###">北京烤鸭</a></li>
					<li><a href="###">可乐鸡翅</a></li>
					<li><a href="###">白斩鸡</a></li>
					<li><a href="###">干煸豆角</a></li>
					<li><a href="###">鱼香肉丝</a></li>
					<li><a href="###">宫保鸡丁</a></li>
					<li><a href="###">诸葛烤鱼</a></li>
					<li><a href="###">剁椒全鱼</a></li>
					<li><a href="###">火焰山</a></li>
					<li><a href="###">手撕包菜</a></li>
					<li><a href="###">椒盐蘑菇</a></li>
					<li><a href="###">京酱肉丝</a></li>
					<li><a href="###">粉蒸肉</a></li>
				</ul>
            </div>
        </div>
        <div>
        
        </div>
        <div>
        
        </div>
	</aside>
	<div class="list">
    	<div class="img">
        	<img src="../img/<%=goodsId %>.jpg"/><br />
        	
        	<form action="cart.jsp" method="get">
           	 <!-- <a>添加到购物车</a> -->
		   	<div align="center">添加到购物车<input type="submit" value="add" name="action" /></div>
		    <div style="display:none"><input value=<%=goodsId %> name="goodsId"/></div>
    		</form> 
            <a href="javascript:history.go(-1)">返回</a>
        </div>
        
        <div class="wenzi">
			<p><span>编号：</span><%=goodsClass.getGoodsId() %></p>
			<p><span>名称：</span><%=goodsClass.getGoodsName() %></p>
            <p><span>食材：</span><%=goodsClass.getGoodsmaterial() %></p>
            <p><span>做法：</span><%=goodsClass.getGoodsPackage() %></p>
            <p><span>特点：</span><%=goodsClass.getGoodsLanguage() %></p>
            <p><span>价格：</span><%=goodsClass.getGoodsPrice() %></p>
            <p><span>商品积分：</span><%=goodsClass.getGoodsCent() %></p>
            <p><span>配送范围：</span><%=goodsClass.getGoodsScope() %></p>
            <p><span>适用场合：</span><%=goodsClass.getGoodsPlace() %></p>
            <p><span>商品状态：</span><%=goodsClass.getGoodsHabitus() %></p>
            <p><span>商品类别：</span><%=goodsClass.getSortName() %></p>
        </div>
	</div>
	</div>


   <%--  <div><img src="img/<%=goodsId %>.jpg"/></div>
    <div>
    	<table>
    		<tr>
    			<td>编号：</td>
    			<td><%=goodsClass.getGoodsId() %></td>
    		</tr>
    		<tr>
    			<td>名称：</td>
    			<td><%=goodsClass.getGoodsName() %></td>
    		</tr>
    		<tr>
    			<td>食材：</td>
    			<td><%=goodsClass.getGoodsmaterial() %></td>
    		</tr>
    		<tr>
    			<td>做法：</td>
    			<td><%=goodsClass.getGoodsPackage() %></td>
    		</tr>
    		<tr>
    			<td>特点：</td>
    			<td><%=goodsClass.getGoodsLanguage() %></td>
    		</tr>
    		<tr>
    			<td>价格：</td>
    			<td><%=goodsClass.getGoodsPrice() %></td>
    		</tr>
    		<tr>
    			<td>商品积分：</td>
    			<td><%=goodsClass.getGoodsCent() %></td>
    		</tr>
    		<tr>
    			<td>配送范围：</td>
    			<td><%=goodsClass.getGoodsScope() %></td>
    		</tr>
    		<tr>
    			<td>适用场合：</td>
    			<td><%=goodsClass.getGoodsPlace() %></td>
    		</tr>
    		<tr>
    			<td>商品状态：</td>
    			<td><%=goodsClass.getGoodsHabitus() %></td>
    		</tr>
    		<tr>
    			<td>商品类别：</td>
    			<td><%=goodsClass.getSortName() %></td>
    		</tr>
    	</table>
    </div>
    <div>
    <form action="cart/cart.jsp" method="get">
    <input type="submit" value="add" name="action"/>
    <div style="display:none"><input value=<%=goodsId %> name="goodsId"/></div></form>
    
    </div> --%>
    
    <footer id="footer">
	<div class="top">
    	<div class="block">
        	<h2>合作伙伴</h2>
			<hr>
        	<ul>
				<li>美团外卖</li>
				<li>百度外卖</li>
				<li>饿了么</li>
				<li>百度糯米</li>
			</ul>
        </div>
        <div class="block">
        	<h2>订餐FAQ</h2>
			<hr>
			<ul>
				<li>怎么订餐？</li>
				<li>多久送到？</li>
				<li>饭菜味道怎么样？</li>
				<li>降价如何通知？</li>
				<li>怎么评价？</li>
			</ul>
        </div>
        <div class="block">
        <h2>联系方式</h2>
			<hr>
			<ul>
				<li>微博：weibo.com/Web</li>
				<li>邮件：Web@Web.com</li>
				<li>地址：西安电子科技大学</li>
			</ul>
        </div>
    </div>
    
    <div class="bottom">
    Copyright © WEB Web订餐| 陕ICP 备123456789号 | 经营许可证：Y-CW-EB12345
    </div>
</footer>
  </body>
</html>
