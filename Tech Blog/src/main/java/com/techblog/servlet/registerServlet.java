package com.techblog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.techblog.dao.userdao;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;

/**
 * Servlet implementation class registerServlet
 */
@MultipartConfig
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registerServlet() {
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

//		fetch all data
		String username = request.getParameter("username");
		String useremail = request.getParameter("useremail");
		String number = request.getParameter("number");
		String pw = request.getParameter("pw");
		String occupation = request.getParameter("occupation");
		String about = request.getParameter("about");
		
		String stats = request.getParameter("stats");
		String city = request.getParameter("city");

//		form connection
		Connection con = ConnectionProvider.getConnection();

//		user obj
		user newuser= new user(username, useremail, pw, number,occupation,about,stats,city);
	

//		Create user dao object
		userdao userdao = new userdao(con);

//		pass in user dao so that this will save data in db
		if(userdao.saveuser(newuser)) {
			out.print("<h1>done...</h1>");
		}else {
			out.print("no..");
		}
		
	}

}
