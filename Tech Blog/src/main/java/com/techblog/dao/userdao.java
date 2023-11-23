package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;
import com.techblog.entities.user;

// this calss is use to interact the db
public class userdao {
	private Connection con;
	
	

	public userdao(Connection con) {
		
		this.con = con;
	}
	
	
//	method to insert user data to db
	public boolean saveuser(user user) {
		boolean f=false;
		try {
//			user--->data base
			String q = "insert into user_info(name,email,password,number,occupation,about,state,city)values(?,?,?,?,?,?,?,?)";
		    PreparedStatement pst=this.con.prepareStatement(q);
		    
		    pst.setString(1, user.getUsername());
		    pst.setString(2, user.getUseremail());
		    pst.setString(3, user.getPw());
		    pst.setString(4, user.getnumber());
		    pst.setString(5, user.getoccupation());
		    pst.setString(6, user.getabout());
		   
		    pst.setString(7, user.getStats());
		    pst.setString(8, user.getCity());
		  
		    
		    pst.executeUpdate();
		    f=true;
		    
		    
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
//	get user by its email and pasword this return user
	
	public user getuser(String useremail, String pw) {
		user  user = null;
		
		try {
			
//			fetching user from database so write query
			
			String q = "select * from user_info where email=? and password=?";
			
//			put value of ? through prepared statement
			
			PreparedStatement pst = con.prepareStatement(q);
			
			pst.setString(1, useremail);
			pst.setString(2, pw);
			
			 ResultSet set = pst.executeQuery();
			 
			 if(set.next()) {
				user = new user();
//              taking data from db				 
				String username = set.getString("name");
//				set data to user obj
				user.setUsername(username);
				
//				All the data is fetched from db and set in a user obj 
				user.setId(set.getInt("userid"));
				user.setUseremail(set.getString("email"));
				user.setPw(set.getString("password"));
				user.setnumber(set.getString("number"));
				user.setoccupation(set.getString("occupation"));
				user.setabout(set.getString("about"));
				
				user.setStats(set.getString("state"));
				user.setCity(set.getString("city"));
				
				
			 }
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
		
	}
		
	
	public boolean updateuser(user u) {
		boolean f=false;
		try {
			String q ="update user_info set email=? , number=? , password=? , occupation=? , about=? where userid=?";
			PreparedStatement p = con.prepareStatement(q);
			
			p.setString(1, u.getUseremail());
			p.setString(2, u.getnumber());
			p.setString(3, u.getPw());
			p.setString(4, u.getoccupation());
			p.setString(5, u.getabout());
			p.setInt(6, u.getId());
			
			p.executeUpdate();
			
			
			
			f=true;
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	public user getuserbyuserid(int userid) {
		user user = new user();
		try {
			
			String q = "select * from user_info where userid=? ";
			PreparedStatement pt = this.con.prepareStatement(q);
			pt.setInt(1, userid);
			ResultSet set= pt.executeQuery();
			if(set.next()) {
				
//				All the data is fetched from db and set in a user obj 
				user.setId(set.getInt("userid"));
				user.setUseremail(set.getString("email"));
				user.setPw(set.getString("password"));
				user.setnumber(set.getString("number"));
				user.setoccupation(set.getString("occupation"));
				user.setabout(set.getString("about"));
				user.setUsername(set.getString("name"));
				user.setStats(set.getString("state"));
				user.setCity(set.getString("city"));
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
}
