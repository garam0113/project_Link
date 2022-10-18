<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function hasGetUserMedia() {
	  return !!(navigator.getUserMedia || navigator.webkitGetUserMedia ||
	            navigator.mozGetUserMedia || navigator.msGetUserMedia);
	}

	if (hasGetUserMedia()) {
	  // Good to go!
	} else {
	  alert('getUserMedia() is not supported in your browser');
	}
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>