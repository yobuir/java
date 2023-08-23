<%-- 
    Document   : change
    Created on : Jul 17, 2023, 4:12:25 PM
    Author     : Isacal_iprc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%@page import="java.io.*"%>

<%

String currentPassword=request.getParameter("current");

String Newpass=request.getParameter("new");

String conpass=request.getParameter("confirm");

String connurl = "jdbc:mysql://localhost:3306/library2";

Connection con=null;

String pass="";

int id=0;
try{
Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection(connurl, "root", "");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from users where password='"+currentPassword+"'");

while(rs.next()){

id=rs.getInt(1);

pass=rs.getString(7);

}

System.out.println(id+ " "+pass);

if(pass.equals(currentPassword)){

Statement st1=con.createStatement();

int i=st1.executeUpdate("update users set password='"+Newpass+"' where user_id='"+id+"'");

out.println("Password changed successfully");

st1.close();

con.close();

}

else{

out.println("Invalid Current Password");

}

}
catch(Exception e){
out.println(e);

}

%>


