package com.techblog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.mysql.cj.Session;

import com.techblog.dao.postDao;
import com.techblog.entities.post;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.helper;

/**
 * Servlet implementation class addpostServlet
 */
@MultipartConfig
public class addpostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addpostServlet() {
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
		PrintWriter out = response.getWriter();
//		getting current user id
		HttpSession s = request.getSession();
		user user = (user)s.getAttribute("currentuser");
		
		int cid =Integer.parseInt(request.getParameter("c_id"));
		String title = request.getParameter("title");
		String content= request.getParameter("content");
		String link = request.getParameter("link");
		String code = request.getParameter("code");
		Part pic=request.getPart("pic");
		int userid = user.getId();
		String filename = pic.getSubmittedFileName();
		InputStream is = pic.getInputStream();
		String path = request.getPathInfo()+"images"+"/"+filename;
		
		helper.saveFile(is, path);
		
		post p = new post(title, content, link, code, pic.getSubmittedFileName(), null, cid, userid);
		
		postDao pd = new postDao(ConnectionProvider.getConnection());
		
		if(pd.savepost(p)) {
			
			out.print("done");
		}else {
			out.print("not done");
		}
	}
}
