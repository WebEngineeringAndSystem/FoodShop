package com.test;

import java.sql.*;

public class Demo3 {

	public static void main(String[] args) {

		PreparedStatement ps=null;
		Connection ct=null;
		ResultSet rs=null;
		
		try {
			//jdbc4.0中，都有自己的驱动jar包
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			ct=DriverManager.getConnection(
					"jdbc:sqlserver://localhost:1433;DatabaseName=PIM","sa","zhang");

			ps=ct.prepareStatement("select * from aa");

			rs=ps.executeQuery();
			while(rs.next()){
				System.out.print(rs.getInt(1)+" ");
				System.out.print(rs.getString(2)+" ");
				System.out.print(rs.getInt(3));
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
