package com.JavaBean;

import java.util.*;
import java.sql.*;

public class GoodsBean {
	private Connection con;
	PageNumber  pageNumber=new PageNumber();
	int rowCount=1;
	int showPage=16;
	int pageCount=1;
	//构造函数中建立数据库连接
	public GoodsBean(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con= DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=FoodShop","sa","zhang");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getRowCount(){
		return rowCount;
	}
	
	//定义获得全部查询商品信息的方法
	public int getAllPage(){
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from Goods");
			resultset.last();
			rowCount=resultset.getRow();
			pageNumber.setPageCount(rowCount, showPage);
			pageCount=pageNumber.getPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageCount;
	}
	
	//定义根据商品类型获得商品信息的方法
	public int getAllPageBySort(String s){
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where sortName='"+s+"'");
			resultset.last();
			rowCount=resultset.getRow();
			pageNumber.setPageCount(rowCount, pageCount);
			
			pageCount=pageNumber.getPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageCount;
	}
	
	//定义根据商品价格获得商品信息的方法
	public int getAllPageByPrice(String s){
		int a=s.indexOf("-");
		float one=Float.parseFloat(s.substring(0, a));
		float two=Float.parseFloat(s.substring(a+1));
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsPrice between "+one+" and "+two);
			resultset.last();
			rowCount=resultset.getRow();
			pageNumber.setPageCount(rowCount, pageCount);
			
			pageCount=pageNumber.getPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageCount;
	}
	
	//定义根据商品食材获得商品信息的方法
	public int getAllPageByMaterial(String s){
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsmaterial like '%"+s+"%'");
			resultset.last();
			rowCount=resultset.getRow();
			pageNumber.setPageCount(rowCount, pageCount);
			
			pageCount=pageNumber.getPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageCount;
	}
	
	//定义分页显示所有商品信息的方法
	public Collection getAllGoods(int s){
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods");
			int count=0;
			
			if(s!=0){
				resultset.absolute(s*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义分页显示根据商品类型获得商品信息的方法
	public Collection getGoodsBySort(String s,int pageCount){
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where sortName='"+s+"'");
			int count=0;
			
			if(pageCount!=0){
				resultset.absolute(pageCount*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义分页显示根据商品价格获得商品信息的方法
	public Collection getGoodsByPrice(String s,int pageCount){
		int a=s.indexOf("-");
		float one=Float.parseFloat(s.substring(0, a));
		float two=Float.parseFloat(s.substring(a+1));
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsPrice between "+one+" and "+two);
			int count=0;
			
			if(pageCount!=0){
				resultset.absolute(pageCount*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义分页显示根据商品食材获得商品信息的方法
	public Collection getGoodsByMaterial(String s,int pageCount){
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsmaterial like '%"+s+"%'");
			int count=0;
			
			if(pageCount!=0){
				resultset.absolute(pageCount*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义根据商品ID获得商品信息的方法
	public Collection getGoodsByGoodsId(String s){
		int i1=Integer.parseInt(s);
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsId="+i1);
			int count=0;
			
			if(pageCount!=0){
				resultset.absolute(pageCount*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//根据商品名称获得商品信息的方法
	public Collection getGoodsByGoodsName(String s){
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsName='"+s+"'");
			int count=0;
			
			if(pageCount!=0){
				resultset.absolute(pageCount*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义根据商品销售价格获得商品信息的方法
	public Collection getGoodsByGoodsPrice(String s){
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsPrice='"+s+"'");
			int count=0;
			
			if(pageCount!=0){
				resultset.absolute(pageCount*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义根据商品名称和类型联合查询获得商品信息的方法
	public Collection getGoodsByLowerSelect(String m,String n){
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=statement.executeQuery("select * from goods where goodsName like '%"+m+"%' and sortName like '%"+n+"%'");
			int count=0;
			
			if(pageCount!=0){
				resultset.absolute(pageCount*16);
			}
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				count++;
				if(count==16){
					break;
				}
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义根据商品名称、类型和价格联合查询获得商品信息的方法
	public Collection getGoodsByHeightSelect(String m,String n,String x,String y){
		GoodsClass goods;
		ArrayList arraylist=new ArrayList();
		try {
			Statement statement=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet resultset=null;
			if(n.equals("商品名称")){
				resultset=statement.executeQuery("select * from goods where goodsName like '%"+m+"%' and sortName like '%"+y+"%' and (goodsPrice between 0 and "+x+")");
			}
			else if(n.equals("品牌")){
				resultset=statement.executeQuery("select * from goods where goodsName like '%"+m+"%' and sortName like '%"+y+"%' and (goodsPrice between 0 and "+x+")");
			}
			else if(n.equals("食材")){
				resultset=statement.executeQuery("select * from goods where goodsName like '%"+m+"%' and sortName like '%"+y+"%' and (goodsPrice between 0 and "+x+")");
			}

			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
				
				arraylist.add(goods);
				
			}
			statement.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arraylist;
	}
	
	//定义添加商品信息的方法
	public void addGoods(GoodsClass goods){
		try {
			PreparedStatement ps = con.prepareStatement(
					"insert into goods values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, goods.getGoodsId());
			ps.setString(2, goods.getGoodsName());
			ps.setString(3, goods.getGoodsmaterial());
			ps.setString(4, goods.getGoodsPackage());
			ps.setString(5, goods.getGoodsLanguage());
			ps.setFloat(6, goods.getGoodsPrice());
			ps.setString(7, goods.getGoodsCent());
			ps.setString(8, goods.getGoodsScope());
			ps.setString(9, goods.getGoodsPlace());
			ps.setString(10, goods.getGoodsHabitus());
			ps.setString(11, goods.getSortName());

			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//定义获取商品信息的方法
	public GoodsClass getGoodsInfo(String s){
		GoodsClass goods=new GoodsClass();
		try {
			Statement statement=con.createStatement();
			ResultSet resultset=statement.executeQuery("select * from goods where goodId='"+s+"'");
			
			while(resultset.next()){
				goods =new GoodsClass();
				int i=resultset.getInt(1);
				String s1=resultset.getString(2);
				String s2=resultset.getString(3);
				String s3=resultset.getString(4);
				String s4=resultset.getString(5);
				float f=resultset.getFloat(6);
				String s5=resultset.getString(7);
				String s6=resultset.getString(8);
				String s7=resultset.getString(9);
				String s8=resultset.getString(10);
				String s9=resultset.getString(11);
				
				goods.setGoodsId(i);
				goods.setGoodsName(s1);
				goods.setGoodsmaterial(s2);
				goods.setGoodsPackage(s3);
				goods.setGoodsLanguage(s4);
				goods.setGoodsPrice(f);
				goods.setGoodsCent(s5);
				goods.setGoodsScope(s6);
				goods.setGoodsPlace(s7);
				goods.setGoodsHabitus(s8);
				goods.setSortName(s9);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return goods;
	}
	
	//定义删除商品信息
	public void deleteGoods(String s){
		try {
			int i=Integer.parseInt(s);
			Statement statement=con.createStatement();
			statement.execute("delete from goods where goodsId='"+s+"'");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//定义修改商品信息的方法
	public void modifyGoods(GoodsClass goods){
		try {
			PreparedStatement ps = con.prepareStatement(
					"update goods set goodsName=?,goodsmaterial=?,goodsPackage=?,"
					+ "goodsLanguage=?,goodsPrice=?,goodsCent=?,goodsScope=?,goodsPlace=?,goodsHabitus=?,sortName=? where goodsId=?");
			
			ps.setString(1, goods.getGoodsName());
			ps.setString(2, goods.getGoodsmaterial());
			ps.setString(3, goods.getGoodsPackage());
			ps.setString(4, goods.getGoodsLanguage());
			ps.setFloat(5, goods.getGoodsPrice());
			ps.setString(6, goods.getGoodsCent());
			ps.setString(7, goods.getGoodsScope());
			ps.setString(8, goods.getGoodsPlace());
			ps.setString(9, goods.getGoodsHabitus());
			ps.setString(10, goods.getSortName());
			ps.setInt(11, goods.getGoodsId());

			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
