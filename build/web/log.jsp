
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
  PreparedStatement psSelect = conn.prepareStatement("select * from user where email = ? and password = ? ");
 
  psSelect.setString(1, email);
  psSelect.setString(2, password);  
  
  ResultSet resultSet = psSelect.executeQuery();
  
  if(resultSet.next()){
  
   String emailId = resultSet.getString("email");
   session.setAttribute("loggedUser", emailId);
   
   response.sendRedirect("dashboard.jsp");
    
    }
    else{
    out.println("failed to log in");
    }
    
    }catch(Exception e){
    out.print(e);
    }    
%>