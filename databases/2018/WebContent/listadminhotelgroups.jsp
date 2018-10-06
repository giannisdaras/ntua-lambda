<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Show All Hotels</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="theme.css">
<link rel="stylesheet" type="text/css"
	href="fancy_table/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="fancy_table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="fancy_table/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="fancy_table/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="fancy_table/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="fancy_table/css/util.css">
<link rel="stylesheet" type="text/css" href="fancy_table/css/main.css">
</head>

<body>


	<div class="container">
		<div class="row center">
			<div class="col-md-6 col-sm-6 col-lg-6 col-xs-6"
				style="margin-bottom: 5rem; padding-left: 5rem;">
				<a href="welcome.jsp" class="btn btn-sm animated-button thar-three">
					Home</a>
			</div>
			
			<div class="col-md-6 col-sm-6 col-lg-6 col-xs-6"
				style="margin-bottom: 5rem; padding-left: 5rem;">
				<a href="Administratorpage.jsp" class="btn btn-sm animated-button thar-three">
					Admin Home</a>
			</div>

		</div>
	</div>
	
	<div class="container">
		<div class="col-md-12 col-sm-12 col-xs-12"">
			<a href="Hotelgroupscontroller?action=insert"
				class="btn btn-sm animated-button sandy-four"> Add new hotel
				group</a>
		</div>
	</div>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<table data-vertable="ver1">
						<thead>
							<tr class="row100-head">
								<th class="column100 column1">Hotel Group Id</th>
								<th class="column100 column2">Number of Hotels</th>
								<th class="column100 column3">Name</th>
								<th class="column100 column4">Street</th>
								<th class="column100 column5">Number</th>
								<th class="column100 column6">Postal</th>
								<th class="column100 column7">City</th>
								<th class="column100 column8" colspan=4>Action</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${hotelgroup}" var="hotelgroup">
								<tr class="row100">
									<td class="column100 column1"><c:out
											value="${hotelgroup.getHotelgroupid()}" /></td>
									<td class="column100 column2"><c:out
											value="${hotelgroup.getnumberofhotels()}" /></td>
									<td class="column100 column3"><c:out
											value="${hotelgroup.getname()}" /></td>
									<td class="column100 column4"><c:out
											value="${hotelgroup.getStreet()}" /></td>
									<td class="column100 column5"><c:out
											value="${hotelgroup.getnum()}" /></td>
									<td class="column100 column6"><c:out
											value="${hotelgroup.getpostalcode()}" /></td>
									<td class="column100 column7"><c:out
											value="${hotelgroup.getCity()}" /></td>
									<td class="column100 column8"><a
										href="Hotelgroupscontroller?action=edit&hotel_group_id=<c:out value="${hotelgroup.getHotelgroupid()}"/>">Update</a></td>
									<td class="column100 column9"><a
										href="Hotelgroupscontroller?action=delete&hotel_group_id=<c:out value="${hotelgroup.getHotelgroupid()}"/>">Delete</a></td>
									<td class="column100 column10"><a
									    href="HotelgroupmailsController?action=listmails&hotel_group_id=<c:out value="${hotelgroup.getHotelgroupid()}"/>">Edit mail</a></td>
									<td class="column 100 column11"><a
                                        href="HotelgroupphonesController?action=listphones&hotel_group_id=<c:out value="${hotelgroup.getHotelgroupid()}"/>">Edit phone</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="fancy_table/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="fancy_table/vendor/bootstrap/js/popper.js"></script>
	<script src="fancy_table/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="fancy_table/vendor/select2/select2.min.js"></script>
	<script src="fancy_table/js/main.js"></script>

</body>
</html>
