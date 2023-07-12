
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
        <div class="col-lg-12">
            <% 
                String name=(String)session.getAttribute("loggedId");  
                out.print("Hello "+name);  

            %>
            <h2>Withdraw</h2>
        </div>
        <div class="col-lg-12 p-5">
            <form method="post" action="depositLogic.jsp" class="d-flex flex-row justify-content-center">
                <div>
                    <input type="number" name="amount" class="form-control"/> 
                </div>
                <div>
                    <select name="source" class="form-control">
                        <option >Flutterwave</option>
                         <option >MTN</option>
                          <option >Airttel</option>
                          <option >Bank</option>
                    </select>
                </div>
                <div>
                    <button class="btn btn-dark">Deposit</button>
                </div>
                
            </form>
        </div>
        <div class="col-lg-12">
             
            <% 
                String loggedUser=(String)session.getAttribute("loggedUser");  

                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                    PreparedStatement psSelect = conn.prepareStatement("select *  from  accounts,user,transaction where accounts.user_id = user.id and transaction.action='withdraw' and transaction.account_number = accounts.acc_id and user.id =? limit 3");

                    psSelect.setString(1, loggedUser);  

                    ResultSet resultSet = psSelect.executeQuery();

                    
                    if(resultSet.next()) {
                    %>
              


                   <p>Recent withdraw</p>
                   <table class='table'>
                       <thead>
                         <tr>
                           <th scope='col'>#</th>
                           <th scope='col'>from</th>
                           <th scope='col'>to</th>
                           <th scope='col'>action</th>
                           <th scope='col'>Amount</th>
                         </tr>
                       </thead>
                       <tbody>  
                    <%
                     int amount = resultSet.getInt("amount"); 
                     int id =resultSet.getInt("id");
                     String source =resultSet.getString("source");
                     String acc_id =resultSet.getString("acc_id");
                        out.print("<tr>");
                        out.print("<th scope='row'>"+id+"</th>");
                        out.print("<td>"+source+"</td>");
                        out.print("<td>"+acc_id+"</td>");
                        out.print("<td>withdraw</td>");
                        out.print("<td>"+amount+" RWF</td>");
                        out.print("</tr>");  

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
   
    <div class=" p-5 " id="bottomNav" >
        <div class=" " id="navBottom">
                <div>
                    Home
                </div>
                  <div>
                      <a href="depost.jsp">Deposit</a>
                </div>
                  <div>
                    <a href="withdraw.jsp"> Withdraw </a>
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
