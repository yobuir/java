
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

String amount = request.getParameter("amount");
String source = request.getParameter("source");  


try{
    String Amounts;
    String loggedUser=(String)session.getAttribute("loggedUser");  
     Integer TotalAmount;
              
    String emailFLogged=(String)session.getAttribute("loggedUser");   
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
     PreparedStatement psSelect = conn.prepareStatement("select * from user,accounts where accounts.user_id = user.id and user.id = ? ");

    psSelect.setString(1, emailFLogged);  
    ResultSet resultSet = psSelect.executeQuery();  
    resultSet.next();
    String account_id= resultSet.getString("acc_id");
              
            PreparedStatement psInsert = conn.prepareStatement("insert into transaction(`to_`,`amount`,`action`,`account_number`,`source`) values(?,?,?,?,?)");
          
           psInsert.setString(1,account_id);      
           psInsert.setString(2,amount);  
           psInsert.setString(3,"deposit"); 
           psInsert.setString(4,account_id);
           psInsert.setString(5,source); 
            
           PreparedStatement SelectAccountAmount = conn.prepareStatement("select amount from accounts where user_id=?");
           SelectAccountAmount.setString(1,loggedUser);
            ResultSet resultSetAmount = SelectAccountAmount.executeQuery(); 
             if(resultSetAmount.next()) {
                  Amounts=resultSetAmount.getString("amount"); 
                   
                  TotalAmount= Integer.parseInt(Amounts) + Integer.parseInt(amount);
                  
                                
                PreparedStatement updateAccountAmount = conn.prepareStatement("update accounts set amount=? where user_id=?");

                updateAccountAmount.setInt(1,TotalAmount); 
                updateAccountAmount.setString(2,loggedUser);
                updateAccountAmount.executeUpdate();
  
                psInsert.execute(); 
               session.setAttribute("amount", Amounts);
   
                response.sendRedirect("pay.jsp");
                
                }else{
                   
    }

         
 
    }catch(Exception e){
    out.print(e);
    }    
%>