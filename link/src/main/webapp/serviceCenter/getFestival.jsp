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

var xhr = new XMLHttpRequest();
var url = 'http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'zBGM3gx0Dc2jBEW14Zfw26CVqo2w018oxuxycZo6dMCuzeN25ma4CNoVlRDiS2k%2BXoOyBXC88QgaP1T4DZ9DuQ%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('5'); /**/
queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json'); 

queryParams += '&' + encodeURIComponent('fstvlNm') + '=' + encodeURIComponent('');/* 
queryParams += '&' + encodeURIComponent('opar') + '=' + encodeURIComponent('');
queryParams += '&' + encodeURIComponent('fstvlStartDate') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('fstvlEndDate') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('fstvlCo') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('mnnst') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('auspcInstt') + '=' + encodeURIComponent('');
queryParams += '&' + encodeURIComponent('suprtInstt') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('phoneNumber') + '=' + encodeURIComponent('');
queryParams += '&' + encodeURIComponent('homepageUrl') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('relateInfo') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('rdnmadr') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('lnmadr') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('latitude') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('longitude') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('referenceDate') + '=' + encodeURIComponent(''); 
queryParams += '&' + encodeURIComponent('instt_code') + '=' + encodeURIComponent(''); */


xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    <%--     document.write(this.responseText);  --%>
      
          document.write(this.responseText);
    }
};

xhr.send('');


</script>
<meta charset="EUC-KR">
<title>asdf</title>
</head>
<body>
	<table class="table table-hover table-striped"  style="text-align-last: center;">
				<div class="row2">
				<thead>

				</thead>
				
			<p id="demo"></p><br>
				
				
</body>
</html>