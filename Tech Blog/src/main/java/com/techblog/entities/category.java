package com.techblog.entities;

public class category {
 // this class obj represents our category
	
	private int cid;
	private String name;
	
	
	
	public category(int cid, String name) {
	
		this.cid = cid;
		this.name = name;
	}
	
	
	public category() {
	
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
