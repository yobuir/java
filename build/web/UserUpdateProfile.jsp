<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% 
String name = request.getParameter("name");
String email = request.getParameter("email");  
    String loggedUser=(String)session.getAttribute("loggedUser");


try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
  PreparedStatement ps = conn.prepareStatement("update user set names=?,email=? where id=?");

  ps.setString(1,name);
  ps.setString(2,email); 
  ps.setString(3,loggedUser);

  int x = ps.executeUpdate();
  if(x > 0){
  out.println("Data sucessfully updated");
  
    response.sendRedirect("profile.jsp");
    }
    else{
    out.println("edition failed");
    }
    
    }catch(Exception e){
    out.print(e);
    }    
%>
