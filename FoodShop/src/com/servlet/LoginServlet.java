package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 校验验证码
		 * 1、从session中获取正确的验证码
		 * 2、从表单中获取用户填写的验证码
		 * 3、进行比较！
		 * 4、如果相同，向下运行，否则保存错误信息到request域中，转发到login.jsp中
		 */
		String sessionCode= (String) request.getSession().getAttribute("session_vcode");
		String paramCode=request.getParameter("verifyCode");
		
		if(!paramCode.equalsIgnoreCase(sessionCode)){
			request.setAttribute("msg", "验证码错误！");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		else{
			request.getRequestDispatcher("Customerlogin/checklogin.jsp").forward(request, response);
		}
	}
		
}
