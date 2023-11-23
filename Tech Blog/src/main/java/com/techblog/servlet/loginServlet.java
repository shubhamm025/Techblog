package com.techblog.servlet;

import jakarta.servlet.ServletException;
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
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	PrintWriter out=response.getWriter();
//		fetch data
		String useremail= request.getParameter("useremail");
		String pw = request.getParameter("pw");
//		make userdao obj
		userdao userdao = new userdao(ConnectionProvider.getConnection());
//		now get user user detalis from your getuser function of userdao and save in user
		user user=userdao.getuser(useremail, pw);
//		if this user is null so no user exist with this mail
		
		if(user==null) {
//			out.print("<h1>Please provide correct details</h1>");
//			ek message bana ke ijis me info and css dono ko bejege taki ek dynamic bana or usko use kar ske jap pr
			message msg = new message("Invalid user information","Error","alert-danger");
//			ye msg session me rkh ke de dege
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("loginpage.jsp");
		}else {
//			login success
//			so to manage login logout use use session so session me jab tk value rhegi tb tk login rhega
			HttpSession s = request.getSession();
			s.setAttribute("currentuser", user);
			response.sendRedirect("profile.jsp");
			
		}
		
	}

}
