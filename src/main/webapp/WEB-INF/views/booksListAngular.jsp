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

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<%-- <script src="<c:url value="/resources/js/controller.js"></c:url>"></script> --%>
</head>
<body>
<div ng-app="app">
<div ng-controller="myController" ng-init="getBookList()">

Search :<input type="text" ng-model="SearchCondition" placeholder="Search Book">
        
<br>
<table    class="table table-striped table-hover">
<thead>
<tr class="bg-info">
<th>Image</th>
<th>ISBN</th>
<th> TITLE</th>
<th> CategoryName</th>
<th>Price</th>
 <c:if test="${pageContext.request.userPrincipal.name!=null}">
                       <security:authorize   access="hasRole('ROLE_ADMIN')" >
                      <th> View/Delete/edit</th>
                       </security:authorize>
                  <security:authorize  access="hasRole('ROLE_USER')"  >
                  	<th  > View Info </th>
                  
                  </security:authorize>
                                     
                       </c:if>

</tr>
</thead>

<tr ng-repeat="x in books|filter:SearchCondition">
<c:url value="/resources/images/${x.isbn }.png" var="src" />

<td ><img src="${src}" style="width: 100px" align="middle"/></td>

<%--  <td> <img src="<c:url value="/resources/images/${x.isbn}.png" />" width="10%"/></td> --%>
  <td><a href="gbyid/${x.isbn}">${x.isbn}</a></td>
  <td> ${x.title}</td>
  <td> ${x.category.categoryname}</td>
  <td>${x.price} </td>
  <td> <a href="gbyid/${x.isbn}"><span class="glyphicon glyphicon-info-sign"></span></a>
       <security:authorize   access="hasRole('ROLE_ADMIN')" >
     / <a href="delete/${x.isbn}"><span class="glyphicon glyphicon-trash"></span></a>
      / <a href="admin/book/editBook/${x.isbn}"> <span class="glyphicon glyphicon-edit"></span></a>
      </security:authorize>
      
      </td>
</tr>

</table>

<br><br>

</div>
</div>
</div>

<script >
var app=angular.module('app',[]);
app.controller('myController',function($scope,$http){
	$scope.getBookList=function(){
		$http.get("http://localhost:9080/welcome/getBooksList").then(function(response){
			$scope.books=response.data;
		});
	};
});


</script>



</body>
</html>