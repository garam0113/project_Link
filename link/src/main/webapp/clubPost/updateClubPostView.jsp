<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='�����Ϸ�']").bind("click", function(){
		$("form").submit();
	});
	$("input[value='����Ʈ���̵�']").bind("click", function(){
		location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
	});
});
</script>
</head>
<body>
<input type="button" value="�����Ϸ�">
<input type="button" value="����Ʈ���̵�">
<form name="updateClubPost" method="post" action="/clubPost/updateClubPost">
���� �Խù� ��� ȸ�� ���̵� : ${ clubPost.clubPost.user.userId }<input type="hidden" name="userId" value="${ clubPost.clubPost.user.userId }"></br>
���� �Խù� ��ȣ : ${ clubPost.clubPost.clubPostNo }<input type="hidden" name="clubPostNo" value="${ clubPost.clubPost.clubPostNo }"></br>
���� : <input type="text" name="clubPostTitle" value="${ clubPost.clubPost.clubPostTitle }"></br>
���� : <input type="text" name="clubPostContent" value="${ clubPost.clubPost.clubPostContent }"></br>
����1 : <input type="text" name="clubPostVideo1" value="${ clubPost.clubPost.clubPostVideo1 }"></br>
����2 : <input type="text" name="clubPostVideo2" value="${ clubPost.clubPost.clubPostVideo2 }"></br>
����3 : <input type="text" name="clubPostVideo3" value="${ clubPost.clubPost.clubPostVideo3 }"></br>
�̹���1 : <input type="text" name="image1" value="${ clubPost.clubPost.image1 }"></br>
�̹���2 : <input type="text" name="image2" value="${ clubPost.clubPost.image2 }"></br>
�̹���3 : <input type="text" name="image3" value="${ clubPost.clubPost.image3 }"></br>
�̹���4 : <input type="text" name="image4" value="${ clubPost.clubPost.image4 }"></br>
�̹���5 : <input type="text" name="image5" value="${ clubPost.clubPost.image5 }"></br>
�̹���6 : <input type="text" name="image6" value="${ clubPost.clubPost.image6 }"></br>
�̹���7 : <input type="text" name="image7" value="${ clubPost.clubPost.image7 }"></br>
�̹���8 : <input type="text" name="image8" value="${ clubPost.clubPost.image8 }"></br>
�̹���9 : <input type="text" name="image9" value="${ clubPost.clubPost.image9 }"></br>
�̹���10 : <input type="text" name="image10" value="${ clubPost.clubPost.image10 }"></br>
</form>
</body>
</html>