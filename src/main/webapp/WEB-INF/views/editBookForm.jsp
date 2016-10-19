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

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1><strong> Edit the Book Details</strong></h1>
<c:if test="${pageContext.request.userPrincipal.name != null}">
                        
                            <p class="lead">Welcome: ${pageContext.request.userPrincipal.name}</p>
                            </c:if>
        </div>
        <c:url value="/admin/book/editBook" var="url"></c:url>
<form:form method="post" action="${url}" commandName="editbookObj" enctype="multipart/form-data" class="form-horizontal" >

 <div class="form-group">
 <form:label  class="control-label  col-sm-2"  path="isbn"></form:label>
            <div   class="col-sm-10">
            <form:hidden path="isbn"  class="form-Control" />
        </div>
        </div>
        <div class="form-group">
 <form:label  class="control-label  col-sm-2"  path="title">Title</form:label>
            <form:errors path="title" cssStyle="color: #ff0000" />
            <div   class="col-sm-10">
            <form:input path="title"  class="form-Control" />
        </div>
        </div>
        
<div class="form-group">
 <form:label  class="control-label  col-sm-2"  path="publisher">Publisher</form:label>
            <form:errors path="publisher" cssStyle="color: #ff0000" />
            <div   class="col-sm-10">
            <form:input path="publisher"  class="form-Control" />
        </div>
        </div>

<div class="form-group">
 <form:label  class="control-label  col-sm-2"  path="price">Price</form:label>
            <form:errors path="price" cssStyle="color: #ff0000" />
            <div   class="col-sm-10">
            <form:input path="price"  class="form-Control" />
        </div>
        </div>
        <div class="form-group">
 <form:label  class="control-label  col-sm-2"  path="category">Category</form:label>
            <form:errors path="publisher" cssStyle="color: #ff0000" />
            <div   class="col-sm-10">
            
           <form:radiobutton path="category.cid" value="1" class="form-Control"/>NEW ENTRY
     <form:radiobutton path="category.cid" value="2" class="form-Control"/>SPECIAL EDITION 
     <form:radiobutton path="category.cid" value="3" class="form-Control"/>DISCOUNT 
        </div>
        </div>
        
        <div class="form-group">
        <form:label  class="control-label  col-sm-2"  path="bookImage">Choose Image</form:label>
        <div   class="col-sm-10">
        <form:input  type="file"  path="bookImage"  class="form-Control"/>  
        </div></div>
         <div class="form-group">
         <form:label  class="control-label  col-sm-2"  path=""></form:label>
            <div   class="col-sm-10">

         <input type="submit" value="EDIT" class="btn btn-info">
         </div></div>
         <br>
       
</form:form>
</div></div>

<%-- 

<c:url value="/admin/book/editBook" var="url"></c:url>
<form:form method="post" action="${url}" commandName="editbookObj" enctype="multipart/form-data">
   <table> 
     <tr>
      <td><form:label path="isbn"></form:label></td>
      <td><form:hidden path="isbn"/> </td>
     </tr>
     <tr>
      <td><form:label path="title">TITLE</form:label></td>
      <td><form:input path="title"/> </td>
     </tr>
     <tr>
      <td><form:label path="publisher">PUBLISHER</form:label></td>
      <td><form:input path="publisher"/> </td>
     </tr>
     <tr>
      <td><form:label path="price">PRICE</form:label></td>
      <td><form:input path="price"/> </td>
     </tr>
     <tr>
     <td> <form:label path="category">CATEGORY &nbsp</form:label> </td>
     <td><form:radiobutton path="category.cid" value="1"/>NEW ENTRY</td>
     <td><form:radiobutton path="category.cid" value="2"/>SPECIAL EDITION </td>
     <td><form:radiobutton path="category.cid" value="3"/>DISCOUNT </td>
     </tr>
     <tr>
     <td><form:input path="bookImage"  type="file"  /> </td>
     </tr>
     
     <tr>
     <td colspan="2"> <input type="submit" value="EDIT BOOK"></td>
     </tr>
  
  </table>
</form:form>

 --%>

</body>
</html>