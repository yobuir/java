
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

String amount = request.getParameter("amount");
String account_no = request.getParameter("account_no");  


try{
    String Amounts;
    String loggedUser=(String)session.getAttribute("loggedUser");  
     Integer TotalAmount;
     Integer TotalAmountAdded;
              
    String emailFLogged=(String)session.getAttribute("loggedUser");   
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
     PreparedStatement psSelect = conn.prepareStatement("select * from user,accounts where accounts.user_id = user.id and user.id = ? ");

    psSelect.setString(1, emailFLogged);  
    ResultSet resultSet = psSelect.executeQuery();  
    resultSet.next();
    String account_id= resultSet.getString("acc_id");
               
           PreparedStatement SelectAccountAmount = conn.prepareStatement("select amount from accounts where user_id=?");
           SelectAccountAmount.setString(1,loggedUser);
          
//           SelectAccountNumber to send money to

            PreparedStatement SelectAccountNumber = conn.prepareStatement("select * from accounts where acc_id=? and acc_id !=?");
           SelectAccountNumber.setString(1,account_no);
            SelectAccountNumber.setString(2,account_id);
           
           
         
            ResultSet resultSetAmount = SelectAccountAmount.executeQuery(); 
            ResultSet resultSelectAccountNumber = SelectAccountNumber.executeQuery();
            
            if(resultSelectAccountNumber.next()){
                if(resultSetAmount.next()) {
                    Amounts=resultSetAmount.getString("amount"); 

                    if(Integer.parseInt(Amounts) > Integer.parseInt(amount)) {
                      TotalAmount= Integer.parseInt(Amounts)- Integer.parseInt(amount);
                      TotalAmountAdded = Integer.parseInt(Amounts)-Integer.parseInt(amount);


                  PreparedStatement updateAccountAmount = conn.prepareStatement("update accounts set amount=? where user_id=?");

                  updateAccountAmount.setInt(1,TotalAmount); 
                  updateAccountAmount.setString(2,loggedUser);
                  updateAccountAmount.executeUpdate();


                  PreparedStatement UpdateAccountReceived=conn.prepareStatement("update accounts set amount=? where acc_id=?");
                  UpdateAccountReceived.setInt(1, TotalAmountAdded);
                  UpdateAccountReceived.setString(2,account_no);
                  UpdateAccountReceived.executeUpdate();


                    PreparedStatement psInsert = conn.prepareStatement("insert into transaction(`to_`,`amount`,`action`,`account_number`,`source`) values(?,?,?,?,?)");

                      psInsert.setString(1,account_no);      
                      psInsert.setString(2,amount);  
                      psInsert.setString(3,"transfer"); 
                      psInsert.setString(4,account_id);
                      psInsert.setString(5,account_no); 
                      psInsert.execute(); 
                    
                     response.sendRedirect("dashboard.jsp");

              }else{
                out.println("no enough funds");
              }

          }else{
          out.println("no record found");
              }
            }else{
            out.println("Invalid account number");
    }


         
 
    }catch(Exception e){
    out.println(e);
    }    
%>