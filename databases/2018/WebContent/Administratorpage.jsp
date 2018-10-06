<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home page</title>
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
	<h2>I want to administer _______</h2>
	<div class="col-md-6 col-sm-6 col-xs-6">
		<a href="Hotelgroupscontroller?action=listhotelgroups"
			class="btn btn-sm animated-button sandy-one">Hotel groups</a>
	</div>
	<div class="col-md-6 col-sm-6 col-xs-6">
		<a href="HotelsController?action=listhotels"
			class="btn btn-sm animated-button sandy-two">Hotels</a>
	</div>
	<div class="centeredRow">
		<div class="row">
			<a style="margin-top: 5rem;" href="RoomsController?action=listrooms"
				class="btn btn-sm animated-button sandy-four">Rooms</a>
		</div>
	</div>
</body>
</html>