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
<style type="text/css">
 body { 
       font: 400 15px/1.8 Lato, sans-serif; 
       color: #777; 
        background: whitesmoke; 
   } 
  
</style>

</head>
<body>
<div class="container-wrapper" >
<div class="container">
<div id="login-box">
<h2>Login with Username and Password</h2>

<c:if test="${not empty registrationSuccess}">
<br>
<div style="color: #ff0000;"> ${registrationSuccess}</div>    
<br>
</c:if>


<c:if test="${not empty logout}">
<br>
<div class="logout" style="color: #ff0000;">${logout}</div>
<br>
</c:if>
<form name="loginForm" action="<c:url  value="/j_spring_security_check" var="url" />" method="post">
<c:if test="${not empty error}">
<br>
<div  class="error" style="color: #ff0000;"> ${error} </div>
<br>
</c:if>
<div class="form-group">
<label for="username" >Username:</label>
<input type="text" id="username" name="username" class="form-control" />
</div>
<div class="form-group">
<label for="password" >Password:</label>
<input type="password" id="password" name="password" class="form-control" />
</div>
<input type="submit" value="submit" class="btn btn-info" />
<%--  <input  type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" /> --%>


</form>

</div>
</div>
</div>



</body>
</html>