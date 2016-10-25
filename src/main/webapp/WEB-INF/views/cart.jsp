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
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="<c:url value="/resources/js/controller.js"></c:url>"></script>
	
	<style >
	 body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
      background:#333;
  }
	
	</style>
</head>
<body>
<div class="container-wrapper">
<div class="container">

<div class="jumbotron">
<div class="container">
<h3>VIEW THE CART !!!</h3>
<p>ALL THE SELECTED BOOKS</p>
</div>
</div>

<div ng-app="app" ng-controller="myController">
<div  ng-init="getCart(${cartId})">

<h3>LIST OF CART ITEMS</h3>
<br>
<div>
<a class="btn btn-danger pull-left" ng-click = "clearCart()">
 <span class="glyphicon glyphicon-remove-sign">
 </span> Clear Cart
</a>
</div>

<br><br>
<table    class="table  ">
<thead>
<tr class="">
<th>TITLE</th>
<th>PRICE</th>
<th>QUANTITY</th>
<th>TOTAL PRICE</th>
<th>ACTION</th>
</tr>
</thead>
<tr ng-repeat="cartitem in cart.cartItem">
<td>{{cartitem.book.title}}</td>
<td>{{cartitem.book.price}}</td>
<td>&nbsp &nbsp &nbsp  {{cartitem.quantity}}</td>
<td>&nbsp &nbsp {{cartitem.price}}</td>
<td><a href="#" class="label label-danger" ng-click="removeFromCart(cartitem.cartItemId)" ><span class="glyphicon glyphicon-remove"></span>remove</a> </td>
</tr>
</table>
<br>
 <h4 align="center">Grand Total : {{calculateGrandTotal()}}</h4>
 <br>
 <c:url value="/booksListAngular" var="url"></c:url>
<a href="${url}" class="btn btn-info">Continue shopping</a>
 <br><br>
</div>
</div>
</div>
</div>

</body>
<br>
<%@ include file="footer.jsp" %>
</html>