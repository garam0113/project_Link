<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
@import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css);
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
var data = {
     serviceKey: '=zBGM3gx0Dc2jBEW14Zfw26CVqo2w018oxuxycZo6dMCuzeN25ma4CNoVlRDiS2k%2BXoOyBXC88QgaP1T4DZ9DuQ%3D%3D',
     s_page: 0,
     s_list: 10,
     type: 'json'
};

$.ajax({
    post: 'get',
    url: 'http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api',
    data: data,
    dataType: 'json',
    success: function(data){
         console.log(data);
    }
});

var xhr = new XMLHttpRequest();
var url = 'http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'zBGM3gx0Dc2jBEW14Zfw26CVqo2w018oxuxycZo6dMCuzeN25ma4CNoVlRDiS2k%2BXoOyBXC88QgaP1T4DZ9DuQ%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('0'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); /**/
queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json'); /**/

xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');


</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover table-striped"  style="text-align-last: center;">
				<div class="row2">
				<thead>
					<tr>
						<th align="center">No</th>
						<td />
						<th align="center" class="content">薦鯉</th>
						<td />
						<th align="center"></th>
						<td />
						<th align="center"></th>
						<td />
						<th align="center" width ="100">是帖</th>
					</tr>
				</thead>
				
				<tbody>

					<c:set var="i" value="0" />
		
						<tr class="ct_list_pop">
							<td align="left" id="bb">しし</td>
								
							<td></td>
							<td align="left" >けけ2
								</td>
							<td></td>

							<td align="left" >けけ3</td>

							<td></td>
							<td align="left" >けけ4</td>
							<td></td>
							<td align="left" >けけ5</td>
							<td align="center" >けけ6</td>

							<td></td>
			
				</tbody>
				
				
</body>
</html>