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
<title>Add new hotel mail</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
<div class="container">
<div class="row center">
<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12" style="margin-bottom: 5rem; padding-left: 5rem;"> <a href="HotelmailsController?action=listmails&hotel_id=<c:out value="${hotel_id}"/>" class="btn btn-sm animated-button thar-three"> back</a> </div>
</div>
</div>
	<form method="POST" action='HotelmailsController' name="myForm">


		<div class="container">
			<div class="Input">
				<input type="text" readonly="readonly" name="hotel_id"
					value="${hotel_id}" id="hotel_id"
					class="Input-text"> 
					<label for="hotel_id" class="Input-label">Hotel Id </label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input type="text" name="mail" id="mail" class="Input-text" value="${mail}"
					placeholder="E-mail"> 
					<label for="mail" class="Input-label"> E-mail </label>
			</div>
		</div>

		<div class="container">
			<div class="col-md-12 col-sm-12 col-xs-12"">
				<a href="#"
					onclick="document.forms['myForm'].submit(); return false;"
					style="margin-bottom: 10rem"
					class="btn btn-sm animated-button sandy-four"> submit</a>
			</div>
		</div>


	</form>
</body>
</html>