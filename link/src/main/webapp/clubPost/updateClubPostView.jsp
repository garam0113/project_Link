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
});
</script>
</head>
<body>
<form name="updateClubPost" method="post" action="/clubPost/updateClubPost">
���� �Խù� ��� ȸ�� ���̵� : ${ map.getClubPost.user.userId }<input type="hidden" name="userId" value="${ map.getClubPost.user.userId }"></br>
���� �Խù� ��ȣ : ${ map.getClubPost.clubPostNo }<input type="hidden" name="clubPostNo" value="${ map.getClubPost.clubPostNo }"></br>
���� : <input type="text" name="clubPostTitle" value="${ map.getClubPost.clubPostTitle }"></br>
���� : <input type="text" name="clubPostContent" value="${ map.getClubPost.clubPostContent }"></br>
����1 : <input type="text" name="clubPostVideo1" value="${ map.getClubPost.clubPostVideo1 }"></br>
����2 : <input type="text" name="clubPostVideo2" value="${ map.getClubPost.clubPostVideo2 }"></br>
����3 : <input type="text" name="clubPostVideo3" value="${ map.getClubPost.clubPostVideo3 }"></br>
�̹���1 : <input type="text" name="image1" value="${ map.getClubPost.image1 }"></br>
�̹���2 : <input type="text" name="image2" value="${ map.getClubPost.image2 }"></br>
�̹���3 : <input type="text" name="image3" value="${ map.getClubPost.image3 }"></br>
�̹���4 : <input type="text" name="image4" value="${ map.getClubPost.image4 }"></br>
�̹���5 : <input type="text" name="image5" value="${ map.getClubPost.image5 }"></br>
�̹���6 : <input type="text" name="image6" value="${ map.getClubPost.image6 }"></br>
�̹���7 : <input type="text" name="image7" value="${ map.getClubPost.image7 }"></br>
�̹���8 : <input type="text" name="image8" value="${ map.getClubPost.image8 }"></br>
�̹���9 : <input type="text" name="image9" value="${ map.getClubPost.image9 }"></br>
�̹���10 : <input type="text" name="image10" value="${ map.getClubPost.image10 }"></br>
<input type="button" value="�����Ϸ�">
</form>
</body>
</html>