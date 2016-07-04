package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

/*
 * sql server数据库存储过程测试
 */
public class Demo2 {
	@Test
	public void fun1(){
		Connection ct=null;
		CallableStatement cs=null;
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			ct=DriverManager.getConnection(
					"jdbc:sqlserver://localhost:1433;DatabaseName=PIM","sa","zhang");

			cs=ct.prepareCall("{call Pro_aa(?,?,?)}");
			cs.setString(1, "zhangruitao");
			cs.setInt(2, 1234567);
			cs.registerOutParameter(3, java.sql.Types.INTEGER);
			cs.execute();
			int i=cs.getInt(3);
			
			System.out.println("得到输出结果："+i);
			cs.close();
			ct.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
