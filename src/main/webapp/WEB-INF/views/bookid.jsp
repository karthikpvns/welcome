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
	
	<style >
	 body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
      background:whitesmoke;
  }
	
	</style>
	
</head>
<body >
<br>
      <h2 align="center">View The Details Of Book.</h2>
<div class="container">
<!--   <div class="row test"> -->
    <div class="col-md-4">
      <c:url value="/resources/images/${book.isbn }.png" var="src" />
       <p><img src="${src}" style="width: 280px ; height: 350px" /></p>
    </div>
    <div class="col-md-8">
           <br>
           <p> ISBN :${book.isbn}</p>
           <p> TITLE :${book.title}</p>
           <p> CATEGORY :${book.category.categoryname}</p>
 
    </div>
  </div>
</div>


</body>
</html>