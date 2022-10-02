<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='등록완료']").bind("click", function(){
		$("form[name='addClubPost']").submit();
	});
});
</script>
</head>
<body>
<form name="addClubPost" method="post" action="/clubPost/addClubPost">
제목<input type="text" name="clubPostTitle"></br>
내용<input type="text" name="clubPostContent"></br>
영상1<input type="text" name="clubPostVideo1"></br>
영상2<input type="text" name="clubPostVideo2"></br>
영상3<input type="text" name="clubPostVideo3"></br>
이미지1<input type="text" name="image1"></br>
이미지2<input type="text" name="image2"></br>
이미지3<input type="text" name="image3"></br>
이미지4<input type="text" name="image4"></br>
이미지5<input type="text" name="image5"></br>
이미지6<input type="text" name="image6"></br>
이미지7<input type="text" name="image7"></br>
이미지8<input type="text" name="image8"></br>
이미지9<input type="text" name="image9"></br>
이미지10<input type="text" name="image10"></br>
<input type="button" value="등록완료">
</form>
</body>
</html>