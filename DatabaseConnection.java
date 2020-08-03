package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	public static Connection getCon() {
		// TODO Auto-generated method stub
		Connection con =null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/bank","root","root"); 
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		 

	}

}