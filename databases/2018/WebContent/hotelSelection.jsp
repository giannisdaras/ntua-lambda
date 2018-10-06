<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<sql:query var="snap" dataSource="jdbc/ntua_db">
	select distinct city from hotel
</sql:query>

<sql:query var="hotel_group_names" dataSource="jdbc/ntua_db">
	select distinct name from hotel_group
</sql:query>

<sql:query var="hotel_group_ids" dataSource="jdbc/ntua_db">
	select distinct hotel_group_id from hotel_group
</sql:query>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel Selection Criteria</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="theme.css">
<script src="js/calender.js" type="text/javascript"></script>
</head>
<body>

	<div class="row center">
		<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12"
			style="margin-bottom: 5rem; padding-left: 5rem;">
			<a href="welcome.jsp" class="btn btn-sm animated-button thar-three">
				Home</a>
		</div>
		<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12"
			style="margin-bottom: 5rem; padding-right: 5rem;">
			<a href="hotelSelection.jsp"
				class="btn btn-sm animated-button thar-four"> Hotel Criteria</a>
		</div>

	</div>


	<c:if test="${both=='no' }">
		<script>
alert('You must specify both start and end date or none of them at all');
</script>
	</c:if>

	<c:if test="${alert=='yes'}">
		<script>
alert("You can't book the past");
</script>
	</c:if>


	<c:if test="${prob=='yes'}">
		<script>
alert("There is a collision");
</script>
	</c:if>


	<div id=lookup></div>
	<form action="SearchServlet" method="post" name="myForm">
		<h2>
			I am looking for a <select name="starSelector" id="starSelector">
				<option value="_______" selected="selected">_______</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select> star(s) hotel
		</h2>


		<h2>I am looking for _______ rooms</h2>
		<div class="container">
			<div class="Input">
				<input type="number" max="5" onkeypress="return isNumberKey(event)"
					name="num" id="num" class="Input-text"
					placeholder="Number of rooms"> <label for="num"
					class="Input-label">Number of rooms</label>
			</div>
		</div>
		<h2>The maximum price I can afford is _______</h2>
		<div class="container">
			<div class="Input">
				<input type="number" onkeypress="return isNumberKey(event)"
					name="price" id="price" class="Input-text"
					placeholder="Maximum price (EUR)"> <label for="price"
					class="Input-label">Maximum price (EUR)</label>
			</div>
		</div>


		<h2 style="margin-bottom: 3rem;">My start date is</h2>
		<div class="container">
			<select name="start-date-selector" class="bear-dates"></select> <select
				name="start-month-selector" class="bear-months"></select> <select
				name="start-year-selector" class="bear-years"></select>
		</div>

		<h2 style="margin-bottom: 3rem;">My end date is</h2>
		<div class="container">
			<select name="end-date-selector" class="bear-dates"></select> <select
				name="end-month-selector" class="bear-months"></select> <select
				name="end-year-selector" class="bear-years"></select>
		</div>

		<h2>I am only interested in the following locations</h2>
		<div class="container">
			<div class="row">
				<c:forEach var="it" items="${snap.rows}">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<label class="specialContainer">${it.city} <input
							type="checkbox" name="locations" value="${it.city}" checked>
							<span class="checkmark"></span>
						</label>
					</div>
				</c:forEach>

			</div>
		</div>

		<h2>
			I have a special interest in hotels of <select name="groupSelector"
				id="groupSelector">
				<option value="_______" selected="selected"> _______ </option>
				<c:forEach var="it" items="${hotel_group_ids.rows}" varStatus="status">
					<option value="${it.hotel_group_id}" >${hotel_group_names.rows[status.index].name} </option>
				</c:forEach>
			</select> hotel group
		</h2>

		<h2>
			I am looking for <select name="capacitySelector"
				id="capacitySelector">
				<option value="_______" selected="selected">_______</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select> people capacity room
		</h2>


		<h2>
			I want them ordered by <select name="optionSelector"
				id="capacitySelector">
				<option value="capacity" selected>capacity</option>
				<option value="tmp.city">location</option>

			</select>
		</h2>
		<div class="container">
			<div style="margin-bottom: 5rem;"
				class="col-md-12 col-sm-12 col-xs-12">
				<a href="#"
					onclick="document.forms['myForm'].submit(); return false;"
					class="btn btn-sm animated-button sandy-four"> Query me</a>
			</div>
		</div>
	</form>
	
	<div class="container">
	<div class="row">
	<div class="col-md-6 col-sm-6 col-xs-6"> <a href="locationView.jsp" class="btn btn-sm animated-button sandy-one">Location view</a> </div>
	
	<div class="col-md-6 col-sm-6 col-xs-6"> <a href="capacityView.jsp" class="btn btn-sm animated-button sandy-one">Capacity view</a> </div>
	</div>
	</div>		
	

	<script src="js/calender.js" type="text/javascript"></script>
	<script type="text/javascript">
dates('option');
months('option');
years('option', 2018, 2025);
</script>
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