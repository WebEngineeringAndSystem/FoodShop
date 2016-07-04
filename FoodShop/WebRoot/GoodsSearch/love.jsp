<%@ page language="java" import="java.util.*,com.JavaBean.*,java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>love</title>
    
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
    <jsp:useBean id="goodsClass" class="com.JavaBean.GoodsClass" scope="page"></jsp:useBean>
    <jsp:useBean id="goodsBean" class="com.JavaBean.GoodsBean" scope="page"></jsp:useBean>
    
    <%
    //接收超链接中的产品类型参数并将其转换成中文字符(因为默认编码为utf-8，所有省略此步骤)
    //String sortName=new String(request.getParameter("sortName").getBytes());
    String sortName=(String)request.getParameter("sortName");
    //将接受的产品类型保存在session中
    session.setAttribute("sortName", sortName);
    //调用GoodsBean对象将查询结果进行分页显示
    int pageCount=0;
    int count=goodsBean.getAllPageBySort(sortName);
    int rows=goodsBean.getRowCount();
    Collection arraylist=goodsBean.getGoodsBySort(sortName, pageCount);
    Iterator it=arraylist.iterator();
    %>
    
    <!-- 第一个table -->
    <table cellSpacing=0 cellPadding=0 width="100%" border=0>
    <tbody>
    	<tr><td background=index/img/headline.jpg height=1></td></tr>
    	<tr>
    		<td height=22>
    			<div align="center">
    			<%
    			/* 根据session中保存的标识来选择显示的欢迎文字 */
    			String s1=request.getParameter("exit");
    			String s=(String)session.getAttribute("isLogin_user");
    			if(s1==null){
    				if(s!=null){
    					if(s.equals("true")){
    						out.print("登录成功，"+session.getAttribute("name")+"您好，欢迎您使用本网站，希望您在这里购物愉快~~");
    					}
    					if(s.equals("false")){
    						out.print("对不起,您输入的用户名密码有误，请核对后重新登录!!");
    					}
    				}
    				else{
    					out.print("顾客您好，购买美味的饭菜请先登录~~~");
    				}
    			}
    			else{
    				session.removeAttribute("name");
    				out.print("顾客您好，购买美味的饭菜请先登录~~~");
    			}
    			%>
    			</div>
    		</td>
    	</tr>
    	<tr>
    	<td background=index/img/headline.jpg height=1></td>
    	</tr>
    </tbody>
    </table>
    
    <!-- 第二个table -->
     <table cellSpacing=0 cellPadding=0 width="100%" border=0>
     <tbody>
     <tr><td colSpan=4><font color=#ff0000><font color=#333399>商品分类：</font></font>
     	【<a href="index/index.html">美食</a>】	【<%=sortName %>】</td></tr>
     <tr><td background=index/img/headline.jpg colSpan=4 height=1></td>
     </tr>	
     </tbody>
     </table>
    <p></p>
    
    <!-- 第三table -->
     <table cellSpacing=0 cellPadding=0 width="19%">
     <tbody>
     	<tr>
     	<%
     	//循环显示查询结果
     	int i=0;
     	String str="index/img/headline.jpg";
     	while(it.hasNext()){
     		GoodsClass temp=(GoodsClass)it.next();
     	%>
     	
     	<td><span class="style1">aaaaa</span></td>
     	<td><div align="center"><a href='1.jsp?goodsId=<%=temp.getGoodsId() %>' target=_self><img height=100 alt=宫保鸡丁
     	<% str="image/"+temp.getGoodsId()+".jpg"; %> src=<%=str %> width=100 border=1/></a>
     	<a href='1.jsp?goodsId=<%=temp.getGoodsId() %>' target=_self><br/><%=temp.getGoodsName() %></a><br/>
     	西安市区价：<font color=#ff6600><br/><%=temp.getGoodsPrice() %>元<br/></font>
     	<a href='1.jsp?goodsId=<%=temp.getGoodsId() %>' target=_self><img height=17 src="loveImage/detail.gif" width=40 border=0/></a></div></td>
     	<td><span class="style1">aaaa</span></td>
     	
     	<%
     	i++;
     	if(i%4==0){
     	%>
     	<tr>
     	
     	<%
     		}
     	}
     	%>
     	</tr>
     </tbody>
     </table>
    
    <!-- 设置分页机制 -->
    <p>页次：<%=pageCount+1 %>/<%=count %>页共有<%=rows %>种商品
    <a href="index/index.html">首页</a>-
    <a href="love1.jsp?pages=<%=pageCount+1 %>">上一页-</a>
    <a href="love1.jsp?pages=<%=pageCount+1 %>">下一页-</a>
    <a href="love1.jsp?pages=<%=pageCount-1 %>">末页</a>
    <%
    for(int j=0;j<count;j++){
    %>
    <a href="love1.jsp?pages=<%=j %>">[<%=j+1 %>]</a>
    <% } %>
    </p>
    
    
  </body>
</html>
