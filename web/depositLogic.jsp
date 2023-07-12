
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

String amount = request.getParameter("amount");
String source = request.getParameter("source");  


try{
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
           psInsert.execute(); 
           response.sendRedirect("dashboard.jsp");
         
 
    }catch(Exception e){
    out.print(e);
    }    
%>