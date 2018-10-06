<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<sql:query var="snap" dataSource="jdbc/ntua_db">
	select * from amenities
</sql:query>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
	href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<title>Add new hotel</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
<div class="container">
<div class="row center">
<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12" style="margin-bottom: 5rem; padding-left: 5rem;"> <a href="RoomamenitiesController?action=listamenities&room_id=<c:out value="${room_id}"/>" class="btn btn-sm animated-button thar-three"> back</a> </div>
</div>
</div>

<form method="POST" action='RoomamenitiesController' name="myForm">
<div class="container">
<div class="row">

<c:forEach var="it" items="${snap.rows}">
<div class="col-md-4 col-sm-4 col-xs-6">  
	<label class="specialContainer">${it.amenity}
  	<input type="checkbox" name="amenities" value="${it.amenity}">
  	<span class="checkmark"></span>
	</label>
</div>
</c:forEach>

</div>
</div>
<input type="hidden" value="${room_id}" name="room_id" />
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