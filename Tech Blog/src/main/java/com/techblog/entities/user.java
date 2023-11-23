package com.techblog.entities;

public class user {
	
	
	private int id;
	private String username;
	private String useremail;
	private String pw;
	private String number;
	private String occupation;
	private String about;
	
	private String stats ;
	private String city;
	
	
	public user(String username, String useremail, String pw, String number) {
		
		this.username = username;
		this.useremail = useremail;
		this.pw = pw;
		this.number = number;
	}


	public user(int id, String username, String useremail, String pw, String number) {
		
		this.id = id;
		this.username = username;
		this.useremail = useremail;
		this.pw = pw;
		this.number = number;
	}

	
	

	
	

	public user(String username, String useremail, String pw, String number, String occupation, String about) {
	
		this.username = username;
		this.useremail = useremail;
		this.pw = pw;
		this.number = number;
		this.occupation = occupation;
		this.about = about;
	}
	





	public user(String username, String useremail, String pw, String number, String occupation, String about, String stats, String city) {
		
		this.username = username;
		this.useremail = useremail;
		this.pw = pw;
		this.number = number;
		this.occupation = occupation;
		this.about = about;
		this.stats = stats;
		this.city = city;
	}


	public user() {
	
	}
	
	
//	getter setter
//	all paramenters are private so we need setter and getters to get or set data in obj


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getnumber() {
		return number;
	}


	public void setnumber(String number) {
		this.number = number;
	}


	public String getoccupation() {
		return occupation;
	}


	public void setoccupation(String occupation) {
		this.occupation = occupation;
	}


	public String getabout() {
		return about;
	}


	public void setabout(String about) {
		this.about = about;
	}


	


	public String getStats() {
		return stats;
	}


	public void setStats(String stats) {
		this.stats = stats;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	



	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
