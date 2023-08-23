
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>  
<%
try{ 
      session = request.getSession(false); // Get existing session, if any
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }
        response.sendRedirect("login.jsp");
    
    }catch(Exception e){
    out.print(e);
    }    
%>