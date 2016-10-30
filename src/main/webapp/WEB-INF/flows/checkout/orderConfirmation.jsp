<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="now" class="java.util.Date" />
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
            <h1>Order</h1>

            <p class="lead">Order confirmation</p>
        </div>

        <div class="container">

            <div class="row">

                <form:form commandName="order" class="form-horizontal">

                    <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

                       <div class="txt-center">
                            <h1>Receipt</h1>
                       </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong>Shipping Address</strong><br/>
                                    ${order.cart.customer.shippingAddress.streetName}
                                <br/>
                                    ${order.cart.customer.shippingAddress.city}, ${order.cart.customer.shippingAddress.state}
                                <br/>
                                     ${order.cart.customer.shippingAddress.country}, ${order.cart.customer.shippingAddress.zipCode}
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>Shipping Date: <fmt:formatDate type="date" value="${now}" /></p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong>Billing Address</strong><br/>
                                        ${order.cart.customer.billingAddress.streetName}
                                    <br/>
                                        ${order.cart.customer.billingAddress.city}, ${order.cart.customer.billingAddress.state}
                                    <br/>
                                        ${order.cart.customer.billingAddress.country}, ${order.cart.customer.billingAddress.zipCode}
                                </address>
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td>Product</td>
                                        <td>Quantity</td>
                                        <td class="text-center">Price</td>
                                        <td class="text-center">Total</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="cartItem" items="${order.cart.cartItem}">
                                    <tr>
                                        <td class="col-md-9"><em>${cartItem.book.title}</em></td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.book.price}</td>
                                        <td class="col-md-1" style="text-align: center">${cartItem.price}</td>
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td class="text-right">
                                        <h4><strong>Grand Total:</strong></h4>
                                    </td>
                                    <td class="text-center text-danger">
                                        <h4><strong>$ ${order.cart.totalPrice}</strong></h4>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>


                        <input type="hidden" name="_flowExecutionKey" />

                        <br/><br/>

                        <button class="btn btn-info" name="_eventId_backToCollectShippingDetail">Back</button>

                        <input type="submit" value="Submit Order" class="btn btn-info" name="_eventId_orderConfirmed" />

                        <button class="btn btn-info" name="_eventId_cancel">Cancel</button>
                    </div>
                </form:form>
            </div>
        </div>

<%@ include file="/WEB-INF/views/footer.jsp" %>


</body>
</html>