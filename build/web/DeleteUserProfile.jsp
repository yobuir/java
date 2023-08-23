
<%-- 
    Document   : login
    Created on : Jun 29, 2023, 8:51:31 AM
    Author     : iprc kgl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>  
<%@ page import="pageNumber.*, java.util.*, java.io.*" %>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <title>Delete </title>
        
    </head>
    <body>
<%  
    
     String id=(String)session.getAttribute("loggedUser");   

   HttpServletRequest httpRequest = (HttpServletRequest) request;
   String method = httpRequest.getMethod();

    if (method.equals("POST")) {
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
        PreparedStatement ps = conn.prepareStatement("delete from user where user_id=?");
        ps.setString(1, id);
        int status = ps.executeUpdate();
         if(status>0){
         response.sendRedirect("Retrieve.jsp");
          }else{
      response.sendRedirect("deleting error");
      }
          }
       catch(Exception e){
          out.print(e);
          }
   } else { 
   }

    
%>
    <div class="container">
        <div class="d-flex flex-row justify-content-center align-items-center" style="height: 100vh;">
            <div class="col-lg-5"  style="display: flex;justify-content: space-between ;gap:20px">
                <div class="card" >
                <form class="card-body" method="post">
                    <div class="d-flex" style="display: flex;gap: 10px;">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                            <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
                            <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                          </svg>
                        </div>
                        <div>

                        <p>Sure you want to delete your account ?</p>
                        </div>
                    </div> 
                    <div class="card-footer bg-white border-0 " style="display: flex;justify-content: space-between ;gap:20px">
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button> 
                    <a href="Retrieve.jsp" class="btn btn-sm btn-primary">Cancel</a>
                </div>
            </form>
            </div>
        </div>
    </div>
</div>

   </body>
</html>