<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Rent Page</title>
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
	<h2>Welcome back ${name} ${surname} </h2>


<h4>
<c:if test="${clr=='yes'}">
There are no open reservations
</c:if>
</h4>
	<c:forEach var="p" items="${room_ids}" varStatus="status">
		<div class="card col-md-4 col-sm-6 col-xs-12">

			<a
				href="implementPayment.jsp?room=${room_ids[status.index]}&hotel=${hotel_id}&irs_employee=${irs_employee}&irs_customer=${irs_customers[status.index]}&price=${prices[status.index]}&reservation_id=${reservation_ids[status.index]}"
				style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;">
			</a>
			<h2>Customer irs: <br> ${irs_customers[status.index]}</h2>
			<div class="container">
				<h4>
					Room id: <b> ${room_ids[status.index] } </b>
				</h4>
				<h4>
				Customer name: ${customer_names[status.index]}
				</h4>
				<h4>
				Customer surname: ${customer_surnames[status.index]}
				</h4>
				
				<h4>Hotel id: ${hotel_id}</h4>
				<p>Price: ${prices[status.index]} EUR</p>
			</div>
		</div>

	</c:forEach>
</body>
</html>