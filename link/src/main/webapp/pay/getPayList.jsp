<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
	
	<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<%-- SUMMER NOTE --%>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<%-- SUMMER NOTE --%>
	
	<%-- ALERT --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<%-- ALERT --%>
	
	<%-- BOOTSTRAP ICON --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<%-- BOOTSTRAP ICON --%>
	<style>
	.top{
	height : 100px;
	margin-top : -20px;
	}
	.font{
	 text-align: center;
	 font-size : 40px;
	 font-family:Verdana, Geneva, Arial, sans-serif;
	}
	
	</style>
</head>
<body>
<div class="top" style="background-color : #5F0080"><H3 class="font" style="color : white">결제 내역</H3></div>





<div>
<c:forEach var = "payList" items = "${payList}">
			<c:set var = "i" value = "${i + 1}" />
			<div>${payList.payProduct}</div>
			<div>${payList.payNo}</div>
			<div> ${payList.user.userId}</div>
			<div> ${payList.totalPrice}</div>
			<div> ${payList.payRegDate}</div>
		
		
			<div> ${payList.updateClubCount}</div>
			<div> ${payList.updateClubMemberCount}</div>
			<div> ${payList.payOption}</div>
			
			
			<br/><br/>
			
					
		
			</c:forEach>
			</div>
			
			
			
			
			
			
			

</body>
</html>