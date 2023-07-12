
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

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/style.css"/>
    </head>
    <body style="background: white">
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="#">MyWallet</a>
  </nav>

  <div class="container position-relative p-0" id="app">
    <div class="row mt-5">
        <% 
            String name=(String)session.getAttribute("loggedUser");  
           
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                PreparedStatement psSelect = conn.prepareStatement("select count(*) AS recordCount from  accounts where user_id =? ");
                
                psSelect.setString(1, name);  
  
                ResultSet resultSet = psSelect.executeQuery();
              
                resultSet.next();
                int count = resultSet.getInt("recordCount"); 
             
                if(count == 0){
                    out.print("<form method='post' class='col-lg-12' action='createAccount.jsp'>");
                    out.print("<button type='submit' class='btn text-decoration-underline text-warning'>");
                    out.print(" click here to create new account</button></form>"); 
                      }
              resultSet.close();
               }catch(Exception e){
                out.print(e);
                }  
 

        %>
       
    </div>
   
 
<div class=" p-5 " id="bottomNav" >
    <div class="     " id="navBottom">
            <div>
                Home
            </div>
              <div>
                  <a href="depost.jsp">Deposit</a>
            </div>
              <div>
                Withdraw
            </div>
         <div>
                Transfer
            </div>
        </div>
    </div>
  </div> 

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
