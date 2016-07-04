<%@ page language="java" import="java.util.*,com.JavaBean.*,java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%-- <base href="<%=basePath%>"></base> --%>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<title>项目实战-Web订餐</title>
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/basic.css" />
	<link rel="stylesheet" href="css/style1.css" />
	<script type="text/javascript" src="http://libs.useso.com/js/jquery/1.7.2/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script type="text/javascript">
		function _change(){
			/*
			1、得到Image元素
			2、修改其src为/Day11_3/VerifyCodeServlet
			*/
			
			var imgEle=document.getElementById("image");
			
			imgEle.src="/Day11_3/VerifyCodeServlet?a=" + new Date().getTime();
		}
	
	</script>
	
	</head>
	
	<body>

	<header id="header">
		<div class="sec-center">
	    	<h1 class="h1-logo">Web订餐</h1>
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

	<div id="search">
	
	<p align="center">
	<font size=5 face="宋体">
	<%
	/* 根据session中保存的标识来选择显示的欢迎文字 */
	String s1=request.getParameter("exit");
	String s=(String)session.getAttribute("isLogin_user");
	if(s1==null){
		if(s!=null){
			if(s.equals("true")){
				out.print("登录成功，");
				%>
				<font color="red" size=6 face="华文新魏"><%=session.getAttribute("name") %></font>
				<%
				out.print("您好，欢迎您使用本网站，希望您在这里购物愉快~~");
			}
			if(s.equals("false")){%>
			<font color="grey"><%
				out.print("对不起,您输入的用户名密码有误，请核对后重新登录!!");
				%></font>
				<%
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
	%></font></p>
    			
	<div class="sec-center"></div>
    <div id="main">
	<div class="demo">
		<nav class="main_nav">
			<ul>
				<li style="list-style-type:none"><a class="cd-signin" href="#0">登录</a></li>
				<li style="list-style-type:none"><a class="cd-signup" href="#0">注册</a></li>
			</ul>
		</nav>
	</div>
	<div class="cd-user-modal"> 
		<div class="cd-user-modal-container">
			<ul class="cd-switcher">
				<li><a href="#0">用户登录</a></li>
				<li><a href="#0">注册新用户</a></li>
			</ul>

			<div id="cd-login"> <!-- 登录表单 -->
				<form class="cd-form" action="Customerlogin/checklogin.jsp" method="post">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signin-username">用户名</label>
						<input class="full-width has-padding has-border" id="signin-username" type="text" placeholder="输入用户名" name="usersName" />
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">密码</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="输入密码" name="usersPass" />
					</p>
					
					<!-- 插入验证码 -->
				 	<p class="fieldset">
						<input class="full-width has-padding has-border" type="text" placeholder="输入验证码" name="verifyCode" size="3"/>
				    	<img id="image" src="/FoodShop/VerifyCodeServlet" />
				    	<a href="javascript:_change()">换一张</a>
					</p> 

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked/>
						<label for="remember-me">记住登录状态</label>
					</p>

					<p class="fieldset">
						<input class="full-width2" type="submit" value="登 录">
					</p>
				</form>
			</div>

			<div id="cd-signup"> <!-- 注册表单 -->
				<form class="cd-form" action="Customerlogin/addUserInfo.jsp" name=userinfo method="post">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">用户名</label>
						<input class="full-width has-padding has-border" type="text" type="text" placeholder="输入用户名" id=usersName  name=usersName />
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-email">密码</label>
						<input class="full-width has-padding has-border" type="text"  placeholder="输入密码" id=usersPass  name=usersPass />
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">邮箱</label>
						<input class="full-width has-padding has-border" type="email"  placeholder="输入mail" id=usersE_mail name=usersE_mail />
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">我已阅读并同意 <a href="#0">用户协议</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width2" type="submit" value="注册新用户"/>
					</p>
				</form>
			</div>

			<a href="#0" class="cd-close-form">关闭</a>
		</div>
	</div> 
	
   <div class="ad_76090"><script src="/js/ad_js/bd_76090.js" type="text/javascript"></script></div><br/>
</div>
</div>

<div id="food">
	<section class="center">
    	<h2>热门美食</h2>
        <p>大家都在点单的美食,有来自全国各地的美食，异域风情，让你看到口水直流</p>
    </section>
    
 
    <figure>
    <form action="cart/1.jsp" method="get">
    	<div style="display:none"><input name="goodsId" value="1001"/></div>
    	<input src="img/1001.jpg" type="image"/><!-- <img src="img/1001.jpg" alt="红烧排骨" /> -->
        <figcaption><strong class="title">&lt;红烧排骨&gt;</strong> 此菜味道香咸，排骨酥烂，色泽金红。男女老少人都可食用。适宜于 气血不足，阴虚纳差者</figcaption>
		<div>
			<em class="sat">满意度 99%</em>
			<span class="price">￥ <strong>49</strong> </span>
		</div>
		<div class="type">店长推荐</div>
		<!-- <div align="center"><input type="submit" value="点击查看详细信息"/></div> -->
    </form>
    </figure>
    <figure>
     <form action="cart/1.jsp" method="get">
    <div style="display:none"><input name="goodsId" value="1002"/></div>
    	<input src="img/1002.jpg" type="image"/><!-- <img src="img/1002.jpg" alt="红烧鱼" /> -->
        <figcaption><strong class="title">&lt;红烧鱼&gt;</strong> 鱼不仅味道鲜美，而且营养价值极高。其蛋白质含量为猪肉的2倍，且属于优质蛋白，人体吸收率高</figcaption>
		<div>
			<em class="sat">满意度 98%</em>
			<span class="price">￥ <strong>59</strong> </span>
		</div>
		<div class="type">店长推荐</div>
		<!-- <div align="center"><input type="submit" value="点击查看详细信息"/></div> -->
    </form>
    </figure>
    <figure>
   <form action="cart/1.jsp" method="get">
   <div style="display:none"> <input name="goodsId" value="2001"/></div>
    	<input src="img/2001.jpg" type="image"/><!-- <img src="img/2001.jpg" alt="卤猪耳" /> -->
        <figcaption><strong class="title">&lt;卤猪耳&gt;</strong>卤猪耳是一道由卤猪耳朵，蒜仁等食材制成的美食</figcaption>
		<div>
			<em class="sat">满意度 99%</em>
			<span class="price">￥ <strong>39</strong> </span>
		</div>
		<div class="type">店长推荐</div>
		<!-- <div align="center"><input type="submit" value="点击查看详细信息"/></div> -->
	</form>
    </figure>
     <figure>
     <form action="cart/1.jsp" method="get">
    	<div style="display:none"><input name="goodsId" value="3001"/></div>
    	<input src="img/3001.jpg" type="image"/><!-- <img src="img/3001.jpg" alt="手抓肉" /> -->
        <figcaption><strong class="title">&lt;手抓肉&gt;</strong> 肉味道清纯软嫩，油香不腻，既可吃肉，又可喝汤，是本地人招待来客的美食</figcaption>
		<div>
			<em class="sat">满意度 96%</em>
			<span class="price">￥ <strong>59</strong> </span>
		</div>
		<div class="type">网友推荐</div>
		<!-- <div align="center"><input type="submit" value="点击查看详细信息"/></div> -->
		</form>
    </figure>
    <figure>
    <form action="cart/1.jsp" method="get">
    	<div style="display:none"><input name="goodsId" value="3002"/></div>
    	<input src="img/3002.jpg" type="image"/><!-- <img src="img/3002.jpg" alt="四喜丸子" /> -->
        <figcaption><strong class="title">&lt;四喜丸子&gt;</strong>四喜丸子是经典的汉族传统名菜之一，属于鲁菜菜系。四个色、香、味俱佳的肉丸</figcaption>
		<div>
			<em class="sat">满意度99%</em>
			<span class="price">￥ <strong>29</strong> </span>
		</div>
		<div class="type">店长推荐</div>
		<!-- <div align="center"><input type="submit" value="点击查看详细信息"/></div> -->
		</form>
    </figure>
    <figure>
    <form action="cart/1.jsp" method="get">
    	<div style="display:none"><input name="goodsId" value="3003"/></div>
    	<input src="img/3003.jpg" type="image"/><!-- <img src="img/3003.jpg" alt="玉米排骨" /> -->
        <figcaption><strong class="title">&lt;玉米排骨&gt;</strong> 玉米排骨汤是一道食补汤品,降低血液胆固醇浓度并防止其沉积于血管壁</figcaption>
		<div>
			<em class="sat">满意度 97%</em>
			<span class="price">￥ <strong>39</strong> </span>
		</div>
		<div class="type">养生滋补</div>
		<!-- <div align="center"><input type="submit" value="点击查看详细信息"/></div> -->
		</form>
    </figure>
     <figure>
     <form action="cart/1.jsp" method="get">
    	<div style="display:none"><input name="goodsId" value="3004"/></div>
    	<input src="img/3004.jpg" type="image"/>
    	<!-- <img src="img/mpdf.jpg" alt="麻婆豆腐" /> -->
        <figcaption><strong class="title">&lt;麻婆豆腐&gt;</strong> 色深红亮，红白绿相衬，豆腐形整不烂，吃起来具有麻、辣、烫、嫩、酥、香、鲜等风味</figcaption>
		<div>
			<em class="sat">满意度 96%</em>
			<span class="price">￥ <strong>19</strong> </span>
		</div>
		<div class="type">辣的畅快</div>
		</form>
    </figure>
    <figure><form action="cart/1.jsp" method="get">
    	<div style="display:none"><input name="goodsId" value="4001"/></div>
    	<input src="img/4001.jpg" type="image"/>
    	<!-- <img src="img/hsr.jpg" alt="红烧肉" /> -->
        <figcaption><strong class="title">&lt;红烧肉&gt;</strong>以砂锅为主，肥瘦相间，香甜松软，色香味俱全，入口即化</figcaption>
		<div>
			<em class="sat">满意度 98%</em>
			<span class="price">￥ <strong>39</strong> </span>
		</div>
		<div class="type">网友推荐</div>
		</form>
    </figure>
    <figure>
    <form action="cart/1.jsp" method="get">
    	<div style="display:none"><input name="goodsId" value="4002"/></div>
    	<input src="img/4002.jpg" type="image"/>
    	<!-- <img src="img/bjky.jpg" alt="北京烤鸭" /> -->
        <figcaption><strong class="title">&lt;北京烤鸭&gt;</strong> 色泽红润，肉质肥而不腻，外脆里嫩,肉质细嫩，味道醇厚</figcaption>
		<div>
			<em class="sat">满意度 95%</em>
			<span class="price">￥ <strong>69</strong> </span>
		</div>
		<div class="type">销量排行</div>
		</form>
    </figure> 
</div>

<footer id="footer">
	<div class="top">
    	<div class="block">
        	<h2>合作伙伴</h2>
			<hr>
        	<ul>
				<li><a href="http://www.meituan.com">美团外卖</a></li>
				<li><a href="http://www.baiduwaimai.com">百度外卖</a></li>
				<li><a href="http://www.ele.me.com">饿了么</a></li>
				<li><a href="http://www.muomi.com">百度糯米</a></li>
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
<p id="stat"><script type="text/javascript" src="/js/tongji.js"></script></p>
</body>
</html>
