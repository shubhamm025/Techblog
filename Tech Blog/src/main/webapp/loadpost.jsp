<%@page import="java.text.Format"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techblog.entities.user"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.postDao"%>
<%@page import="com.techblog.entities.post"%>

<%

Thread.sleep(100);

postDao pd = new postDao(ConnectionProvider.getConnection());
List<post> posts = pd.getallpost();

for(post p:posts){
	%>
	<div class="col-md-4 mt-4 my-4 ">
	<div class="card card-effect"  >
	
 
 
  <div class="card-body" style="   max-height: 190px;  overflow: hidden;">
  <div>
    <h5 class="card-title "><%=p.getTitle() %></h5>
 
    <p class="card-text"> <b>Discription:- </b><%=p.getContent() %>
    </p>
    </div>
  </div>
 <ul class="list-group list-group-flush">
   <li class="list-group-item">Posted on: <%=DateFormat.getDateInstance().format(p.getRegistration_date())%></li>
    
  </ul>
  <div class="card-footer bg-white "   >
 
   <a href="showpost.jsp?post_id=<%=p.getPostid() %>" class="btn btn-outline-primary btn-sm">Read More</a>
 
  
  
  </div>
 
</div>
</div>
	
	
	
	<%
}
%>








