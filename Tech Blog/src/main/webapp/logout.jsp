<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.techblog.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%
//		logout means session ke andr se hume ko attribute set kiya h usko hata dena hai
		
		HttpSession s = request.getSession();
		s.removeAttribute("currentuser");
		
		// creat message to display
		
		message m =new message("You have been logout Successfully!!","Success","alert-success");
		
		s.setAttribute("msg", m);
//		and sent it to login page
		response.sendRedirect("loginpage.jsp");
		
		
		%>





</body>
</html>