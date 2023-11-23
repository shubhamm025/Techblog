<%@page import="java.text.DateFormat"%>
<%@page import="com.techblog.dao.userdao"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.message"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.postDao"%>
<%@page import="com.techblog.entities.post"%>
<%@page import="com.techblog.entities.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page errorPage="ErrorPage.jsp" %>
   <!-- check first user jo aa rha null hai ki agr hai to login page pr redirect kr do -->
    <% 
    user u = (user)session.getAttribute("currentuser");
    if(u==null){
    	response.sendRedirect("loginpage.jsp");
    }
    
    %>
    
    <%
    int postid=Integer.parseInt(request.getParameter("post_id"));
    postDao pd = new postDao(ConnectionProvider.getConnection());
    post p = pd.getpostBypost_id(postid);
    %>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>

.card-effect{
border: 1px solid #ccc;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.card-effect:hover {
background-color:#fff;
  transform: scale(1.1);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.background {
	clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 91%, 68% 87%, 45% 96%, 21% 88%, 0
		100%, 0 0, 21% 0);
}


</style>
<meta charset="UTF-8">
<title><%=p.getTitle()%></title>
</head>
				
		<body >
<!--nav bar  -->

 <nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-book"></span>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home"></span> Home</a>
        </li>
       
       
         <li class="nav-item">
          <a class=" nav-link active" href="contact.jsp"><span class="fa fa-address-card-o"></span>Contact us</a>
        </li>
        
          <li class="nav-item">
          <a data-bs-toggle="modal" data-bs-target="#add-post" class=" nav-link active" href="#" ><span class="fa fa-plus-circle"></span>Post</a>
        </li>
  
      </ul>
      <ul class="navbar-nav me-right">
      
       <li class="nav-item">
          <a class=" nav-link active " href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><span class="fa fa-user-circle"></span><%= u.getUsername()%></a>
        </li>
      
        <li class="nav-item">
          <a class=" nav-link active " href="logout.jsp"><span class="fa fa-sign-out"></span>Logout</a>
        </li>

      </ul>
      
    </div>
  </div>
</nav>


<!-- End of nav bar -->


				
							<!-- To show Any update msg-->
			 <%
				
					message m = (message)session.getAttribute("m");
						if(m!=null){
							
							%>
							
							<div class="alert <%=m.getCssClass() %>" role="alert">
							<%=  m.getContent()%>
							</div>
							
							
							<%
							session.removeAttribute("m");
							
						}
			%>


						<!-- Main content of post -->	
						
							<div class="container-fluid post-content" >
							 
							 
							<div class= my-4">
							
						<div class="col-md-12">
										<div class="card-header text-center display-6"  > <%=p.getTitle() %></div>
									<br>
									
									 
									  <div class="container-fluid">
									 
								    <p class="card-text"><%=p.getContent() %></p>
									
									 <%if(p.getCode()!=null){
										 %>
										  <br>
										 <p><%=p.getCode() %></p>
										 
										 <%
									 }
									 
									 userdao ud = new userdao(ConnectionProvider.getConnection());
									
									 %>
									 <p>Posted on:- <%=DateFormat.getDateInstance().format(p.getRegistration_date())%> by <%=ud.getuserbyuserid(p.getUserid()).getUsername()%></p>
									
     					  			<p>Connect with creator: <a href="mailto:<%=ud.getuserbyuserid(p.getUserid()).getUseremail()%>"><%=ud.getuserbyuserid(p.getUserid()).getUseremail() %></a></p>
   											 
									 
									
									  </div>
									 
									 
									 
									 
									</div>
									</div>	
								</div>
						
							<hr>
							<!-- Other posts -->
			<div class="container-fluid">
			<h6 class="display-6">Other posts:-	</h6>							
							<!--Post-->
							
							<div class="container text-center" id="loader">
							<i class="fa fa-refresh fa-5x fa-spin"></i>
							<h3>Loading...</h3>
							</div>
							<div class="container-fluid row" id="posts">
							</div>									
												
												
														
														
										
						<!-- End Main content of post -->		
												
																



<!-- Start of modal -->


					<!-- profile Modal -->
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header primary-background text-white ">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">Tech Blog's user profile</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      
					      <div class="modal-body">
					       <div class="container text-center">
					       
					       <img class="img-fluid" style="border-radius:50%;max-width:100px" alt="loading" src="images/default_profile.png">
					       <h1 class="modal-title fs-5" id="staticBackdropLabel"><%=u.getUsername() %></h1>
					    
					       <div id="profile-details">
					       <table class="table">
							 
							  <tbody>
							    <tr>
							      <th scope="row">Your id</th>
							      <td><%=u.getId() %></td>
							     
							    </tr>
							    <tr>
							      <th scope="row">Email</th>
							      <td><%=u.getUseremail() %></td>
							     
							    </tr>
							    <tr>
							      <th scope="row">Contact number</th>
							 
							      <td><%=u.getnumber()%></td>
							      
							       </tr>
							       <tr>
							      <th scope="row">Occupation</th>
							      <td><%=u.getoccupation() %></td>
							     </tr>
							     
							     <tr>
							      <th scope="row">City</th>
							      <td><%=u.getCity() %></td>
							     
							    </tr>
							     
							      <tr>
							      <th scope="row">State</th>
							      <td><%=u.getStats()%></td>
							     
							    </tr>
							     
							     
							      <tr>
							      <th scope="row">About</th>
							      <td><%=u.getabout() %></td>
							     
							    </tr>
							  </tbody>
							</table>
					      </div>
					      
			      
					      <!-- Profile edit -->
					      <div id="profile-edit">
					      <h4 class=" mt-2">Edit Your profile</h4>
					      <form action="updateprofile" method="post" >
					      
					      <table class="table">
					      
					       		<tr>
							      <td scope="row">Your id</td>
							      <td><%=u.getId() %></td>
							     </tr>

  					    		<tr>	
							      <td scope="row">Email</td>
							      <td><input class="form-control" type="email" name="email" value="<%=u.getUseremail()%>"></td>
							     </tr>
							     
							     <tr>	
							      <td scope="row">Password</td>
							      <td><input class="form-control" type="text" name="pw" value="<%=u.getPw()%>"></td>
							     </tr>
							     
							     
							     <tr>	
							      <td scope="row">Contact Number</td>
							      <td><input class="form-control" type="text" name="number" value="<%=u.getnumber()%>"></td>
							     </tr>
							    
					    	 <tr>	
							      <td scope="row">Occupation</td>
							      <td><input class="form-control" type="text" name="occupation" value="<%=u.getoccupation()%>"></td>
							     </tr>
							     
							     	 <tr>	
							      <td scope="row">About</td>
							      <td>
							     <input class="form-control" type="text" name="about"id="about" value="<%=u.getabout()%>">
							     
							      </td>
							     </tr>
							     
							      <tr>	
							      <td scope="row">New profile </td>
							      <td>
							      
							      <input type="file" class="form-control">
							      
							      </td>
							     </tr>
					    	
					      </table>
					      	
					      	<div class="container">
					      	<button type="submit" class="btn btn-outline-primary"  >Save</button>
					      	
					      	</div>
					      
					      </form>
					      
					      
					      </div>
					      
					      
					       </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button id="edit-profile" type="button" class="btn btn-primary">Edit Profile</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- End  Modal -->
		
<!-- Post Modal -->
				
				
				<!-- Modal -->
				<div class="modal fade" id="add-post" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Creating Post</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      
				      
				      
				      
				      
				        <form id="addpost" action="addpostServlet" method="post" enctype="multipart/form-data">
				        
				        <select class="form-select text-black " name="c_id">
						  <option disabled selected>----Select Category----</option>
						  
						    
						    
						  <%
								//categories
								
								postDao pdao = new postDao(ConnectionProvider.getConnection());
								ArrayList<category> li= pdao.getcategories();
								
								for(category catt: li){
									%>
									<option  selected value="<%=catt.getCid()%>"><%=catt.getName() %></option>
									
									
								<% }
								
								
								%>
						
			
						 </select>
				        
						<div class="form-group mt-2">
						<input  name="title" id="title"  placeholder="Enter you title" class="form-control">
						</div>
						
						<div class="form-group mt-2">
						<textarea  name="content"id="title" style="height:100px" placeholder="Enter you content" class="form-control"></textarea>
						</div>
						
						<div class="form-group mt-2">
						<textarea name="program" id="title" style="height:100px" placeholder="Enter you program(optional)" class="form-control"></textarea>
						</div>
						
						<div class="form-group mt-2">
						<input name="link" id="title"type="text" placeholder="insert link(optional)" class="form-control">
						</div>
						
						<div class="form-group mb-3 mt-3">
						<label>Select your pic</label>
						<br>
						<input class="form-control" name="pic" type="file">
						</div>
						
							<div class="container text-center">
					      	<button type="submit" class="btn btn-outline-primary btn-lg " >Post</button>
					      	
					      	</div>
					
				      </form>
				      
				      </div>
				  
				    </div>
				  </div>
				</div>
				
				<footer style="height:80px"></footer>
				
				<!-- End  Modal -->

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="script.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


<script >

$(document).ready(function(){
	let editBtn=false;
	$('#profile-edit').hide();
	$('#edit-profile').click(function(){
		if(editBtn==false){
			$('#profile-details').hide()
			$('#profile-edit').show();
			editBtn=true;
			$(this).text("Back")
		}else{
			$('#profile-details').show()
			$('#profile-edit').hide();
			$(this).text("Edit")
			editBtn=false;
		}
		
	})
	
})


</script>
<!-- js for my post -->


 <script>
 
 $(document).ready(function() {
	  $("#addpost").submit(function(event) {
	    // Prevent the form from submitting normally
	    event.preventDefault();

	    // Get the data from the form
	    var formData = new FormData(this);

	    // Make an AJAX request to the servlet
	    $.ajax({
	      url: "addpostServlet",
	      type: "POST",
	      data: formData,
	      contentType: false,
	      processData: false,
	      success: function(response) {
	    	  swal("Posted Successfully!", "", "success");
	 	
	      },
	      error: function() {
	        // Display an error message
	        alert("There was an error. Please try again.");
	      }
	    });
	  });
	});
 </script>
 
 
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