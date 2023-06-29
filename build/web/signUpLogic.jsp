
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

String email = request.getParameter("email");
String Password = request.getParameter("password");
String C_Password = request.getParameter("c_password");
String names = request.getParameter("name");


try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
  PreparedStatement psSelect = conn.prepareStatement("select * from user where email = ? ");
 
  psSelect.setString(1, email); 
  
  ResultSet resultSet = psSelect.executeQuery(); 
  
   if(resultSet.next()){ 
        out.println("email is already used");
    }
    else{
        if(Password.equals(C_Password)) {
            PreparedStatement psInsert = conn.prepareStatement("insert into user(`names`,`email`,`password`) values(?,?,?)");
          
           psInsert.setString(1,names);      
           psInsert.setString(2,email); 
           psInsert.setString(3,Password); 
           
            psInsert.execute(); 
       
                 response.sendRedirect("login.jsp");
            


       }else{ 
        out.println("confirm password");
       }
    }
    
    }catch(Exception e){
    out.print(e);
    }    
%>