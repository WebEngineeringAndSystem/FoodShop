package com.JavaBean;

import java.sql.*;
import java.util.*;

public class UserBean {

	private Connection con;
	UserClass user;
	//建立数据库连接
	public UserBean(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=FoodShop","sa","zhang");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setUserInfo(UserClass user){
		this.user=user;
	}
	
	//定义向数据库中添加用户注册信息的方法
	public void addUserInfo() throws Exception{
		try {
			PreparedStatement stm=con.prepareStatement(
					"insert into users values(?,?,?)");

			stm.setString(1, user.getUsersName());
			stm.setString(2, user.getUsersPass());
			stm.setString(3, user.getUsersE_mail());
			
			try {
				stm.executeQuery();
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	//定义验证用户身份的方法
	public boolean checkUserInfo() throws Exception{
		boolean flag=false;
		try {
			PreparedStatement stat=con.prepareStatement(
					"select * from users where usersName=? and usersPass=?");
			stat.setString(1, user.getUsersName());
			stat.setString(2, user.getUsersPass());
			
			System.out.println("用户添加的信息"+user.getUsersName());
			System.out.println("用户输入的密码"+user.getUsersPass());
			
			ResultSet result=stat.executeQuery();
			if(result.next()){
				flag=true;
			}
			
			System.out.println("flag="+flag);
			
			result.close();
			stat.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return flag;
	}
	
	//定义查询用户信息的方法
	public UserClass getUserInfo() throws Exception{
		UserClass user1=new UserClass();
		try {
			PreparedStatement stat=con.prepareStatement(
					"select * from users where usersName=? and usersPass=?");
			stat.setString(1, user.getUsersName());
			stat.setString(2, user.getUsersPass());
			ResultSet result=stat.executeQuery();
			while(result.next()){
				int usersid=result.getInt(1);
				String name=result.getString(2);
				String pass=result.getString(3);
				String email=result.getString(4);
				user1.setUsersId(usersid);
				user1.setUsersName(name);
				user1.setUsersPass(pass);
				user1.setUsersE_mail(email);
			}
			result.close();
			stat.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return user1;
	}
	
	//定义得到全部注册用户的信息
	public Collection getAllUserInfo(){
		UserClass userClass=new UserClass();
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement();
			ResultSet resultSet=statement.executeQuery(
					"select * from users");
			while(resultSet.next()){
				userClass=new UserClass();
				int usersid=resultSet.getInt(1);
				String name=resultSet.getString(2);
				String pass=resultSet.getString(3);
				String email=resultSet.getString(4);
				userClass.setUsersId(usersid);
				userClass.setUsersName(name);
				userClass.setUsersPass(pass);
				userClass.setUsersE_mail(email);
				
				arraylist.add(userClass);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义根据用户ID查询用户信息的方法
	public Collection getUserByUserId(String s){
		int i1=Integer.parseInt(s);
		UserClass userClass=new UserClass();
		ArrayList arraylist=new ArrayList();
		try {
			PreparedStatement statement=con.prepareStatement(
					"select * from users where usersId='"+i1+"'");
			ResultSet resultSet=statement.executeQuery();
			while(resultSet.next()){
				int usersid=resultSet.getInt(1);
				String name=resultSet.getString(2);
				String pass=resultSet.getString(3);
				String email=resultSet.getString(10);
				userClass.setUsersId(usersid);
				userClass.setUsersName(name);
				userClass.setUsersPass(pass);
				userClass.setUsersE_mail(email);
				
				arraylist.add(userClass);
			}
			resultSet.close();
			statement.close();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义根据用户名字查询用户信息的方法
	public Collection getUserByUserName(String s){
		UserClass userClass=new UserClass();
		ArrayList arraylist=new ArrayList();
		try {
			PreparedStatement statement=con.prepareStatement(
					"select * from users where usersName='"+s+"'");
			ResultSet resultSet=statement.executeQuery();
			while(resultSet.next()){
				int usersid=resultSet.getInt(1);
				String name=resultSet.getString(2);
				String pass=resultSet.getString(3);
				String repass=resultSet.getString(4);
				String question=resultSet.getString(5);
				String reply=resultSet.getString(6);
				String truename=resultSet.getString(7);
				String address=resultSet.getString(8);
				String phone=resultSet.getString(9);
				String email=resultSet.getString(10);
				userClass.setUsersId(usersid);
				userClass.setUsersName(name);
				userClass.setUsersPass(pass);
				userClass.setUsersPass(phone);
				userClass.setUsersE_mail(email);
				
				arraylist.add(userClass);
			}
			resultSet.close();
			statement.close();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义删除注册用户的方法
	public void deleteUser(String s){
		try {
			int i=Integer.parseInt(s);
			Statement statement=con.createStatement();
			statement.execute("delete from users where usersId='"+i+"'");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
