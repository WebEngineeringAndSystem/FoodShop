<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	 <base href="<%=basePath%>">
    
    <title>My JSP 'cart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/basic.css" />
	<link rel="stylesheet" href="css/gouwuche.css" />

  </head>
  
  <body>
    <jsp:useBean id="goods" class="com.JavaBean.GoodsBean" scope="session"></jsp:useBean>
    <jsp:useBean id="goodsClass" class="com.JavaBean.GoodsClass" scope="session"></jsp:useBean>
    <jsp:useBean id="cart" class="com.JavaBean.Cart" scope="session"></jsp:useBean>
    <%
    /* action为操作，add表示添加此商品，remove表示删除此商品 */
    String action=request.getParameter("action");
    //获得所有添加、删除的商品goodsId
    String items[]=request.getParameterValues("goodsId");
    if(items!=null)
    	for(int i=0;i<items.length;i++){
    		//根据action的值分别调用Cart类的不同方法
    		if(action.equals("add")) 
    			cart.addItem(items[i], i+1);
    		else if(action.equals("remove")) 
    			cart.removeItem(items[i]); 
    	}
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
   
	<div id="headline">
	<div class="center">
		<hgroup>
               <div class="div">
             	  购物车
          		</div>
    
    <table>
    	<form action="cart/cart.jsp" method="get">
    	<tr><td>选中从购物车中移除</td>
    		<td>商品名称</td>
    		<td>单价西电</td>
    		<td>数量</td></tr>
    		
    		<%
    		//获得购物车中的所有商品并放入HashMap中
    		HashMap cart_item=cart.getItems();
    		Iterator it=cart_item.keySet().iterator();
    		float totalPrice=0;
    		//将HashMap中的所有商品信息添加到页面上
    		while(it.hasNext()){
    			String goodsId=(String)it.next();
    			goodsClass=goods.getGoodsInfo(goodsId);
    			float f=goodsClass.getGoodsPrice();
    			
    			totalPrice+=f;

    			%>
  			<tr>
  			<td><input type="checkbox" value="<%=goodsClass.getGoodsId() %>" name="goodsId"/></td>
  			<td><%=goodsClass.getGoodsName() %></td>
  			<td><%=goodsClass.getGoodsPrice() %></td>
  			<td><%=cart_item.get(goodsId) %></td></tr>
   				<% 
    			}
    		session.setAttribute("totalPrice", ""+totalPrice);
   				%>
  			<tr>
                    <td colspan="4">
                    <div class="vv"><input type="submit" value="remove" name="action"/></div>
                    </form>
                    
                    <div class="dd">
                    <span>总计:</span><input type="text" value="￥<%=totalPrice %>" onfocus="this.blur()" size=5/>
                    </div>
                    
                    <form action="index.jsp" method="post">
                    <div class="vv"><input type=submit value="继续购物"/> </div>
                    </form>
                    
                    <form action="cart/OrderInfo.jsp" method="get">
                    <div class="dd"><input type="submit" value="生成订单"/></div>
                    </form>
                    </td>
                </tr>
  			
    </table>
    </hgroup>
	</div>
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
