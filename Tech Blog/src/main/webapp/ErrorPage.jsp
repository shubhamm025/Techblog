<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error!! Something went wrong</title>
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
</style>
</head>
<body>


	<div class="container text-center">
		<img class="img-fluid" alt="" src="images/error.png">
		<h3 class="display-3">Sorry ! Something went wrong...</h3>
		<h5><%= exception %></h5>
		<br>
		<a class="btn primary-background btn-lg text-white" href="index.jsp">Home</a>
	</div>









</body>
</html>