<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/views/header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">

body {
   font: 400 15px/1.8 Lato, sans-serif; 
       color: #777; 
        background: #333; 
}

</style>
</head>

<body>
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Cutomer</h1>


            <p class="lead">Customer Details:</p>
        </div>

        <form:form commandName="order" class="form-horizontal">

        <h3>Basic Info:</h3>

        <div class="form-group">
            <label class="control-label  col-sm-2"  for="name">Name</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.customerName" id="name" class="form-Control" />
        </div>
        </div>
        <div class="form-group">
            <label class="control-label  col-sm-2"  for="email">Email</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.customerEmail" id="email" class="form-Control" />
        </div>
        </div>

        <div class="form-group">
            <label class="control-label  col-sm-2"  for="phone">Phone</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.customerPhone" id="phone" class="form-Control" />
        </div></div>

        <br/>

        <h3>Billing Address:</h3>

        <div class="form-group">
            <label  class="control-label  col-sm-2"  for="billingStreet">Street Name</label>
            <div class="col-sm-10">
            <form:input path="cart.customer.billingAddress.streetName" id="billingStreet" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label class="control-label  col-sm-2"  for="billingApartmentNumber">Apartment Number</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.billingAddress.apartmentNumber" id="billingApartmentNumber" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label class="control-label  col-sm-2"  for="billingCity">City</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.billingAddress.city" id="billingCity" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label class="control-label  col-sm-2"  for="billingState">State</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.billingAddress.state" id="billingState" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label class="control-label  col-sm-2"  for="billingCountry">Country</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.billingAddress.country" id="billingCountry" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label  class="control-label  col-sm-2"  for="billingZip">Zipcode</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.billingAddress.zipCode" id="billingZip" class="form-Control" />
        </div></div>

        <input type="hidden" name="_flowExecutionKey" />

        <br/><br/>
        <!--  on attribute - assign event id -->
        <!--  to attribute id value in state -->

        <input type="submit" value="Next" class="btn btn-info" name="_eventId_customerInfoCollected" />

        <button class="btn btn-info"    name="_eventId_cancel">Cancel</button>
        </form:form>
        </div></div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>

</html>