<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Registration</title>

 <link href="style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 
</head>
<body>
<%@ include file="navbar.jsp" %>


	<main>
		<div class="container">
			<div class="col-md-4 offset-md-4">
				
				<div class="card mt-4">
					
					<div class="card-header primary-background text-white text-center" style="font-size: 1.5em"">
					<span class="fa fa-user-plus"></span>
					Register Here
					</div>
					
					<div class="card-body">
					
					<form  id="reg-form" class="mt-2" action ="registerServlet" method="post">
					
					 <div class="form-group mb-2">
					    <label for="username ">User name</label>
					    <input required name ="username"type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter your Name">					    
					  </div>
					  
					 
					    <div class="form-group mb-2">
					    <label for="useremail">Email</label>
					    <br>
					    <input  required name ="useremail" type="text" class="form-control" id="useremail" placeholder="Enter your email">

					   
					  </div>
					
					  <div class="form-group mb-2">
					    <label for="number">Contact No</label>
					    <br>
					    <input  required name ="number" type="text" class="form-control" id="number" placeholder="Enter your number">

					   
					  </div>
					  
					
					  <div class="form-group mb-2">
					    <label for="exampleInputPassword1">Password</label>
					    <input  required name ="pw" type="password" class="form-control" id="pw" placeholder="Enter your Password">
					  </div>
					  
					  
					  	
					  
					  
					   <div class="form-group mb-2">
					    <label for="occupation">Occupation</label>
					    <br>
					    <input  required name ="occupation" type="text" class="form-control" id="occupation" placeholder="Enter your occupation">

					   
					  </div>
					  
					    <div class="form-group mb-2">
					    <label for="about">about</label>
					    <br>
					    <input  required name ="about" type="text" class="form-control" id="number" placeholder="write something about yourself">

					   
					  </div>
					  
					  	<div class="form-group mb-2">
					    <label for="validationCustom04" class="form-label">State</label>
					    <select name="stats" class="form-select" id="validationCustom04" required>
					      <option selected disabled value="">Choose your state...</option>
					      <option> Andhra Pradesh</option>
					      <option>Madhya Pradesh</option>
					      <option>Maharashtra</option>
					      <option>Rajasthan</option>
					      <option>Gujarat</option>
					      <option>Tamil Nadu</option>
					      <option>other</option>
					    </select>
					    <div class="invalid-feedback">
					      Please select a valid state.
					    </div>
					  </div>
					  
					  
					  
					   <div class="form-group mb-2">
					    <label for="city" class="form-label">City</label>
					    <input name ="city"type="text" class="form-control" id="city" required>
					    <div class="invalid-feedback">
					      Please provide a valid city.
					    </div>
					  </div>
					
				
					
					  
					<div class="container text-center" id="loader" style="display: none">
					<span class="fa fa-refresh fa-spin fa-3x"></span>
					<h4>Please wait...</h4>
					</div>
					
					<br>
					  <button type="submit" class="btn btn-primary mt-2" id="submit-btn">Submit</button>
					</form>
										
					
					</div>
					
					<div class="card-footer">
					<p>Already have an account? <a href="loginpage.jsp">Login</a></p>
					</div>
				
				</div>
				
				
				
				
				
			</div>
		
		</div>
	
	
	</main>










































<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
 	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
 <script type="text/javascript" src="script.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <script>
 
 $(document).ready(function() {
	  $("#reg-form").submit(function(event) {
	    // Prevent the form from submitting normally
	    event.preventDefault();

	    // Get the data from the form
	    var formData = new FormData(this);

	    // Make an AJAX request to the servlet
	    $.ajax({
	      url: "registerServlet",
	      type: "POST",
	      data: formData,
	      contentType: false,
	      processData: false,
	      success: function(response) {
	    	  
	    	  alert("Regestred Successfully!")
	    	  window.location.href = "loginpage.jsp";
	    	  
	    	  
	      },
	      error: function() {
	        // Display an error message
	        alert("There was an error registering you. Please try again.");
	      }
	    });
	  });
	});
 </script>
 

</body>
</html>