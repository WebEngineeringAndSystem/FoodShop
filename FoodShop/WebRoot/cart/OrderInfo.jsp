<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'OrderInfo.jsp' starting page</title>
    
   
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

 	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/basic.css" />
	<link rel="stylesheet" href="../css/column.css" />
  </head>
  
  <body>
    <jsp:useBean id="goods" class="com.JavaBean.GoodsBean" scope="session"></jsp:useBean>
    <jsp:useBean id="goodsClass" class="com.JavaBean.GoodsClass" scope="session"></jsp:useBean>
    <jsp:useBean id="cart" class="com.JavaBean.Cart" scope="session"></jsp:useBean>
    
    <%
    int ordersId;
    String totalPrice;
    try{
    	//调用cart中的genOrder()方法存储订单
    	totalPrice=session.getAttribute("totalPrice").toString();
    	ordersId=cart.genOrder((String)session.getAttribute("name"), totalPrice);
    
    %>
    
    <header id="header">
		<div class="sec-center">
	    	<h1 class="h1-logo">Web订餐</h1>
	        <nav class="link">
	        	<h2 class="none">网站导航</h2>
	            <ul>
	                <li class="active"><a href="index.jsp">首页</a></li>
	                <li><a href="information.html">美食资讯</a></li>
	                <li><a href="cart/cart.jsp">我的购物车</a></li>
	                <li><a href="cart/OrderInfo.jsp">订单查询</a></li>
	                <li><a href="###">网站简介</a></li>
	            </ul>
	        </nav> 
	    </div>
	</header>
<div bgColor="black">   
    <table>
    	<tbody><tr>
    		<td width=397 height=40>
    		<div class=blue2 align="center"><div align="left"><h1>订单生成成功！</h1></div></div></td>
    		<td width=352></td>
    		</tr>
    	</tbody>
    </table>
    		
    <table cellSpacing=1 cellPadding=1 width=812 align=center bgColor=#00addf border=0>
    <form action="cart/cart.jsp" method="post">
    <tbody>
    <tr bgColor=#00addf>
    <td width="22%" bgColor=#00addf height=22><div align="center">订单号</div></td>
    <td width="26" height=22><div align="center">用户名</div></td>
    <td width="23" height=22><div align="center">总价</div></td>
    <td width="29" height=22><div align="center">日期</div></td>
    </tr>
    <tr bgColor="#FFFFFF">
    <td><div align="center"><%=ordersId %></div></td>
    <td><div align="center"><%=session.getAttribute("name") %></div></td>
    <td><div align="center"><%=totalPrice %></div></td>
    <td><div align="center"><%=new java.util.Date().toLocaleString() %></div></td>
    </tr>
    <%
    //循环遍历所有购物车中的商品
    HashMap cart_item=cart.getItems();
    Iterator it=cart_item.keySet().iterator();
    while(it.hasNext()){
    	String goodsId=(String)it.next();
    	goodsClass=goods.getGoodsInfo(goodsId);
    	int i=Integer.parseInt(String.valueOf(cart_item.get(goodsId)));
    	//调用cart类的saveItems方法存储订单中的商品明细
    	cart.saveItems(ordersId, goodsClass.getGoodsName(), ""+goodsClass.getGoodsPrice(), i);
    }
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>
    <tr>
	<div class="list">
    	<div class="img">        	
        <a href="index.jsp">继续购物</a>
        <a href="javascript:history.go(-1)">返回</a>
        </div>
    <!-- <a href="index.jsp">继续购物</a> -->
    <!-- <form action="index.jsp" method="post"><input type="submit" value="继续购物"/></form> -->
    </tr>
    </tbody>
    </form>
    </table>
</div>     
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
