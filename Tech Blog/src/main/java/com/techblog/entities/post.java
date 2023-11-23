package com.techblog.entities;

import java.io.InputStream;
import java.sql.Timestamp;

import com.techblog.helper.helper;

public class post {
//this class obj represents our post 
	
	private  int postid;
	private String title;	
	private String content;
	private String link;
	private String code;
	private String picture;
	private Timestamp registration_date ;
	private int c_id;
	private int userid;
	
	
	
	public post(int postid, String title, String content, String link, String code, String picture,
			Timestamp registration_date) {
	
		this.postid = postid;
		this.title = title;
		this.content = content;
		this.link = link;
		this.code = code;
		this.picture = picture;
		this.registration_date = registration_date;
		
	}


	public post(String title, String content, String link, String code, String picture, Timestamp registration_date) {
		
		this.title = title;
		this.content = content;
		this.link = link;
		this.code = code;
		this.picture = picture;
		this.registration_date = registration_date;
	}
	
	


	public post(int postid, String title, String content, String link, String code, String picture,
			Timestamp registration_date, int c_id, int userid) {
		
		this.postid = postid;
		this.title = title;
		this.content = content;
		this.link = link;
		this.code = code;
		this.picture = picture;
		this.registration_date = registration_date;
		this.c_id = c_id;
		this.userid = userid;
	}
	
	


	public post(String title, String content, String link, String code, String picture, Timestamp registration_date,
			int c_id, int userid) {
		
		this.title = title;
		this.content = content;
		this.link = link;
		this.code = code;
		this.picture = picture;
		this.registration_date = registration_date;
		this.c_id = c_id;
		this.userid = userid;
	}


	public post() {
		
	}


	public int getPostid() {
		return postid;
	}


	public void setPostid(int postid) {
		this.postid = postid;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public Timestamp getRegistration_date() {
		return registration_date;
	}


	public void setRegistration_date(Timestamp registration_date) {
		this.registration_date = registration_date;
	}


	public int getC_id() {
		return c_id;
	}


	public void setC_id(int c_id) {
		this.c_id = c_id;
	}


	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
	
	
	
}
