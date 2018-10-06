<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
	<div class="container">
		<div class="row center">
			<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12"
				style="margin-bottom: 5rem; padding-left: 5rem;">
				<a href="welcome.jsp" class="btn btn-sm animated-button thar-three">
					Home</a>
			</div>
		</div>
	</div>

<!-- Getting parameter values  -->
<c:set var="room_id" scope="session" value="${param.room}"/>
<c:set var="hotel" scope="session" value="${param.hotel}"/>
<c:set var="irs_employee" scope="session" value="${param.irs_employee}"/>
<c:set var="irs_customer" scope="session" value="${param.irs_customer}"/>
<c:set var="price" scope="session" value="${param.price}"/>
<c:set var="reservation_id" scope="session" value="${param.reservation_id }"/>

<form name="myForm" method="post" action="RentServlet">
<h2>The payment method for this rent is 
<select name="paySelector" id="paySelector">
  <option value="MasterCard" selected="selected">MasterCard</option>
  <option value="Cash">Cash</option>
  <option value="Paypal">Paypal</option>
</select>
</h2>

<div class="container">
<div class="col-md-12 col-sm-12 col-xs-12""> 
<a href="#" onclick="document.forms['myForm'].submit(); return false;" style="margin-bottom: 10rem"class="btn btn-sm animated-button sandy-four">
Proceed with rent</a> 
</div>
</div>
</form>
</body>
</html>