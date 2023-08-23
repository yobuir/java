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
        
        <style>
             
             /*(@%+\/’!#$^?:,(){}[]~-_.)*/
        @media print {
            body {
                font-size: 12pt !important;
            }

           #Myform{
                display: none !important;  
            }
            
            #navBottom{
                display: none !important;
            }
            #userInfo{
                 display: none !important;
            }
            #navHeader{
                display: none !important;
            }
            .loginSection{
                display: none !important;
            }
            #download{
                display: none !important; 
            }
        }
        </style>
    </head>
    <body style="background: white">
   <jsp:include page="headerNav.jsp" />
    <jsp:include page="navigation.jsp" />  

  <div class="container position-relative p-0 mb-5 pb-5" id="app">
    <div class="row mt-5 mb-5">
        <div class="col-lg-12" id="userInfo">
            <% 
                String name=(String)session.getAttribute("loggedId");  
                out.print("Hello "+name);  
            %>
            <h2>Reporting</h2>
        </div>
        <div class="col-lg-12 p-5">
            <form method="post" action="reporting.jsp" id="Myform" class="d-flex flex-row justify-content-center gap-4">
                <div class="ml-3">
                    <label>Choose action</label>
                    <select name="action" class="form-control ">
                        <option>deposit</option>                          
                        <option>withdraw</option>
                        <option>transfer</option>
 
                    </select>
                </div>
                <div class="ml-3"> 
                    <label>from ----</label> 
                    <input type="date" name="from_" class="form-control"> 
                </div>
                <div class="ml-3">
                    
                    <label>-----to</label> 
                    <input type="date" name="to_" class="form-control"> 
                </div>
                <div class="mt-2 ml-3"> 
                   <button class="btn btn-dark btn-block mt-3">Generate</button>
                    
                </div>
                
            </form>
        </div>
        <div class="col-lg-12">

            <% 
                String loggedUser=(String)session.getAttribute("loggedUser");   
                String method = request.getMethod();
                 try{
                 if ("POST".equals(method)) {   
                        String action = request.getParameter("action");
                        String from_ = request.getParameter("from_");  
                        String to_ = request.getParameter("to_");   
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                        PreparedStatement psSelect = conn.prepareStatement(""
                        + "select *  from  transaction,accounts,user "
                        + "where transaction.account_number=accounts.acc_id and "
                        + "accounts.user_id = user.id and " 
                        + "user.id =? and "
                        + "transaction.action=? and "
                        + "transaction.created_date BETWEEN ? AND ? "
                        + "order by transaction.created_date asc ");
                        
                        psSelect.setString(1, loggedUser);  
                        psSelect.setString(2, action);  
                        psSelect.setString(3, from_);  
                        psSelect.setString(4, to_);  

                        ResultSet resultSet = psSelect.executeQuery();


                        if(resultSet.next()) {
                        %>  
                        <button onclick="window.print();return 0;" class="btn btn-dark mt-4" id="download">Download</button>

                        <h4>Report from <%= from_ %> to <%= to_ %></h4>
                        <%= action %>
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
                                <td><%= resultSet.getString("source") %></td> 
                                <td><%= resultSet.getString("acc_id") %></td> 
                                <td><%= resultSet.getString("action")%></td> 
                                <td><%= resultSet.getInt("transaction.amount")  %> RWF</td>  
                                <td><%= resultSet.getString("transaction.created_date") %>  </td> 

                            </tr> 

                            <%
                            }

                        }else{
                        out.print("No data to show");
                    }
 
                      resultSet.close();
                 
                 
                    } else {
                        out.println("Generate report");
                    } 

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
