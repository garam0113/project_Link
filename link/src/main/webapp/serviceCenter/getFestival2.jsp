<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">

<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
 // 데이터를 aJax로 받기
 
 
$.ajax({
	url  : "/serviceCenterRest/json/getFestivalList",
		contentType: 'application/json',
		method : "GET",
		dataType: "json",			
		 success: function(msg){
			 console.log(msg.reponse.body.items.item);
			 var myItem = msg.response.body.items.item; 
		 }
		  	console.log(myItem.length);
		  	output += '<h3>'+i+'번째 서울 축제 데이터'+'</h3>';
		  	output += '<h4>'+myItem[i].addr1+
		
			
		})<!-- ajax ( ReportAdd) 끝 --> 

</script>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover table-striped"  style="text-align-last: center;">
				<div class="row2">
				<thead>

				</thead>
				
			<p id="demo"></p><br>
				<c:forEach var="data" items="${data}">
			data
				</c:forEach>
</body>
</html>