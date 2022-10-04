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
		$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo=20").submit();
	});
	$("input[value='삭제']").bind("click", function(){
		$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=10&clubPostNo=20").submit();
	});
});
</script>
</head>
<body>
<input type="button" value="수정">
<input type="button" value="삭제">
모임 게시물 등록 회원 정보 : ${ map.getClubPost.user }</br>
모임 게시물 등록 회원 아이디 : ${ map.getClubPost.user.userId }</br>
모임 게시물 등록 회원 닉네임 : ${ map.getClubPost.user.nickName }</br>
모임 번호 : ${ map.getClubPost.clubNo }</br>
모임 게시물 번호 : ${ map.getClubPost.clubPostNo }</br>
모임 게시물 제목 : ${ map.getClubPost.clubPostTitle }</br>
모임 게시물 내용 : ${ map.getClubPost.clubPostContent }</br>
모임 게시물 영상1 : ${ map.getClubPost.clubPostVideo1 }</br>
모임 게시물 영상2 : ${ map.getClubPost.clubPostVideo2 }</br>
모임 게시물 영상3 : ${ map.getClubPost.clubPostVideo3 }</br>
모임 게시물 이미지1 : ${ map.getClubPost.image1 }</br>
모임 게시물 이미지2 : ${ map.getClubPost.image2 }</br>
모임 게시물 이미지3 : ${ map.getClubPost.image3 }</br>
모임 게시물 이미지4 : ${ map.getClubPost.image4 }</br>
모임 게시물 이미지5 : ${ map.getClubPost.image5 }</br>
모임 게시물 이미지6 : ${ map.getClubPost.image6 }</br>
모임 게시물 이미지7 : ${ map.getClubPost.image7 }</br>
모임 게시물 이미지8 : ${ map.getClubPost.image8 }</br>
모임 게시물 이미지9 : ${ map.getClubPost.image9 }</br>
모임 게시물 이미지10 : ${ map.getClubPost.image10 }</br>
모임 게시물 등록날짜 : ${ map.getClubPost.clubPostRegDate }</br>
모임 게시물 수정날짜 : ${ map.getClubPost.clubPostUpdateDate }</br>
모임 게시물 좋아요 수 : ${ map.getClubPost.clubPostLikeCount }</br>
모임 게시물 댓글 개수 : ${ map.getClubPost.clubPostCommentCount }</br>
<c:if test="${ map.getClubPost.clubPostCommentCount > 0 }">
	private int feedNo;						// 피드번호</br>
	private int feedCommentNo;				// 피드댓글번호</br>
	private int clubNo;						// 모임번호</br>
	private int clubPostNo;					// 모임게시물번호</br>
	private int clubPostCommentNo;			// 모임게시물댓글번호</br>
	private User user;						// 작성자의 모든 정보</br>
	private String commentContent;			// 댓글내용</br>
	private String commentRegDate;			// 댓글등록날짜</br>
	private String commentUpdateDate;		// 댓글수정날짜</br>
	private int commentLikeCount;			// 댓글 좋아요 수</br>
	private int commentCount;				// 댓글 수</br>
	private String reportCondition;			// 신고여부 0-false 1-true</br>
	private String deleteCondition;			// 삭제여부 0-false 1-true</br>
	private int parent;						// 상위 댓글 번호</br>
	private int depth;						// 댓글 깊이</br>
	private int sequence;					// 댓글 순서</br>
모임 게시물 댓글 리스트</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
<c:forEach var="i" begin="0" end="${ map.getClubPost.clubPostCommentCount - 1 }" step="1">
<c:if test="${ map.getClubPostCommentList[i].parent == 0 }">
모임 게시물 번호 : ${ map.getClubPostCommentList[i].clubPostNo }</br>
모임 게시물 댓글 번호 : ${ map.getClubPostCommentList[i].clubPostCommentNo }</br>
모임 게시물 등록 회원 아이디 : ${ map.getClubPostCommentList[i].user.userId }</br>
모임 게시물 등록 회원 닉네임 : ${ map.getClubPostCommentList[i].user.nickName }</br>
댓글 내용 : ${ map.getClubPostCommentList[i].commentContent }</br>
댓글 등록날짜 : ${ map.getClubPostCommentList[i].commentRegDate }</br>
댓글 수정날짜 : ${ map.getClubPostCommentList[i].commentUpdateDate }</br>
댓글 좋아요 수 : ${ map.getClubPostCommentList[i].commentLikeCount }</br>
신고여부 : ${ map.getClubPostCommentList[i].reportCondition }</br>
삭제여부 : ${ map.getClubPostCommentList[i].deleteCondition }</br>
댓글 부모번호 : ${ map.getClubPostCommentList[i].parent }</br>
댓글 깊이 : ${ map.getClubPostCommentList[i].depth }</br>
댓글 순서 : ${ map.getClubPostCommentList[i].sequence }</br>
<a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ map.getClubPostCommentList[i].clubPostCommentNo }">댓글 수 : ${ map.getClubPostCommentList[i].commentCount }</a></br>
//////////////////////////////////////////////////////////////////////</br>
</c:if>
</c:forEach>
</c:if>
</body>
</html>




