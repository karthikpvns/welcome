<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


 <%@include file="header.jsp" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<style >

  body { 
       font: 400 15px/1.8 Lato, sans-serif; 
       color: #777; 
        background: #333; 
   } 
  
  

</style>
</head>

<body >
 
<div class="container-wrapper">
<div class="container">
  <div class="page-header">
  <h2>About Us :</h2>
  <p class="lead"> We Strive to build a suitable platform for customers and provide a best experience to users.
      Providing best products and their happiness is our main concern...</p> 
</div> 
</div>
</div>

<div class="container">
  <p class="text-center">Contact</p>
  <p class="text-center"><em>We love to hear from you !</em></p>
  <div class="row test">
    <div class="col-md-4">
      <p>Problem? Drop a note.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>New Jersey, US</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +00 1423231414</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: karthik.pvns@gmail.com</p> 
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <div class="row">
        <div class="col-md-12 form-group">
          <br>
          <button class="btn  pull-right" type="submit">Send</button>
        </div>
      </div> 
    </div>
  </div>
</div>
 
</body>
 <%@ include file="footer.jsp" %> 
</html>