

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
if (session == null || session.getAttribute("loggedUser") == null) {
   
    response.sendRedirect("signin.jsp");
    %>
    <div class="bg-white d-flex  flex-col justify-content-center loginSection" style="z-index:9;height: 100vh;width: 100%;position: fixed">
        <div><a href="login.jsp" class="btn btn-dark">Login </a></div> 
    </div>
    <%
  
}
%>

 <nav class="navbar navbar-expand-lg navbar-dark fixed-top loginSection">
     <div class="d-flex flex-row w-100">
         <div class="flex-grow-1">
             <a class="navbar-brand" href="#">MyWallet</a>
         </div>
         <form method="post" action="LogoutUser.jsp" class="">
             <button class="btn btn-sm btn-danger" type="submit">Logout</button>
         </form>
     </div>
  </nav>