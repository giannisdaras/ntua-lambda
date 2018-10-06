<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator Login System</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
<h2>My password is _______</h2>
<c:if test="${wrong_pass=='yes'}">
<script>
alert("Wrong pass");
</script>
</c:if>
<form action="Checker" method="post" name="myForm">
<div class="container">
<div class="Input">
    <input type="password" name="pass" id="pass" class="Input-text" placeholder="Password">
    <label for="pass" class="Input-label">Password</label>
</div>
</div>

<div class="container">
<div class="col-md-12 col-sm-12 col-xs-12"> 
<a href="#" onclick="document.forms['myForm'].submit(); return false;" class="btn btn-sm animated-button sandy-four">
Login to DB Admin System</a> 
</div>
</div> 

</form>
</body>

</html>