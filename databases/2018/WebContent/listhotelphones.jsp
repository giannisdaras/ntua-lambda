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
			<div class="col-md-4 col-sm-6 col-lg-4 col-xs-12"
				style="margin-bottom: 5rem; padding-left: 5rem;">
				<a href="welcome.jsp" class="btn btn-sm animated-button thar-three">
					Home</a>
			</div>

			
			<div class="col-md-4 col-sm-6 col-lg-4 col-xs-12"
				style="margin-bottom: 5rem; padding-left: 5rem;">
				<a href="Administratorpage.jsp"
					class="btn btn-sm animated-button thar-three"> Admin Home</a>
			</div>

			<div class="col-md-4 col-sm-6 col-lg-4 col-xs-12"
				style="margin-bottom: 5rem; padding-left: 5rem;">
				<a href="HotelsController?action=listhotels"
					class="btn btn-sm animated-button thar-three"> Admin Hotels</a>
			</div>


		</div>
	</div>

	<div class="container">
		<div class="col-md-12 col-sm-12 col-xs-12"">
			<a href="HotelphonesController?action=insert&hotel_id=<c:out value="${hotel_id}"/>"
				class="btn btn-sm animated-button sandy-four"> Add new phone</a>
		</div>
	</div>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<table data-vertable="ver1">
						<thead>
							<tr class="row100-head">
								<th class="column100 column1">Hotel Id</th>
								<th class="column100 column2">Phone</th>
								
								<th colspan=1 class="column100 column9">Action</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${phone}" var="phone">
								<tr class="row100">
									<td class="column100 column1"><c:out
											value="${hotel_id}" /></td>
									<td class="column100 column2"><c:out
											value="${phone}" /></td>
								
									<td class="column100 column8"><a
										href="HotelphonesController?action=delete&hotel_id=<c:out value="${hotel_id}"/>&phone=<c:out value="${phone}"/>">Delete</a></td>
									

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