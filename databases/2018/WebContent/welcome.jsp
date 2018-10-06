<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Home page</title>
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
		<link rel="stylesheet" href="theme.css">
	</head>
	<body>
	<div id="home">
	<h2>I am looking for _______</h2>
	</div>
	
	<div class="col-md-6 col-sm-6 col-xs-6"> <a href="${pageContext.request.contextPath}/hotelSelection.jsp" class="btn btn-sm animated-button sandy-one">Hotel</a> </div>
    <div class="col-md-6 col-sm-6 col-xs-6"> <a href="${pageContext.request.contextPath}/EmployeeLogin.jsp" class="btn btn-sm animated-button sandy-two">Employee section</a> </div>
  	<div class="centeredRow">
	<div class="row">
     <a style="margin-top: 5rem;" href="${pageContext.request.contextPath}/protectedLogin.jsp" class="btn btn-sm animated-button sandy-four">Database Administration System</a> 
	</div>
	</div>
	</body>
</html>