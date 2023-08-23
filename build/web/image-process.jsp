
<%@page import="java.util.Map"%>
<%@page import="java.sql.*" %> 
<%@ page import="com.cloudinary.Cloudinary" %>
<%@ page import="com.cloudinary.utils.ObjectUtils" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.cloudinary.Cloudinary" %>
<%@ page import="com.cloudinary.utils.ObjectUtils" %>
 
<% 
    
  // Set Cloudinary configuration using environment variables
  Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
      "cloud_name",  "input-yobu" ,
      "api_key", "758463827128394" ,
      "api_secret", "jpebZFbXtc8ro0blz0rJdgib-bo"
  ));
    
  // Get the uploaded file
  Part filePart = request.getPart("image");

  // Upload the file to Cloudinary
  Map uploadResult = cloudinary.uploader().upload(filePart.getInputStream(), ObjectUtils.emptyMap());

  // Get the URL of the uploaded image from the Cloudinary response
  String imageUrl = (String) uploadResult.get("secure_url");
 
  out.println(imageUrl);

 
%>

  