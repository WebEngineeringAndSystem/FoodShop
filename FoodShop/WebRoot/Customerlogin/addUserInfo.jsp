<%@ page language="java" import="java.util.*,java.sql.*,com.JavaBean.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<%-- <base href="<%=basePath%>"></base> --%>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<title>项目实战-Web订餐</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/basic.css" />
	<link rel="stylesheet" href="../css/style1.css" />
	<script type="text/javascript" src="http://libs.useso.com/js/jquery/1.7.2/jquery.min.js"></script>
	<script src="../js/main.js"></script>
   </head>
  
  <body>
    
    <jsp:useBean id="userClass" class="com.JavaBean.UserClass" scope="page">
    <jsp:setProperty name="userClass" property="*"/></jsp:useBean>
    <jsp:useBean id="userBean" class="com.JavaBean.UserBean" scope="page"></jsp:useBean>

	<header id="header">
		<div class="sec-center">
	    	<h1 class="h1-logo">Web订餐</h1>
	        <nav class="link">
	        	<h2 class="none">网站导航</h2>
	            <ul>
	                <li class="active"><a href="test.jsp">首页</a></li>
	                <li><a href="###">美食资讯</a></li>
	                <li><a href="../cart/cart.jsp">我的购物车</a></li>
	                <li><a href="###">订单查询</a></li>
	                <li><a href="###">网站简介</a></li>
	            </ul>
	        </nav> 
	    </div>
	</header>
	
    <p>
    
    	<%
    	
    		try{
    			
    			//调用JavaBean类的addUserInfo（）方法添加用户
    			userBean.setUserInfo(userClass);
    			userBean.addUserInfo();
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	%>
    </p>   
    
    <p align="center"><span class=style4><font color="grey" size=7 face="华文新魏">恭喜您，您已经注册成功，请牢记您的用户名和密码，返回首页进行登录，谢谢您使用本站。</font></span></p>
    <p align="center">&nbsp;</p>
    <p align="center"><a href="../index.jsp"><font color="red" size=5 face="宋体">返回首页</font></a></p>
    
    
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
