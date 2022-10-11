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
	$("a:contains('하트')").bind("click", function(){
		alert('하트');
		$.ajax( "/clubPostRest/json/updateClubPost",
				{
					method : "POST",
					data : JSON.stringify({
								clubPostNo : ${ clubPost.getClubPost.clubPostNo },
								userId : "${ clubPost.getClubPost.user.userId }"
							}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status){
						//alert(status);
						//alert(JSONData);
						$("a[href='#']").text(JSONData);
					}
				});
	}); // end of 하트
	$(document).on("click", "b:contains('댓글 수')", function(){
	//$("b:contains('댓글 수')").on("click", function(){
		var clubPostCommentNo = $(this).attr("clubPostCommentNo");
		var clubPostNo = $(this).attr("clubPostNo");
		alert("clubPostCommentNo : " + clubPostCommentNo);
		alert("clubPostNo : " + clubPostNo);
		$.ajax( "/clubPostRest/json/getClubPostCommentList",
				{
					method : "POST",
					data : JSON.stringify({
								clubPostCommentNo : clubPostCommentNo,
								clubPostNo : clubPostNo
							}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status){
						alert(status);
						$.each( JSONData, function( index, el ){
							///* 
							var display = "<div>"
											+"<b style='color : blue;'>댓글번호 : " + el.clubPostCommentNo + "</b></br>"
											+"댓글내용 : " + el.commentContent + "</br>"
											+"댓글등록날짜 : " + el.commentRegDate + "</br>"
											+"댓글수정날짜 : " + el.commentUpdateDate + "</br>"
											+"댓글 좋아요 수 : " + el.commentHeartCount + "</br>"
											+"댓글 신고여부 : " + el.reportCondition + "</br>"
											+"댓글 삭제여부 : " + el.deleteCondition + "</br>"
											+"댓글 부모번호 : " + el.parent + "</br>"
											+"댓글 깊이 : " + el.depth + "</br>"
											+"댓글 순서 : " + el.sequence + "</br>"
											+"<div class='"+el.clubPostCommentNo+"'>"
											+"<b style='color : green;' clubPostNo="+el.clubPostNo+" clubPostCommentNo="
													+el.clubPostCommentNo+">댓글 수 " + el.commentCount + "</b></br>"
											+"</div>"
											+"</div>";
							alert(display);

							$("div[class='"+clubPostCommentNo+"']").append(display);
							//*/
						});
					} // end of success
				}); // end of ajax
	}); // end of 댓글 수
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
<c:if test="${ clubPost.getClubPostCommentList[i].parent == clubPost.getClubPost.clubPostNo }">
댓글 내용 : ${ sessionScope.user.userid }<div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
${ clubPost.getClubPostCommentList[i].commentContent }</div>
<if test="${ user.userid }">
<button class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">수정</button>
</if></br>
모임 게시물 번호 : ${ clubPost.getClubPostCommentList[i].clubPostNo }</br>
모임 게시물 댓글 번호 : ${ clubPost.getClubPostCommentList[i].clubPostCommentNo }</br>
모임 게시물 등록 회원 아이디 : ${ clubPost.getClubPostCommentList[i].user.userId }</br>
모임 게시물 등록 회원 닉네임 : ${ clubPost.getClubPostCommentList[i].user.nickName }</br>
댓글 등록날짜 : ${ clubPost.getClubPostCommentList[i].commentRegDate }</br>
댓글 수정날짜 : ${ clubPost.getClubPostCommentList[i].commentUpdateDate }</br>
댓글 좋아요 수 : ${ clubPost.getClubPostCommentList[i].commentHeartCount }</br>
신고여부 : ${ clubPost.getClubPostCommentList[i].reportCondition }</br>
삭제여부 : ${ clubPost.getClubPostCommentList[i].deleteCondition }</br>
댓글 부모번호 : ${ clubPost.getClubPostCommentList[i].parent }</br>
댓글 깊이 : ${ clubPost.getClubPostCommentList[i].depth }</br>
댓글 순서 : ${ clubPost.getClubPostCommentList[i].sequence }</br>
<%-- <a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPost.getClubPostCommentList[i].clubPostCommentNo }&depth=0">댓글 수 : ${ clubPost.getClubPostCommentList[i].commentCount }</a></br> --%>
<div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
	<b style="color : red;" clubPostCommentNo="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }"
	clubPostNo="${ clubPost.getClubPostCommentList[i].clubPostNo }">
	댓글 수 ${ clubPost.getClubPostCommentList[i].commentCount }</b></br>
</div>
//////////////////////////////////////////////////////////////////////</br>
</c:if>
</c:forEach>
</c:if>
</body>
</html>




