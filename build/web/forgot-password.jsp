<%-- 
    Document   : forgot-process
    Created on : Jul 17, 2023, 2:40:08 PM
    Author     : Isacal_iprc
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<title>password request</title>
</head>

<body>
<%

try
{

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/library2","root",""); 

Statement st=con.createStatement();

String email=request.getParameter("email");

String strQuery = "SELECT password FROM user where Email='"+email+"'";

ResultSet rs = st.executeQuery(strQuery);


if(rs.next()){

	out.println("Password send to your email id successfully !<br>");
        out.println("Go check it from your Email. !<br>");
}

else{
	out.println("Invalid Email Id !");
}
}
catch (Exception e){

e.printStackTrace();

}

%>

</body>

</html>


