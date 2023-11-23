package com.techblog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.techblog.dao.userdao;
import com.techblog.entities.message;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;

/**
 * Servlet implementation class updateprofile
 */
@MultipartConfig
public class updateprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateprofile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
//		first fetch all the data
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String pw = request.getParameter("pw");
		String about = request.getParameter("about");
		String occupation = request.getParameter("occupation");

//  to jo purna data chl rha h session me vo fetch krna h so get session
//		get the user from session
		HttpSession se = request.getSession();
//		ab vo jo login krte smy session me user ke obj store kiya to vo get krna hai tki jo user login hai uski change ho
	user user =(user)se.getAttribute("currentuser");
		
//		now replace the user detailes with new
		user.setUseremail(email);
		user.setabout(about);
		user.setnumber(number);
		user.setoccupation(occupation);
		user.setPw(pw);
		
//		now updat in databse
//		passes in userdao 
		userdao udao = new userdao(ConnectionProvider.getConnection());
		boolean l=udao.updateuser(user);
		if(l) {

			message m  = new message("Your profile has been updated successfully!","success","alert-success");
			se.setAttribute("m", m);
			
			
		}else {

			message m  = new message("something went wrong","danger","alert-danger");
			se.setAttribute("m", m);
			
		}
		response.sendRedirect("profile.jsp");
		
		
		
	}

}
