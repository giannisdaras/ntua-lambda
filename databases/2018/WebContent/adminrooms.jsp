<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
	href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<title>Add new room</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
	<div class="container">
		<div class="row center">
			<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12"
				style="margin-bottom: 5rem; padding-left: 5rem;">
				<a href="RoomsController?action=listrooms"
					class="btn btn-sm animated-button thar-three"> back</a>
			</div>
		</div>
	</div>

	<form method="post" action='RoomsController' name="myForm">

		<c:if test="${room.getroomid()!=null }">
			<div class="container">
				<div class="Input">
					<input type="text" readonly="readonly" name="room_id"
						value="${room.getroomid()}" id="room_id" class="Input-text">
					<label for="room_id" class="Input-label">Room Id </label>
				</div>
			</div>
		</c:if>

		<div class="container">
			<div class="Input">
				<input type="text" onkeypress="return isNumberKey(event)"
					name="hotel_id" id="hotel_id" class="Input-text"
					value="${room.gethotelid()}" placeholder="Hotel Id"> <label
					for="hotel_id" class="Input-label"> Hotel Id </label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input type="text" name="price" id="price" class="Input-text"
					value="${room.getprice()}" placeholder="Price"> <label
					for="price" class="Input-label"> Price </label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input type="text" onkeypress="return isNumberKey(event)"
					name="repairs_needed" id="repairs_needed" class="Input-text"
					value="${room.getrepairsneeded()}"
					placeholder="Repairs Needed (0 or 1)"> <label
					for="repairs_needed" class="Input-label"> Repairs Needed </label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input onkeypress="return isNumberKey(event)" type="text"
					name="expandable" id="expandable" class="Input-text"
					value="${room.getexpandable()}" placeholder="Expandable"> <label
					for="expandable" class="Input-label">Expandable</label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input onkeypress="return isNumberKey(event)" type="text"
					name="view" id="view" value="${room.getview()}" class="Input-text"
					placeholder="View"> <label for="view" class="Input-label">
					View</label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input onkeypress="return isNumberKey(event)" type="text"
					name="capacity" id="capacity" class="Input-text"
					value="${room.getcapacity()}" placeholder="Capacity"> <label
					for="capacity" class="Input-label">Capacity </label>
			</div>
		</div>

		<div class="container">
			<div class="col-md-12 col-sm-12 col-xs-12"">
				<a href="#"
					onclick="document.forms['myForm'].submit(); return false;"
					style="margin-bottom: 10rem"
					class="btn btn-sm animated-button sandy-four"> submit </a>
			</div>
		</div>


	</form>
</body>
</html>