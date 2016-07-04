package com.JavaBean;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

/*
 * Cart是用来封装对购物车中的商品进行添加、删除和更新等操作的JavaBean类
 */
public class Cart {
	private String name;//用户的标识
	private HashMap<String, Integer> items;//购物车中的物品
	private int orderID;
	private float totalPrice;
	private Connection con;
	int ordersId=0;
	static CallableStatement cs=null;
	static Statement st=null;
	static ResultSet rs=null;
	public int getOrderID(){
		return orderID;
	}
	public float getTotalPrice(){
		return totalPrice;
	}
	public Cart(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con= DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=FoodShop","sa","zhang");
			items=new HashMap<String, Integer>();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//定义添加商品的方法
	public void addItem(String itemId,int quantity){

		items.put(itemId, new Integer(quantity));
	}
	//定义删除商品的方法
	public void removeItem(String itemId){
		items.remove(itemId);
	}
	
	public HashMap<String, Integer> getItems(){
		return this.items;
	}
	
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return this.name;
	}
	public void Clear(){
		items.clear();
	}
	
	//生成订单并返回订单号
	public int genOrder(String s1,String s2){
		String s3=new java.util.Date().toLocaleString();
		try {
			cs=con.prepareCall("{call Pro_orders(?,?,?,?)}");
			cs.setString(1, s1);
			cs.setString(2, s2);
			cs.setString(3, s3);
			cs.registerOutParameter(4, java.sql.Types.INTEGER);;
			cs.execute();
			ordersId=cs.getInt(4);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("这次订单号：：：："+ordersId);
		return ordersId;
	}
	
	//存储当前订单物品明细
	public void saveItems(int i1,String s3,String s4,int i2){
		try {
			PreparedStatement pst=con.prepareStatement(
					"insert into ordersDetails(ordersId,goodsName,goodsPrice,goodsCount) values (?,?,?,?)");
			pst.setInt(1, i1);
			pst.setString(2, s3);
			pst.setString(3, s4);
			pst.setInt(4, i2);
			int i=pst.executeUpdate();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//计算当前购物车内物品的总价格
	public float calPrice(float totalPrice){
		return this.totalPrice=totalPrice;
	}
	
	//添加订单信息
	public void addOrder(String orderName,String totalPrice){
		try {
			String dateTime=new java.util.Date().toLocaleString();
			PreparedStatement pst=con.prepareStatement(
					"insert into orders values(?,?,?)");
			pst.setString(1, orderName);
			pst.setString(2, totalPrice);
			pst.setString(3, dateTime);
			
			int i=pst.executeUpdate();
			pst.close();
			/*Statement statement=con.createStatement();
			ResultSet rs=statement.executeQuery("select * from orders");
			if(!rs.next())
				ordersId=rs.getInt(1);
			rs.close();
			pst.close();*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*System.out.println("订单号："+ordersId);
		return ordersId;*/
	}
	
	//得到订单id
	public int genId(){
		OrdersClass orders;
		ArrayList list=new ArrayList();
		try {
			Statement statement = con.createStatement();
			ResultSet rs=statement.executeQuery("select * from orders");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	//通过用户名得到订单号
	public int getOrdersByUserName(String s){
		OrdersClass orders;
		int ordersId1 = 0;
		ArrayList arrayList=new ArrayList();
		try {
			Statement statement=con.createStatement();
			ResultSet rs=statement.executeQuery(
					"select * from orders where usersName='"+s+"'");
			while(rs.next()){
				orders=new OrdersClass();
				ordersId=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("订单号："+ordersId1);
		return ordersId1;
	}
	
}
