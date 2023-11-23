<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.entities.post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.dao.postDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home page</title>
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
.background {
	clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 91%, 68% 87%, 45% 96%, 21% 88%, 0
		100%, 0 0, 21% 0);
}
.card-effect{


  border: 1px solid #ccc;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.card-effect:hover {
background-color:#fff;
  transform: scale(1.1);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>

	<!-- navbar -->
	<%@ include file="navbar.jsp"%>

	<!-- banner -->




	<div class="container-fluid p-0 m-0 background">

		<div class="jumbotron  primary-background text-white">
			<div class="container" style="padding-bottom: 7rem">
				<h1 class="display-3">Welcome to Tech Blog</h1>
				<p class="lead">Hello tech enthusiasts, innovators, and curious
					minds! At Tech Blog, we are passionate about unraveling the
					complexities of the digital realm, exploring the latest tech
					trends, and providing insights that bridge the gap between
					technology and everyday life. Our mission is to be your reliable
					source for in-depth articles, insightful reviews, and
					thought-provoking analyses that cater to both tech aficionados and
					those looking to understand the tech landscape better.</p>
					
			<p class="lead">Design & Developed by Shubham Motwani</p>
			
				
				<a href="register.jsp" class="btn btn-outline-light btn-lg "><span
					class="fa fa-external-link"></span>Start! its free</a>
					
				<a href="loginpage.jsp" class="btn btn-outline-light btn-lg "><span
					class="fa fa-user-circle fa-spin"></span>Login</a>

			</div>
		</div>

	</div>
	<br>

	<!-- posts -->
			<div class="container-fluid">
			<h6 class="display-6">Popular blogs</h6>							
							<!--Post-->
							
							<div class="container text-center" id="loader">
							<i class="fa fa-refresh fa-5x fa-spin"></i>
							<h3>Loading...</h3>
							</div>
							<div class="container-fluid row" id="posts">
							</div>			

	</div>
	<footer style="height:80px"></footer>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="script.js"></script>
	
	
	  <script>
        $(document).ready(function() {
        $("#loader").show();
       			
                $.ajax({
                    url: "loadpost.jsp",
                    success: function(data) {
                    	 $("#loader").hide();
                    	 console.log(data);
                        // Updating the content div with the fetched content
                        $('#posts').html(data);
                    },
                    error: function(xhr, status, error) {
                        console.error("Error fetching content: " + error);
                    }
                });
            });
      
    </script>

 
  
	

</body>
</html>