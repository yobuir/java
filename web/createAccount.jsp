<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<% 
        
    String id=(String)session.getAttribute("loggedUser");  
    String accountId = id+"acc";
try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root",""); 
           PreparedStatement psInsert = conn.prepareStatement("insert into accounts(`acc_id`,`user_id`) values(?,?)");
           psInsert.setString(1,accountId);      
           psInsert.setString(2,id);   
           
            psInsert.execute(); 
       
                 response.sendRedirect("dashboard.jsp");
            

 
    
    }catch(Exception e){
    out.print(e);
    }    
%>