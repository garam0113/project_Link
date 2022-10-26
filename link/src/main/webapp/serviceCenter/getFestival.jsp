<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
var data = {
     serviceKey: '=zBGM3gx0Dc2jBEW14Zfw26CVqo2w018oxuxycZo6dMCuzeN25ma4CNoVlRDiS2k%2BXoOyBXC88QgaP1T4DZ9DuQ%3D%3D',
     s_page: 1,
     s_list: 10,
     type: 'json'
};

$.ajax({
    post: 'get',
    url: 'http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api',
    data: data,
    dataType: 'json',
    success: function(data){
        
		//document.write(data.response.header.resultCode);
			console.log("º´¿øº´ : " + data);
			$.each(data, function(index, item) {
				console.log(item);
			})
    	
	}
    
});



</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover table-striped"  style="text-align-last: center;">
				<div class="row2">
				<thead>

				</thead>
				
			<p id="demo"></p><br>
				
				
</body>
</html>