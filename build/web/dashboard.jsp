
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="styles/style.css"/>
    </head>
    <body style="background: white">
 
   <jsp:include page="headerNav.jsp" />
   
    <jsp:include page="navigation.jsp" />
  <div class="container position-relative p-0" id="app">
    <div class="row mt-5">
        <% 
                String name=(String)session.getAttribute("loggedUser"); 
               String nameUser=(String)session.getAttribute("loggedId"); 
               
           
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                PreparedStatement psSelect = conn.prepareStatement("select count(*) AS recordCount from  accounts where user_id =? ");
                
                PreparedStatement sumTotalSelect = conn.prepareStatement("select sum(amount) AS recordTotal from  accounts where user_id =? ");
               
                PreparedStatement sumTotalSelectDeposists =conn.prepareStatement(""
                    + "select sum(transaction.amount) as recordTotal from  transaction,accounts,user "
                    + "where transaction.account_number=accounts.acc_id and "
                    + "accounts.user_id = user.id and "
                    + "transaction.action='deposit' and " 
                    + "user.id =? "
                    + "order by transaction.created_date desc limit 4");
                    
                    
                    
                 PreparedStatement sumTotalSelectWithDraw =conn.prepareStatement(""
                    + "select sum(transaction.amount) as recordTotal from  transaction,accounts,user "
                    + "where transaction.account_number=accounts.acc_id and "
                    + "accounts.user_id = user.id and "
                    + "transaction.action='withdraw' and " 
                    + "user.id =? "
                    + "order by transaction.created_date desc limit 4");

                  PreparedStatement sumTotalSelectTransfer =conn.prepareStatement(""
                    + "select sum(transaction.amount) as recordTotal from  transaction,accounts,user "
                    + "where transaction.account_number=accounts.acc_id and "
                    + "accounts.user_id = user.id and "
                    + "transaction.action='transfer' and " 
                    + "user.id =? "
                    + "order by transaction.created_date desc limit 4");

                
                
                psSelect.setString(1, name);   
                ResultSet resultSet = psSelect.executeQuery(); 
                resultSet.next();
                int count = resultSet.getInt("recordCount"); 
               
                
                
                sumTotalSelect.setString(1, name);   
                ResultSet resultSetAmount = sumTotalSelect.executeQuery(); 
                resultSetAmount.next();
                int recordTotalAmount = resultSetAmount.getInt("recordTotal"); 
                
                
                
                sumTotalSelectDeposists.setString(1, name);   
                ResultSet resultSetAmountDeposits = sumTotalSelectDeposists.executeQuery(); 
                resultSetAmountDeposits.next();
                int recordTotalAmountDeposit = resultSetAmountDeposits.getInt("recordTotal"); 
                
                
                sumTotalSelectWithDraw.setString(1, name);   
                ResultSet resultSetAmountWithDraw = sumTotalSelectWithDraw.executeQuery(); 
                resultSetAmountWithDraw.next();
                int recordTotalAmountWithDraw = resultSetAmountWithDraw.getInt("recordTotal"); 
                 
                
                sumTotalSelectTransfer.setString(1, name);   
                ResultSet resultSetAmountTransfer = sumTotalSelectTransfer.executeQuery(); 
                resultSetAmountTransfer.next();
                int recordTotalAmountTransfer = resultSetAmountTransfer.getInt("recordTotal"); 
                 
                
                
                if(count == 0){
                    out.print("<form method='post' class='col-lg-12' action='createAccount.jsp'>");
                    out.print("<button type='submit' class='btn text-decoration-underline text-warning'>");
                    out.print(" click here to create new account</button></form>"); 
                      }else{
                     %>
                     
                        <div class="card w-100 mb-4" >
                            <div class="card-body">
                                <div class="flex flex-col">
                                    <div class="mb-3">
                                       Welcome back <% 
                                        out.print("  "+nameUser);
                                        %>
                                    </div>
                                     <div >
                                         <h5 class="card-title"><strong><%= recordTotalAmount%> RWF</strong></h5> 
                                        <p>Total Amount</p>  
                                    </div>
                                </div>
                               
                             </div>
                         </div>
                        <div class="d-flex flex-row flex-wrap gap-4">
                            <div class="card " style="width: 18rem;">
                                <div class="card-body">
                                  <h5 class="card-title"><%=recordTotalAmountDeposit%> RWF</h5> 
                                  <p>Deposits</p>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                    <h5 class="card-title"><%= recordTotalAmountWithDraw%> RWF</h5> 
                                  <p>Withdraw</p>
                                </div>
                            </div>
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                  <h5 class="card-title"><%=recordTotalAmountTransfer%> RWF</h5> 
                                  <p>Transfer</p>
                                </div>
                            </div>
                        </div>
    
        
        <%                
            }
              resultSet.close();
               }catch(Exception e){
                out.print(e);
                }  
 

        %>
       
    </div>

  </div>      
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
