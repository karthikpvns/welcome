<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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

  <style>
 
 
 body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
  }
  
  
 .navbar li a, .navbar .navbar-brand {
      color: #d5d5d5 !important;
  }

/* On hover, the links will turn white */
.navbar-nav li a:hover {
    color: #fff !important;
}

/* The active link */
.navbar-nav li.active a {
    color: #fff !important;
    background-color:#29292c !important;
}

/* Remove border color from the collapsible button */
.navbar-default .navbar-toggle {
    border-color: transparent;
}

/* Dropdown */
.open .dropdown-toggle {
    color: #fff ;
    background-color: #555 !important;
}

/* Dropdown links */
.dropdown-menu li a {
    color: #000 !important;
}

/* On hover, the dropdown links will turn red */
.dropdown-menu li a:hover {
    background-color: red !important;
}


  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img { 
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
   @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
   .navbar {
   font-family: Montserrat, sans-serif; 
      margin-bottom: 0;
     background-color: #2d2d30;
      border:0;
      font-size: 11px !important;
      letter-spacing: 4px;
   opacity: 3.9; 
  }
  textarea {
      resize: none;
  }
  </style>


</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">


<!-- <div class="navbar-wrapper"> -->
<!--     <div class="container"> -->

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <c:url value="/resources/images/logo9.png" var="src" />
                   <a href="<c:url value="/home" />"  class="navbar-left"> <img src="${src}"  style="width: 135px"/></a>

                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="<c:url value="/home" />">Home</a></li>
                        <li><a href="<c:url value="/booksListAngular"/>">Browse All Books</a></li>
                       <c:if test="${pageContext.request.userPrincipal.name!=null}">
                       <security:authorize   access="hasRole('ROLE_ADMIN')" >
                       <li><a href="<c:url value="/admin/book/addBook"/>">Add New Book</a></li>
                       </security:authorize>
                
                       </c:if>
                        <li><a href="<c:url value="/about" />">About Us</a></li>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                    
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                        
                            <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
                            
                            <li> <a href="<c:url value="/logout" />">Logout</a></li>
<%--                            <li><a href="<c:url value="/j_spring_security_logout"  var="x" />">Logout1</a></li> --%>

                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                             <security:authorize  access="hasRole('ROLE_USER')">
                                <li><a href="<c:url value="/customer/cart" />">Cart</a></li>
                                 </security:authorize>
                            </c:if>

                           <%--  <c:if test="${pageContext.request.userPrincipal.name == 'kar'}">
                                <li><a href="<c:url value="/admin" />">Admin</a></li>
                            </c:if> --%>

                        </c:if>

                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li><a href="<c:url value="/login" />">Login</a></li>
                            <li><a href="<c:url value="/customer/registration" />">Register</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>

 </body> 

</html>