<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>checklogin.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!-- 验证用户登录信息 -->
    <jsp:useBean id="userClass" class="com.JavaBean.UserClass" scope="page"></jsp:useBean>
    <jsp:setProperty property="*" name="userClass"/>
    <jsp:useBean id="userBean" class="com.JavaBean.UserBean" scope="page"/>
   	<%session.removeAttribute("name"); %>
   	<%session.removeAttribute("card"); %>
   	<%
   	//接收用户输入的用户名和密码
   	String usersName=new String(request.getParameter("usersName"));
   	String usersPass=new String(request.getParameter("usersPass"));
   	%>
   	
   	<%
   	//将用户名保存到session中
   	session.setAttribute("name", request.getParameter("usersName"));
   	%>
   	
   	<%
   	//设置session超时为30min
   	session.setMaxInactiveInterval(30*60);
   	%>
   	
   	<%
   	try{
   		String nextpage;
   		//调用UserBean类的checkUserInfo方法验证用户的身份
   		userBean.setUserInfo(userClass);
   		boolean flag=userBean.checkUserInfo();
   		//如果是注册用户，在session中设置标识位为true
   		if(flag){
   			userClass=userBean.getUserInfo();
   			session.setAttribute("isLogin", "true");
   			session.setAttribute("isLogin_user", "true");
   		}
   		else{//如果不是注册用户，在session中设置标识位位false
   			session.setAttribute("isLogin", "false");
   			session.setAttribute("isLogin_user", "false");
   		}
   	%>
   	<%
   		response.sendRedirect("../index.jsp");
   	%>
   	<%
   	}
   	catch(Exception e){
   		e.printStackTrace();
   	}
   	%>

  </body>
</html>
