<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='수정']").bind("click", function(){
		$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
	});
	$("input[value='삭제']").bind("click", function(){
		alert("모임 게시물 번호 : " + ${ clubPost.getClubPost.clubPostNo });
		$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=2&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
	});
	$("input[value='리스트로이동']").bind("click", function(){
		location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
	});
	$("a[href='#']").bind("click", function(){
		//location.href = "/clubPostRest/updateClubPost?clubNo="+${ clubPost.getClubPost.clubNo }+"&clubPostNo="+${ clubPost.getClubPost.clubPostNo }+"&heartCondition=1";
	});
});
</script>
</head>
<body>
<form></form>
<input type="button" value="수정">
<input type="button" value="삭제">
<input type="button" value="리스트로이동">
<a href="#"><img alt="" src="abcd.jpg">하트</a></br>
<%-- 모임 게시물 등록 회원 정보 : ${ clubPost.getClubPost.user }</br> --%>
모임 게시물 등록 회원 아이디 : ${ clubPost.getClubPost.user.userId }</br>
<%-- 모임 게시물 등록 회원 닉네임 : ${ clubPost.getClubPost.user.nickName }</br> --%>
모임 번호 : ${ clubPost.getClubPost.clubNo }</br>
모임 게시물 번호 : ${ clubPost.getClubPost.clubPostNo }</br>
모임 게시물 제목 : ${ clubPost.getClubPost.clubPostTitle }</br>
모임 게시물 내용 : ${ clubPost.getClubPost.clubPostContent }</br>
모임 게시물 영상1 : ${ clubPost.getClubPost.clubPostVideo1 }</br>
모임 게시물 영상2 : ${ clubPost.getClubPost.clubPostVideo2 }</br>
모임 게시물 영상3 : ${ clubPost.getClubPost.clubPostVideo3 }</br>
모임 게시물 이미지1 : ${ clubPost.getClubPost.image1 }</br>
모임 게시물 이미지2 : ${ clubPost.getClubPost.image2 }</br>
모임 게시물 이미지3 : ${ clubPost.getClubPost.image3 }</br>
모임 게시물 이미지4 : ${ clubPost.getClubPost.image4 }</br>
모임 게시물 이미지5 : ${ clubPost.getClubPost.image5 }</br>
모임 게시물 이미지6 : ${ clubPost.getClubPost.image6 }</br>
모임 게시물 이미지7 : ${ clubPost.getClubPost.image7 }</br>
모임 게시물 이미지8 : ${ clubPost.getClubPost.image8 }</br>
모임 게시물 이미지9 : ${ clubPost.getClubPost.image9 }</br>
모임 게시물 이미지10 : ${ clubPost.getClubPost.image10 }</br>
모임 게시물 등록날짜 : ${ clubPost.getClubPost.clubPostRegDate }</br>
모임 게시물 수정날짜 : ${ clubPost.getClubPost.clubPostUpdateDate }</br>
모임 게시물 좋아요 수 : ${ clubPost.getClubPost.clubPostHeartCount }</br>
모임 게시물 댓글 개수 : ${ clubPost.getClubPost.clubPostCommentCount }</br>
<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
모임 게시물 댓글 리스트</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
<c:forEach var="i" begin="0" end="${ clubPost.getClubPost.clubPostCommentCount - 1 }" step="1">
<c:if test="${ clubPostComment.getClubPostCommentList[i].parent == clubPost.getClubPost.clubPostNo }">
모임 게시물 번호 : ${ clubPostComment.getClubPostCommentList[i].clubPostNo }</br>
모임 게시물 댓글 번호 : ${ clubPostComment.getClubPostCommentList[i].clubPostCommentNo }</br>
모임 게시물 등록 회원 아이디 : ${ clubPostComment.getClubPostCommentList[i].user.userId }</br>
모임 게시물 등록 회원 닉네임 : ${ clubPostComment.getClubPostCommentList[i].user.nickName }</br>
댓글 내용 : ${ clubPostComment.getClubPostCommentList[i].commentContent }</br>
댓글 등록날짜 : ${ clubPostComment.getClubPostCommentList[i].commentRegDate }</br>
댓글 수정날짜 : ${ clubPostComment.getClubPostCommentList[i].commentUpdateDate }</br>
댓글 좋아요 수 : ${ clubPostComment.getClubPostCommentList[i].commentHeartCount }</br>
신고여부 : ${ clubPostComment.getClubPostCommentList[i].reportCondition }</br>
삭제여부 : ${ clubPostComment.getClubPostCommentList[i].deleteCondition }</br>
댓글 부모번호 : ${ clubPostComment.getClubPostCommentList[i].parent }</br>
댓글 깊이 : ${ clubPostComment.getClubPostCommentList[i].depth }</br>
댓글 순서 : ${ clubPostComment.getClubPostCommentList[i].sequence }</br>
<%-- <a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPostComment.getClubPostCommentList[i].clubPostCommentNo }&depth=0">댓글 수 : ${ clubPostComment.getClubPostCommentList[i].commentCount }</a></br> --%>
<a href="###">댓글 수 : ${ clubPostComment.getClubPostCommentList[i].commentCount }</a></br>
//////////////////////////////////////////////////////////////////////</br>
</c:if>
</c:forEach>
</c:if>
</body>
</html>




