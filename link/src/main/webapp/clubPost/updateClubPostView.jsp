<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='수정완료']").bind("click", function(){
		$("form").submit();
	});
	$("input[value='리스트로이동']").bind("click", function(){
		location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
	});
});
</script>
</head>
<body>
<input type="button" value="수정완료">
<input type="button" value="리스트로이동">
<form name="updateClubPost" method="post" action="/clubPost/updateClubPost">
모임 게시물 등록 회원 아이디 : ${ clubPost.clubPost.user.userId }<input type="hidden" name="userId" value="${ clubPost.clubPost.user.userId }"></br>
모임 게시물 번호 : ${ clubPost.clubPost.clubPostNo }<input type="hidden" name="clubPostNo" value="${ clubPost.clubPost.clubPostNo }"></br>
제목 : <input type="text" name="clubPostTitle" value="${ clubPost.clubPost.clubPostTitle }"></br>
내용 : <input type="text" name="clubPostContent" value="${ clubPost.clubPost.clubPostContent }"></br>
영상1 : <input type="text" name="clubPostVideo1" value="${ clubPost.clubPost.clubPostVideo1 }"></br>
영상2 : <input type="text" name="clubPostVideo2" value="${ clubPost.clubPost.clubPostVideo2 }"></br>
영상3 : <input type="text" name="clubPostVideo3" value="${ clubPost.clubPost.clubPostVideo3 }"></br>
이미지1 : <input type="text" name="image1" value="${ clubPost.clubPost.image1 }"></br>
이미지2 : <input type="text" name="image2" value="${ clubPost.clubPost.image2 }"></br>
이미지3 : <input type="text" name="image3" value="${ clubPost.clubPost.image3 }"></br>
이미지4 : <input type="text" name="image4" value="${ clubPost.clubPost.image4 }"></br>
이미지5 : <input type="text" name="image5" value="${ clubPost.clubPost.image5 }"></br>
이미지6 : <input type="text" name="image6" value="${ clubPost.clubPost.image6 }"></br>
이미지7 : <input type="text" name="image7" value="${ clubPost.clubPost.image7 }"></br>
이미지8 : <input type="text" name="image8" value="${ clubPost.clubPost.image8 }"></br>
이미지9 : <input type="text" name="image9" value="${ clubPost.clubPost.image9 }"></br>
이미지10 : <input type="text" name="image10" value="${ clubPost.clubPost.image10 }"></br>
</form>
</body>
</html>