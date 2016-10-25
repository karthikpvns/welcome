<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<footer class='footer section--large'>
   

<div class= 'container-wrapper text-center'>
<form class="form-inline">
  <div class="form-group">
    <label for="home"><a href="<c:url value="/home" />">Home </a>&nbsp</label>
  </div>
  
  <div class="form-group">
    <label for="features"><a href="<c:url value="/about" />">Contact</a> &nbsp</label>
  </div>
<div class="form-group">
    <label for="About"><a href="<c:url value="/about" />">About</a></label>
  </div>
</form>
</div>
    <div class='container-wrapper text-center footer__copyright'>
      © <script>document.write(new Date().getFullYear());</script> BookStore.Me Inc. All rights reserved.
      <a href='/legal/terms'>Terms of Service</a>
      &
      <a href='/legal/privacy'>Privacy Policy.</a>
    </div>
  </footer>

</body>
</html>