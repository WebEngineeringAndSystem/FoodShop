<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>register</title>
    
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
    <!-- 填写用户注册信息的页面 -->
    <table cellSpacing=0 cellPadding=0 width=812 align=center
    bgColor=#ffffff border=0>
    <tbody>
    <!-- 第一行 -->
    	<tr>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=38 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=63 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=59 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=56 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=62 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=16 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=44 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=77 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=82 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=77 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=80 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=72 border=0/></td>
    		<td><img height=1 alt="" src="registerImage/spacer.png" width=34 border=0/></td>	
    	</tr>
   	<!-- 第二行 -->
    	<tr>
    		<td colSpan=6 rowSpan=2>
    		<img height=79 alt="" src="registerImage/title_r1_c1.gif"
    		width=194 border=0 name=title_r1_c1></td>
    		<td bgColor=#ffffff colSpan=7>
    		<div align="right"><a name=top></a><a href="cart.jsp">
    		<img height=15 alt="" src="blessingImage/top_cart.png" width=32 border=0>购物车
    		</a><a onfocus=this.blur() href="checkMyInfo.jsp"><img height=15 alt="" src="registerImage/top_my.png" width=32 border=0>我的账户</a>
    		<a onfocus=this.blur() href="../tourist/help.jsp"><img height=15 alt="" src="registerImage/top_fag。png" width=32 border=0>帮助中心</a>
    		<a onfocus=this.blur() href="../index.jsp?exit=yes"><img height=15 alt="" src="registerImage/top_wh.png" width=32 border=0>注册退出</a>	
			</div></td>
    	</tr>
   	<!-- 第三行 -->
    	<tr>
    		<td bgColor=#ffffff colSpan=7>
    			<table height=44 celSpacing=0 cellPadding=0 width="61%" align=right border=0>
    				<tbody>
    					<tr>
    					<td><div align=left>订餐热线：88888888</div></td>
    					</tr>
    					<tr><td><div align=left>订餐：Q&nbsp;Q:12345678</div></td></tr>
    				</tbody>
    			</table>
    		</td>
    	</tr>	
    <!-- 第四行 -->
    	<tr>
    		<td><img height=27 alt="" src="../registerImage/title_r2_c1.gif" width=38 border=0 name=title_r2_c1></td>
    		<td><a href="login/login.jsp"><img height=27 alt="" src="../registerImage/title_r2_c2.gif" width=63 border=0 name=title_r2_c2>首页</a></td>
    		<td colspan="11"><a href="../tourist/produceInfo.jsp"><img height=27 alt="" src="../blessingImage/title_r2_c10.gif" width=77 border=0 name=title_r2_c10>企业商务</a>
    		<a href="../tourist/language.jsp"><img height=27 alt="" src="../blessingImage/title_r2_c11.gif" width=80 border=0 name=title_r2_c11>在线留言</a>
    		<a href="../tourist/foodslanguage.jsp"><img height=27 alt="" src="../blessingImage/title_r2_c12.gif" width=72 border=0 name=title_r2_c12>评价</a>
    		<img height=27 alt="" src="../registerImage/title_r2_c13.gif" width=482 border=0 name=title_r2_c13></td>
    	</tr>
    </tbody>
    </table>
    
    <!-- 第二部分 -->
    <table cellSpacing=0 cellPadding=0 width=812 align=center backgroud="../registerImage/bj_x.gif border=0">
    	<tbody>
    		<tr>
    			<td height=1></td>
    		</tr>
    	</tbody>
    </table>
    <!-- 第三部分 -->
    <table cellSpacing=0 cellPadding=0 width=812 align=center border=0">
    	<tbody>
    		<tr>
    			<td style="padding-top:10px; letter-spacing:1px" height=40><font color=#7f7f7f>
    			您的位置：<span style="font-family:Arial">Home</span>&gt;新会员注册</font></td>
    		</tr>
    	</tbody>
    </table>
    <!-- 第四部分 -->
    <table cellSpacing=0 cellPadding=0 width=812 align=center border=0>
    <tbody>
    	<tr>
    		<td><form action="Customerlogin/addUserInfo.jsp" name=userinfo method="post">
    			<table height=321 cellSpacing=1 cellPadding=2 width=812 align=center border=0>
    				<tbody>
    					<tr bgColor=#a4ffb8><td cloSpan=2>
    						<div align=left><font color=#4ea3a5><b> </b></font><b>
    						<span class=style3>会员注册</span></b></div>
    					</td></tr>
    					
    					<!-- 用户名 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>用户名：</font></div></td>
    					<td width="76%"><div align=left><input id=usersName  name=usersName 
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20;/><font color=red>*</font>中文或英文，请勿有空格</div></td></tr>
    					<!-- 密码 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>密&nbsp;码：</font></div></td>
    					<td width="76%"><div align=left><input type=password id=usersPass  name=usersPass
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20;/><font color=red>*</font>长度必须大于6个字符小于20个字符</div></td></tr>
    					<!-- 确认密码 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>确认密码：</font></div></td>
    					<td width="76%"><div align=left><input type=password id=usersRepass name=usersRepass 
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20;/><font color=red>*</font>请再次输入密码，以免设置密码出错</div></td></tr>
    					<!-- 密码提问 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>密码提问：</font></div></td>
    					<td width="76%"><div align=left><input id=usersPassQuestion  name=usersPassQuestion
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20; />用于遗忘密码时，可不填</div></td></tr>
    					<!-- 密码答案 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>密码答案：</font></div></td>
    					<td width="76%"><div align=left><input id=usersPassReply  name=usersPassReply
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20/>可不填</div></td></tr>
    					<!-- 填写个人信息 -->
    					<tr bgColor=#a4ffb8><td cloSpan=2>
    						<div align=left><font color=#4ea3a5><b> </b></font><b>
    						<span class=style3>填写您的个人信息</span></b></div>
    					</td></tr>
    					<!-- 真实姓名 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>真实姓名：</font></div></td>
    					<td width="76%"><div align=left><input id=usersTrueName  name=usersTrueName
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20/><font color=red>*</font>送餐时我们将向接收认说出</div></td></tr>
    					<!-- 联系地址 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>联系地址：</font></div></td>
    					<td width="76%"><div align=left><input id=usersAddress name=usersAddress
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20;/><font color=red>*</font>可简单填写，比如西安市长安区</div></td></tr>
    					<!-- 联系电话 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>联系电话：</font></div></td>
    					<td width="76%"><div align=left><input id=usersPhone name=usersPhone 
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20;/><font color=red>*</font>很重要，一定要重要填写~~~~</div></td></tr>
    					<!-- 电子邮件 -->
    					<tr bgColor=#fcfcfc><td width="24%"><div align=center><font color=#cb6f00>电子邮箱：</font></div></td>
    					<td width="76%"><div align=left><input id=usersE_mail name=usersE_mail 
    					style="border-right:#ffffff 1px groove;border-top:#ffffff 1px groove;
    					border-left:#ffffff 1px groove;color:#333333;border-bottom:#ffffff 1px groove;
    					height:18px; background-color:#ffcc66" maxLength=20/><font color=red>*</font>填写您的电子邮件，方便联系（格式一定是xxx@xxx.xxx）</div></td></tr>
    					<!-- 提交 -->
    					<tr bgColor=#fcfcfc><td align=middle colSpan=2><br><input type="submit"
    					value="提交信息" onClick="checkuserInfo();"/>（带<font Color=red>*</font>为必填项）</td></tr>
    				</tbody>
    			</table>
    		</form></td>
    	</tr>
    </tbody>
    </table><br/>
    <strong></strong>
    
    <!-- 最后一部分 -->
    <table cellSpacing=0 cellPadding=0 width=812 align=center bgColor=#e0e0e0 border=0>
    	<tbody>
    		<tr><td>&nbsp;</td></tr>
    	</tbody>
    </table>
    <table width=812 height=48 border=0 align=center cellSpacing=0 cellPadding=0>
    	<tbody>
    		<tr><td height=16 bgColor=#f5f5f5><div align="center"><span class=cfont><font color=#7f7f7f>
    		<b><a href="../admin/CheckLogin.jsp">管理员登录</a></b></font></span></div></td></tr>
    		<tr><td height=31 bgColor=#f5f5f5><div align=center>Copyright&copy;All Rights Reserved</div></td></tr>
    	</tbody>
    </table>
    <p>&nbsp;</p>
  </body>
  
  	<script type="text/javascript">
  	function checkspace(checkstr){
  		var str='';
  		for(var i=0;i<checkstr.length;i++){
  			str=str+' ';
  		}
  		return (str==checkstr);
  	}
  	
	function checkuserInfo(){
		if(document.getElementById("usersPass")>3){
			document.getElementById("usersPass").focus();
			alert("对不起，请填写用户名！");
			return false;
		}
		
	}
	</script>
</html>