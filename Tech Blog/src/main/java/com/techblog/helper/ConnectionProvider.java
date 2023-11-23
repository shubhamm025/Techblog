package com.techblog.helper;

import java.sql.Connection;
import java.sql.DriverManager; 

public class ConnectionProvider {
        public static Connection con;
	
public static Connection getConnection() {
	
	try {
		

		Class.forName("com.mysql.cj.jdbc.Driver");
		 con =DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","Shubham25");
	
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	
	
	 
		
	
}
	return con;




}
}
	

