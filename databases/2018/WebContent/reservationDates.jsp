<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dates Selection Page</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>

<!-- Getting parameter values  -->
<c:set var="room" scope="session" value="${param.room}"/>
<c:set var="hotel" scope="session" value="${param.hotel}"/>
<c:set var="irs" scope="session" value="${param.irs}"/>
<c:set var="name" scope="session" value="${param.name}"/>
<c:set var="surname" scope="session" value="${param.surname}"/>


<h2> Welcome back ${name} ${surname}</h2>
<h2> One last step </h2>
<form name="myForm" method="post" action="Reservation">
<h3 style="margin-bottom: 3rem;">My start date is </h3>
<div class="container">
    <select name="start-date-selector" class="bear-dates"></select>
    
    <select name="start-month-selector" class="bear-months"></select>
    
    <select name="start-year-selector" class="bear-years"></select>
</div>

<h3 style="margin-bottom: 3rem;">My end date is </h3>
<div class="container">
    <select name="end-date-selector" class="bear-dates"></select>
    
    <select name="end-month-selector" class="bear-months"></select>
    
    <select name="end-year-selector" class="bear-years"></select>
</div>
<input style="display:none" type="text" name="name" value="${name}">
<input style="display:none" type="text" name="room" value="${room}">
<input style="display:none" type="text" name="irs" value="${irs}">
<input style="display:none" type="text" name="surname" value="${surname}">
<input style="display:none" type="text" name="hotel" value="${hotel}">



<div class="container">
<div class="col-md-12 col-sm-12 col-xs-12"> 
<a href="#" onclick="document.forms['myForm'].submit(); return false;" class="btn btn-sm animated-button sandy-four">
Reserve</a> 
</div>
</div>
</form>
<script src="js/calender.js" type="text/javascript"></script>
<script type="text/javascript">
dates('option');
months('option');
years('option', 2018, 2025);
</script>
</body>
</html>