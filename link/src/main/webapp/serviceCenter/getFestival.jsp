<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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

</body>
</html>