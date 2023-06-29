<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<% 
    String name=(String)session.getAttribute("loggedUser");  
    out.print("Hello "+name);  
    
%>