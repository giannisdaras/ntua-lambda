<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Login</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="theme.css">
</head>
<body>
<div class="row center">
<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12" style="margin-bottom: 5rem; padding-left: 5rem;"> <a href="welcome.jsp" class="btn btn-sm animated-button thar-three"> Home</a> </div>
<div class="col-md-6 col-sm-6 col-lg-6 col-xs-12" style="margin-bottom: 5rem; padding-right: 5rem;"> <a href="hotelSelection.jsp" class="btn btn-sm animated-button thar-four"> Hotel Criteria</a> </div>

</div>

<h3> <img id="lock" src="images/lock.png" alt="not"> Identification
 
</h3>
<c:if test="${wrong=='yes'}">
<script>
alert("We couldn't identify you!")
</script>
</c:if>

<form action="IdentifyEmployee" method="post" name="myForm">
<div class="container">
<div class="Input">
    <input type="text" onkeypress="return isNumberKey(event)" name="irs" id="input" class="Input-text" placeholder="IRS">
    <label for="input" class="Input-label">IRS</label>
  </div>
</div>

<div class="col-md-12 col-sm-12 col-xs-12"> 
<a href="#" onclick="document.forms['myForm'].submit(); return false;" class="btn btn-sm animated-button sandy-four">
identify me</a> 
</div>
</form>
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