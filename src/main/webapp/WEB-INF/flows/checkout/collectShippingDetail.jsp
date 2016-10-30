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
<%@ page isELIgnored="false" %>
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Cutomer</h1>


            <p class="lead">Customer Details:</p>
        </div>

        <form:form commandName="order" class="form-horizontal">

        <h3>Shipping Address:</h3>

        <div class="form-group">
            <label class="control-label col-sm-2" for="shippingStreet">Street Name</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.shippingAddress.streetName" id="shippingStreet" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="shippingApartmentNumber">Apartment Number</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.shippingAddress.apartmentNumber" id="shippingApartmentNumber" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="shippingCity">City</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.shippingAddress.city" id="shippingCity" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label  class="control-label col-sm-2" for="shippingState">State</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.shippingAddress.state" id="shippingState" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label  class="control-label col-sm-2" for="shippingCountry">Country</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.shippingAddress.country" id="shippingCountry" class="form-Control" />
        </div></div>

        <div class="form-group">
            <label  class="control-label col-sm-2" for="shippingZip">Zipcode</label>
             <div class="col-sm-10">
            <form:input path="cart.customer.shippingAddress.zipCode" id="shippingZip" class="form-Control" />
        </div></div>

        
        <input type="hidden" name="_flowExecutionKey" />

        <br/><br/>

        <button class="btn btn-info" name="_eventId_backToCollectCustomerInfo">Back</button>

        <input type="submit" value="Next" class="btn btn-info" name="_eventId_shippingDetailCollected" />

        <button class="btn btn-info" name="_eventId_cancel">Cancel</button>

        </form:form>
        </div></div>

<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>