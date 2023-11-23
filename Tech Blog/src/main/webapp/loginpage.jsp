<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="com.techblog.entities.*"%>
<%@page import="org.apache.tomcat.jakartaee.commons.compress.archivers.zip.ZipArchiveEntry.CommentSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Login Page</title>

<link href="style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 <style >
  .background{
clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 91%, 68% 87%, 45% 96%, 21% 88%, 0 100%, 0 0, 21% 0);  
  }
  
  </style>
  
</head>
<body>

<%@ include file="navbar.jsp" %>
	<main class="mt-5">
	
	
		<div class="container" style="height:70vh">
				
				<div class="row">
					<div class="col-md-4 offset-md-4">
						<div class="card">
							<div class="card-header primary-background text-white text-center" style="font-size: 1.5em"> 
							<span class="fa fa-user"></span>
							Login here</div>
							
							<!-- Any error acure then show massage using java -->
			 <%
				
					message m = (message)session.getAttribute("msg");
						if(m!=null){
							
							%>
							
							<div class="alert <%=m.getCssClass() %>" role="alert">
							<%=  m.getContent()%>
							</div>
							
							
							<%
							session.removeAttribute("msg");
							
						}
		
			%>
							
							
							
							<div class="card-body">
									
									<form action="loginServlet" method="post">
									  <div class="mb-3">
									    <label for="exampleInputEmail1" class="form-label">Email address</label>
									    <input  required name="useremail"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
									    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
									  </div>
									  <div class="mb-3">
									    <label for="exampleInputPassword1" class="form-label">Password</label>
									    <input required name="pw" type="password" class="form-control" id="exampleInputPassword1">
									  </div>
									 
									  <button type="submit" class="btn btn-primary">Submit</button>
									</form>
																
																
							</div>
							<div class="card-footer  ">
							<p>Don't have an account? <a href="register.jsp">Singup</a></p>
							<p>Forget <a href="#">username</a>/<a href="#">Password</a>?</p>
							
							</div>
							
						</div>
					
					</div>
				</div>
		</div>	
	
	</main>
	
	
	
	
	
	
	
	
	
	
	
	
	
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
 	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
 <script type="text/javascript" src="script.js"></script>
		
</body>
</html>