<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New customer</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
<div class="row center">
<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12" style="margin-bottom: 5rem; padding-left: 5rem;"> <a href="welcome.jsp" class="btn btn-sm animated-button thar-three"> Home</a> </div>
<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12" style="margin-bottom: 5rem; padding-right: 5rem;"> <a href="hotelSelection.jsp" class="btn btn-sm animated-button thar-four"> Hotel Criteria</a> </div>
</div>

<h2> We couldn't find you at our database</h2>

<form action="newCustomer" method="post" name="myForm">

<!-- Getting parameter values  -->
<c:set var="room_id" scope="session" value="${param.room_id}"/>
<c:set var="hotel_id" scope="session" value="${param.hotel_id}"/>
<c:set var="irs" scope="session" value="${param.irs}"/>

<div class="container">
<div class="Input">
    <input type="text" name="name" id="name" class="Input-text" placeholder="First Name">
    <label for="name" class="Input-label">First Name</label>
</div>
</div>

<div class="container">
<div class="Input">
    <input type="text" name="surname" id="surname" class="Input-text" placeholder="Last Name">
    <label for="surname" class="Input-label">Last Name</label>
</div>
</div>


<div class="container">
<div class="Input">
    <input type="text" name="city" id="city" class="Input-text" placeholder="City">
    <label for="city" class="Input-label">City</label>
</div>
</div>


<div class="container">
<div class="Input">
    <input type="text" name="street" id="street" class="Input-text" placeholder="Street">
    <label for="street" class="Input-label">Street</label>
</div>
</div>


<div class="container">
<div class="Input">
    <input type="text" onkeypress="return isNumberKey(event)" name="num" id="num" class="Input-text" placeholder="Number of street">
    <label for="num" class="Input-label">Number</label>
</div>
</div>


<div class="container">
<div class="Input">
    <input type="text" onkeypress="return isNumberKey(event)" name="postal" id="postal" class="Input-text" placeholder="Postal code">
    <label for="postal" class="Input-label">Postal code</label>
</div>
</div>

<div class="container">
<div class="Input">
    <input type="text" onkeypress="return isNumberKey(event)" name="ssn" id="ssn" class="Input-text" placeholder="Social Security Number">
    <label for="ssn" class="Input-label">Social Security Number</label>
</div>
</div>

<div class="container">
<div class="col-md-12 col-sm-12 col-xs-12""> 
<a href="#" onclick="document.forms['myForm'].submit(); return false;" style="margin-bottom: 10rem"class="btn btn-sm animated-button sandy-four">
Register</a> 
</div>
</div>


</form>
	<!-- Validating numbers -->
	<script>
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
</script>
</body>
</html>