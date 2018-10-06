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
<title>Add new hotel group</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
<div class="container">
<div class="row center">
<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12" style="margin-bottom: 5rem; padding-left: 5rem;"> <a href="Hotelgroupscontroller?action=listhotelgroups" class="btn btn-sm animated-button thar-three"> back</a> </div>
</div>
</div>
	<form method="POST" action='Hotelgroupscontroller' name="myForm">

<c:if test="${hotelgroup.getHotelgroupid()!=null}">
		<div class="container">
			<div class="Input">
				<input type="text" readonly="readonly" name="hotel_group_id"
					value="${hotelgroup.getHotelgroupid()}" id="hotel_group_id"
					class="Input-text"> 
					<label for="hotel_group_id" class="Input-label">Hotel group Id </label>
			</div>
		</div>
</c:if>
		
		<div class="container">
			<div class="Input">
				<input type="text" name="name" id="name" class="Input-text" value="${hotelgroup.getname()}"
					placeholder="Name"> 
					<label for="name" class="Input-label"> Name </label>

			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input type="text" name="street" id="street" class="Input-text" value="${hotelgroup.getStreet()}"
					placeholder="Street"> 
					<label for="street" class="Input-label"> Street </label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input type="text" onkeypress="return isNumberKey(event)" name="num" id="num" class="Input-text" value="${hotelgroup.getnum()}"
					placeholder="Number"> <label for="num" class="Input-label">Number </label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input type="text" onkeypress="return isNumberKey(event)" name="postal_code" id="postal_code" value="${hotelgroup.getpostalcode()}"
					class="Input-text" placeholder="Postal Code"> 
					<label for="postal_code" class="Input-label"> Postal Code</label>
			</div>
		</div>

		<div class="container">
			<div class="Input">
				<input type="text" name="city" id="city" class="Input-text" value="${hotelgroup.getCity()}"
					placeholder="City"> <label for="city" class="Input-label">City </label>
			</div>
		</div>

		<div class="container">
			<div class="col-md-12 col-sm-12 col-xs-12"">
				<a href="#"
					onclick="document.forms['myForm'].submit(); return false;"
					style="margin-bottom: 10rem"
					class="btn btn-sm animated-button sandy-four"> Submit </a>
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