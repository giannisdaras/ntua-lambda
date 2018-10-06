<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Room Selection Room</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>

<div class="row center">
<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12" style="margin-bottom: 5rem; padding-left: 5rem;"> <a href="welcome.jsp" class="btn btn-sm animated-button thar-three"> Home</a> </div>
<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12" style="margin-bottom: 5rem; padding-right: 5rem;"> <a href="hotelSelection.jsp" class="btn btn-sm animated-button thar-four"> Hotel Criteria</a> </div>
</div>

<div class="row">
<c:set var="loc" value="dedj"/>



<c:forEach var="p" items="${hotels}" varStatus="status">
<c:if test="${! loc == cities[status.index]}">
	<h2> Location: ${cities[status.index]}</h2>
	<c:set var="loc" value="${cities[status.index]}"/>
</c:if>


<div class="card col-md-4 col-sm-6 col-xs-12">

<a href="identifyCustomer.jsp?room=${rooms[status.index] }&hotel=${hotels[status.index] }" style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;"> </a>
  <h2>${prices[status.index]} EUR</h2>
  <div class="container">
  <h3>Stars: <b> ${stars[status.index] } </b></h3>
    <h4>Location: ${cities[status.index]}</h4> 
    <p> Street: ${streets[status.index] }</p>
    <p>Capacity: ${capacities[status.index]} people </p>
<%--     <p>Hotel id: ${hotels[status.index]}  </p> --%>
    <p> Hotel name: ${hotel_names[status.index]}</p>
    <p>Room: ${rooms[status.index]}</p>
    <p style="padding-right: 2rem; word-wrap: break-word;"> Room amenities: ${hotel_room_amenities[status.index]} </p>
<%--     <p> Hotel group: ${groups[status.index] } </p> --%>
    <p> Hotel group name: ${hotel_group_names[status.index] }</p>
  
    
    <c:if test="${views[status.index] }">
    	<p> View: yes
    </c:if>
    <c:if test="${! views[status.index] }">
    	<p> View: no
    </c:if>
    
    <c:if test="${repairs[status.index] }">
    	<p> Needs repairs: yes
    </c:if>
    <c:if test="${! repairs[status.index] }">
    	<p> Needs repairs: no
    </c:if>

    </div> 
</div>

</c:forEach>



</div>
<c:if test="${index<=0}">
<h2> You were unlucky today! </h2>
</c:if>
</body>
</html>