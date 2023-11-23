package com.techblog.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.techblog.entities.category;
import com.techblog.entities.post;
import com.techblog.helper.helper;

import jakarta.servlet.http.Part;

public class postDao {
// this class obj will manage our post data 
	
			Connection con;

			public postDao(Connection con) {
			
				this.con = con;
			}
			
			
//			to save post in db
			
			
			public boolean savepost(post p) {
				boolean f=false;
				
				try {
					String q = "insert into posts(itle,content,code,link,picture,c_id,userid) value(?,?,?,?,?,?,?)";
					
					PreparedStatement PST =con.prepareStatement(q);
					
					PST.setString(1, p.getTitle());
					PST.setString(2, p.getContent());
					PST.setString(3, p.getCode());
					PST.setString(4, p.getLink());
					PST.setString(5, p.getPicture());
					PST.setInt(6, p.getC_id());
					PST.setInt(7, p.getUserid());
					
					PST.execute();
					f=true;
					
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				return f;
				
			}

			
			
//			this function will return all the cat by fetching from data base
			public ArrayList<category> getcategories(){
				
				ArrayList<category> list = new ArrayList<>();
				
				try {
					String q = "select * from categories";
					Statement s = this.con.createStatement();
					ResultSet set = s.executeQuery(q);
//					fect data from databse
					while(set.next()) {
						int cid=set.getInt("c_id");
						String name = set.getString("name");
						category c = new category(cid, name);
						list.add(c);
						
						
					}
					
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				return list;
				
			}
			
//			get all posts
			public List<post> getallpost(){
				List<post> li = new ArrayList<>();
				//fetch all posts
				try {
					String q = "select * from posts order by postid desc";
					PreparedStatement p = con.prepareStatement(q);
					
					ResultSet rs = p.executeQuery();
					
					
					while(rs.next()) {
//						get post 
						int pid=rs.getInt("postid");
						String title = rs.getString("itle");
						String content = rs.getString("content");
						String code = rs.getString("code");
						String link = rs.getString("link");
						String picture = rs.getString("picture");
						Timestamp date = rs.getTimestamp("registration_date");
						int c_id=rs.getInt("c_id");
						int userid=rs.getInt("userid");
						
						post post = new post(pid, title, content, link, code, picture, date, c_id, userid);
						li.add(post);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return li;
			}
			
			
//			get all  posts with same cat
			public List<post> getpostByC_id(int c_id){
				List<post> li = new ArrayList<>();
				//fetch all posts by cat
				
				try {
					String q = "select * from posts where c_id=?";
					PreparedStatement p = con.prepareStatement(q);
					p.setInt(1, c_id);
					ResultSet rs = p.executeQuery();
					
					while(rs.next()) {
//						get post 
						int pid=rs.getInt("postid");
						String title = rs.getString("itle");
						String content = rs.getString("content");
						String code = rs.getString("code");
						String link = rs.getString("link");
						String picture = rs.getString("picture");
						Timestamp date = rs.getTimestamp("registration_date");
					
						int userid=rs.getInt("userid");
						
						post post = new post(pid, title, content, link, code, picture, date, c_id, userid);
						li.add(post);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return li;
			}
			
//			getting post info by postid
			public post getpostBypost_id(int pid){
			
				//fetch all posts by cat
				post post =null;
				try {
					String q = "select * from posts where postid=?";
					PreparedStatement p = con.prepareStatement(q);
					p.setInt(1, pid);
					ResultSet rs = p.executeQuery();
					
					if(rs.next()) {
						int ppid=rs.getInt("postid");
						String title = rs.getString("itle");
						String content = rs.getString("content");
						String code = rs.getString("code");
						String link = rs.getString("link");
						String picture = rs.getString("picture");
						Timestamp date = rs.getTimestamp("registration_date");
						
						
					int c_id= rs.getInt("c_id");
						int userid=rs.getInt("userid");
						 post = new post(pid, title, content, link, code, picture, date, c_id, userid);
						
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return post;
			}
			

				
}
