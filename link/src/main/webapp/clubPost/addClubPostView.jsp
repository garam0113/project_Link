<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='��ϿϷ�']").bind("click", function(){
		$("form[name='addClubPost']").submit();
	});
	$("input[value='����Ʈ���̵�']").bind("click", function(){
		location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
	});
});
</script>
</head>
<body>
<form name="addClubPost" method="post" action="/clubPost/addClubPost">
���� ��ȣ : <input type="hidden" name="clubNo" value="${ clubNo }"></br>
����<input type="text" name="clubPostTitle" value="notnull"></br>
����<input type="text" name="clubPostContent"></br>
����1<input type="text" name="clubPostVideo1"></br>
����2<input type="text" name="clubPostVideo2"></br>
����3<input type="text" name="clubPostVideo3"></br>
�̹���1<input type="text" name="image1" value="notnull"></br>
�̹���2<input type="text" name="image2"></br>
�̹���3<input type="text" name="image3"></br>
�̹���4<input type="text" name="image4"></br>
�̹���5<input type="text" name="image5"></br>
�̹���6<input type="text" name="image6"></br>
�̹���7<input type="text" name="image7"></br>
�̹���8<input type="text" name="image8"></br>
�̹���9<input type="text" name="image9"></br>
�̹���10<input type="text" name="image10"></br>
<input type="button" value="��ϿϷ�">
<input type="button" value="����Ʈ���̵�">
</form>
</body>
</html>