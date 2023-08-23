
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
                out.print("Hello "+name);  

            %>
            <h2>Deposit</h2>
        </div>
        <div class="col-lg-12 p-5">
            <form method="post" action="depositLogic.jsp" class="d-flex flex-row justify-content-center">
                <div>
                    <input type="number" placeholder="enter amount to deposit" name="amount" class="form-control"/> 
                </div>
                <div>
                    <select name="source" class="form-control">
                        <option >Flutterwave</option> 
                          <option >Bank</option>
                    </select>
                </div>
                <div>
                    <button class="btn btn-dark" onclick="makePayment()">Deposit</button>
                </div>
                
            </form>
        </div>
        <div class="col-lg-12">
             
            <% 
                String loggedUser=(String)session.getAttribute("loggedUser");  
              

                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                    PreparedStatement psSelect = conn.prepareStatement(""
                    + "select *  from  transaction,accounts,user "
                    + "where transaction.account_number=accounts.acc_id and "
                    + "accounts.user_id = user.id and "
                    + "transaction.action='deposit' and " 
                    + "user.id =? "
                    + "order by transaction.created_date desc limit 4");

                    psSelect.setString(1, loggedUser);  

                    ResultSet resultSet = psSelect.executeQuery();

                    
                    if(resultSet.next()) {
                    %>
              


                   <p>Recent deposit</p>
                   <table class='table'>
                       <thead>
                         <tr> 
                           <th scope='col'>from</th>
                           <th scope='col'>to</th>
                           <th scope='col'>action</th>
                           <th scope='col'>Amount</th>
                           <th scope='col'>date</th>

                         </tr>
                       </thead>
                       <tbody>  
                    <% 
                     while(resultSet.next()){ 
                        %>
                        <tr>    
                            <td><%= resultSet.getString("transaction.source") %></td> 
                            <td><%= resultSet.getString("acc_id") %></td> 
                            <td>deposit</td> 
                            <td><%= resultSet.getInt("transaction.amount")  %> RWF</td>  
                            <td><%= resultSet.getString("transaction.created_date") %>  </td> 

                        </tr> 
                        
                        <%
                        }

                    }else{
                    out.print("No data to show");
                }
                   

                  
                  resultSet.close();
                   }catch(Exception e){
                    out.print(e);
                    }  


                %>
 
                </tbody>
            </table>
        
        </div>
        
    </div>  
   </div>  
 
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
