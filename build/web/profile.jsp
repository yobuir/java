
<%-- 
    Document   : login
    Created on : Jun 29, 2023, 8:51:31 AM
    Author     : iprc kgl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MyWallet - dashboard</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
          <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
          <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@500&family=Poppins:wght@300&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> <link rel="stylesheet" href="styles/style.css"/>
    </head>
    <body style="background: white">
    <jsp:include page="headerNav.jsp" />
    
    <jsp:include page="navigation.jsp" />
  <div class="container position-relative p-0 mb-5 pb-5" id="app">
    <div class="row mt-5 mb-5">
        <div class="col-lg-12">
            <% 
                String name=(String)session.getAttribute("loggedId");  
                String loggedUser=(String)session.getAttribute("loggedUser"); 
                out.print("Hello "+name);
                out.print("<div class='d-flex ' style='width:100%;'>"
                        + "<div class='flex-fill'>"
                        + "<h2>Profile</h2>"
                        + "</div>"
                        + "<div class='flex-fill'>"
                        + "<a href='DeleteUserProfile.jsp?userid="+loggedUser+"' type='submit' class='btn btn-sm btn-danger' >Delete account</a>"
                        + "</div>"
                        + "</div>");
                
                 
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                    PreparedStatement psSelect = conn.prepareStatement("select * from user where id = ?");

                    psSelect.setString(1, loggedUser); 

                    ResultSet resultSet = psSelect.executeQuery();

                    if(resultSet.next()){ 
                      String emailId = resultSet.getString("email");
                       String savedName = resultSet.getString("names");
                      String userProfile=resultSet.getString("images");
                       
                       out.print("<div class='col-lg-12 p-5'>"
                      
                       + ""
                       + ""
                       + "<form method='post' action='UserUpdateProfile.jsp' class='row gap-3'>"
                       + " <div class='col-lg-12 mb-2'>"
                       + "<input type='text' name='name' value='"+savedName+"' class='form-control'/> "
                       + "</div>"
                       + "<div class='col-lg-12 b-3'>  "
                       + "  <input type='text' name='email' value='"+emailId+"' class='form-control'/> "
                       + "</div>"
                       + " <div class='mt-2'>"
                       + "<button class='btn btn-dark'>Update</button>"
                       + "</div> "
                       + "</form>"
                       + "</div>"
                       + "<br>"
                       + "<img src='"+userProfile+"' width='200' height='200' class='img-thumbnail'/>");
                      
                }else{ 
                }
                }catch(Exception e){
                out.print(e);
                }   

            %>
           
        </div> 
            <div class="col-lg-12">
                <div class="row gap-4"> 
                  
                </div>
                <form action="image-process.jsp" method="post" class="col-lg-12" enctype="multipart/form-data">  
                    Select File:<input type="file" name="image"/><br/> <br/>  
                   <button class='btn btn-dark'>Upload image</button>
                </form> 

            </div>
            
            
    </div 
   </div> 
  </div>  
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
