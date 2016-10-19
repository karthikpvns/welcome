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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js" ></script>
<style type="text/css">

.container-wrapper {
   /* height:80%;*/
   
/*     margin-top: 80px; */
/*     margin-bottom: 300px;
whitesmoke */
   background: whitesmoke; 
}


</style>
</head>
<body>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1><strong> Register Here</strong></h1>

            <p class="lead">Please fill in your information below:</p>
        </div>
        <c:url value="/customer/registration" var="url"></c:url>
        <form:form action="${url }" method="post" commandName="customer"  class="form-horizontal" >

        <h3>Basic Info:</h3>

        <div class="form-group">
            <label class="control-label  col-sm-2"  for="name">Name</label>
            <form:errors path="customerName" cssStyle="color: #ff0000" />
            <div   class="col-sm-10">
            <form:input path="customerName"  class="form-Control" />
        </div>
        </div>
        <c:if test="${not empty duplicateemail}">
        <br>
         <div style="color: #ff0000;">${duplicateemail}</div>
        <br>
        </c:if>
        <div class="form-group">
            <label  class="control-label  col-sm-2 " for="email">Email</label>
            <form:errors path="customerEmail" cssStyle="color: #ff0000" />
            <div class="col-sm-10">
            <form:input path="customerEmail"  class="form-Control" />
        </div>
         </div>
        <div class="form-group">
            <label  class="control-label col-sm-2" for="phone">Phone</label>
            <div class="col-sm-10">
            <form:input path="customerPhone"  class="form-Control" />
        </div>
        </div>
        <c:if test="${not empty duplicatename}">
        <br>
         <div style="color: #ff0000;">${duplicatename}</div>
        <br>
        </c:if>

        <div class="form-group">
            <label  class="control-label  col-sm-2" for="username">Username</label>
            <form:errors path="users.username" cssStyle="color: #ff0000" />
            <div class="col-sm-10">
            <form:input path="users.username"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label  class="control-label col-sm-2"  for="password">Password</label>
            <form:errors path="users.password" cssStyle="color: #ff0000" />
            <div class="col-sm-10">
            <form:password path="users.password" class="form-Control" />
        </div>
        </div>


        <br/>

        <h3>Billing Address:</h3>

        <div class="form-group">
            <label class="control-label col-sm-2" for="billingStreet ">Street Name</label>
            <div class="col-sm-10">
            <form:input path="billingAddress.streetName"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="billingApartmentNumber ">Apartment Number</label>
            <div class="col-sm-10">
            <form:input path="billingAddress.apartmentNumber"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="billingCity ">City</label>
            <div class="col-sm-10">
            <form:input path="billingAddress.city"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label  class="control-label col-sm-2" for="billingState ">State</label>
            <div class="col-sm-10">
            <form:input path="billingAddress.state" class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="billingCountry ">Country</label>
            <div class="col-sm-10">
            <form:input path="billingAddress.country"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="billingZip">Zipcode</label>
            <div class="col-sm-10">
            <form:input path="billingAddress.zipCode"  class="form-Control" />
        </div>
        </div>

        <br/>

        <h3>Shipping Address:</h3>

        <div class="form-group">
            <label class="control-label col-sm-2" for="shippingStreet">Street Name</label>
            <div class="col-sm-10">
            <form:input path="shippingAddress.streetName"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label  class="control-label col-sm-2" for="shippingApartmentNumber">Apartment Number</label>
            <div class="col-sm-10">
            <form:input path="shippingAddress.apartmentNumber" class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2"  for="shippingCity">City</label>
            <div class="col-sm-10">
            <form:input path="shippingAddress.city" class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="shippingState">State</label>
            <div class="col-sm-10">
            <form:input path="shippingAddress.state"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label  class="control-label col-sm-2" for="shippingCountry">Country</label>
            <div class="col-sm-10">
            <form:input path="shippingAddress.country"  class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label  class="control-label col-sm-2"  for="shippingZip">Zipcode</label>
            <div class="col-sm-10">
            <form:input path="shippingAddress.zipCode" class="form-Control" />
        </div>
        </div>

        <br/><br/>

        <input type="submit" value="submit" class="btn btn-info">
         <a href="<c:url value="/home" />" class="btn btn-default">Cancel</a>
         <br>

        </form:form>

</div>
</div>




</body>
</html>