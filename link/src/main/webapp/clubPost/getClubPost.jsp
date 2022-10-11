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
	$("input[value='����']").bind("click", function(){
		$("form").attr("method", "post").attr("action", "/clubPost/updateClubPostView?clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
	});
	$("input[value='����']").bind("click", function(){
		alert("���� �Խù� ��ȣ : " + ${ clubPost.getClubPost.clubPostNo });
		$("form").attr("method", "post").attr("action", "/clubPost/deleteClubPost?clubNo=2&clubPostNo="+${ clubPost.getClubPost.clubPostNo }).submit();
	});
	$("input[value='����Ʈ���̵�']").bind("click", function(){
		location.href = "/clubPost/getClubPostList?clubNo=2&order=0";
	});
	$("a:contains('��Ʈ')").bind("click", function(){
		alert('��Ʈ');
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
	}); // end of ��Ʈ
	$(document).on("click", "b:contains('��� ��')", function(){
	//$("b:contains('��� ��')").on("click", function(){
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
											+"<b style='color : blue;'>��۹�ȣ : " + el.clubPostCommentNo + "</b></br>"
											+"��۳��� : " + el.commentContent + "</br>"
											+"��۵�ϳ�¥ : " + el.commentRegDate + "</br>"
											+"��ۼ�����¥ : " + el.commentUpdateDate + "</br>"
											+"��� ���ƿ� �� : " + el.commentHeartCount + "</br>"
											+"��� �Ű��� : " + el.reportCondition + "</br>"
											+"��� �������� : " + el.deleteCondition + "</br>"
											+"��� �θ��ȣ : " + el.parent + "</br>"
											+"��� ���� : " + el.depth + "</br>"
											+"��� ���� : " + el.sequence + "</br>"
											+"<div class='"+el.clubPostCommentNo+"'>"
											+"<b style='color : green;' clubPostNo="+el.clubPostNo+" clubPostCommentNo="
													+el.clubPostCommentNo+">��� �� " + el.commentCount + "</b></br>"
											+"</div>"
											+"</div>";
							alert(display);

							$("div[class='"+clubPostCommentNo+"']").append(display);
							//*/
						});
					} // end of success
				}); // end of ajax
	}); // end of ��� ��
});
</script>
</head>
<body>
<form></form>
<input type="button" value="����">
<input type="button" value="����">
<input type="button" value="����Ʈ���̵�">
<a href="#"><img alt="" src="abcd.jpg">��Ʈ</a></br>
<%-- ���� �Խù� ��� ȸ�� ���� : ${ clubPost.getClubPost.user }</br> --%>
���� �Խù� ��� ȸ�� ���̵� : ${ clubPost.getClubPost.user.userId }</br>
<%-- ���� �Խù� ��� ȸ�� �г��� : ${ clubPost.getClubPost.user.nickName }</br> --%>
���� ��ȣ : ${ clubPost.getClubPost.clubNo }</br>
���� �Խù� ��ȣ : ${ clubPost.getClubPost.clubPostNo }</br>
���� �Խù� ���� : ${ clubPost.getClubPost.clubPostTitle }</br>
���� �Խù� ���� : ${ clubPost.getClubPost.clubPostContent }</br>
���� �Խù� ����1 : ${ clubPost.getClubPost.clubPostVideo1 }</br>
���� �Խù� ����2 : ${ clubPost.getClubPost.clubPostVideo2 }</br>
���� �Խù� ����3 : ${ clubPost.getClubPost.clubPostVideo3 }</br>
���� �Խù� �̹���1 : ${ clubPost.getClubPost.image1 }</br>
���� �Խù� �̹���2 : ${ clubPost.getClubPost.image2 }</br>
���� �Խù� �̹���3 : ${ clubPost.getClubPost.image3 }</br>
���� �Խù� �̹���4 : ${ clubPost.getClubPost.image4 }</br>
���� �Խù� �̹���5 : ${ clubPost.getClubPost.image5 }</br>
���� �Խù� �̹���6 : ${ clubPost.getClubPost.image6 }</br>
���� �Խù� �̹���7 : ${ clubPost.getClubPost.image7 }</br>
���� �Խù� �̹���8 : ${ clubPost.getClubPost.image8 }</br>
���� �Խù� �̹���9 : ${ clubPost.getClubPost.image9 }</br>
���� �Խù� �̹���10 : ${ clubPost.getClubPost.image10 }</br>
���� �Խù� ��ϳ�¥ : ${ clubPost.getClubPost.clubPostRegDate }</br>
���� �Խù� ������¥ : ${ clubPost.getClubPost.clubPostUpdateDate }</br>
���� �Խù� ���ƿ� �� : ${ clubPost.getClubPost.clubPostHeartCount }</br>
���� �Խù� ��� ���� : ${ clubPost.getClubPost.clubPostCommentCount }</br>
<c:if test="${ clubPost.getClubPost.clubPostCommentCount > 0 }">
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
���� �Խù� ��� ����Ʈ</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
//////////////////////////////////////////////////////////////////////</br>
<c:forEach var="i" begin="0" end="${ clubPost.getClubPost.clubPostCommentCount - 1 }" step="1">
<c:if test="${ clubPost.getClubPostCommentList[i].parent == clubPost.getClubPost.clubPostNo }">
��� ���� : ${ sessionScope.user.userid }<div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
${ clubPost.getClubPostCommentList[i].commentContent }</div>
<if test="${ user.userid }">
<button class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">����</button>
</if></br>
���� �Խù� ��ȣ : ${ clubPost.getClubPostCommentList[i].clubPostNo }</br>
���� �Խù� ��� ��ȣ : ${ clubPost.getClubPostCommentList[i].clubPostCommentNo }</br>
���� �Խù� ��� ȸ�� ���̵� : ${ clubPost.getClubPostCommentList[i].user.userId }</br>
���� �Խù� ��� ȸ�� �г��� : ${ clubPost.getClubPostCommentList[i].user.nickName }</br>
��� ��ϳ�¥ : ${ clubPost.getClubPostCommentList[i].commentRegDate }</br>
��� ������¥ : ${ clubPost.getClubPostCommentList[i].commentUpdateDate }</br>
��� ���ƿ� �� : ${ clubPost.getClubPostCommentList[i].commentHeartCount }</br>
�Ű��� : ${ clubPost.getClubPostCommentList[i].reportCondition }</br>
�������� : ${ clubPost.getClubPostCommentList[i].deleteCondition }</br>
��� �θ��ȣ : ${ clubPost.getClubPostCommentList[i].parent }</br>
��� ���� : ${ clubPost.getClubPostCommentList[i].depth }</br>
��� ���� : ${ clubPost.getClubPostCommentList[i].sequence }</br>
<%-- <a href="/clubPostRest/getClubPostCommentList?clubPostCommentNo=${ clubPost.getClubPostCommentList[i].clubPostCommentNo }&depth=0">��� �� : ${ clubPost.getClubPostCommentList[i].commentCount }</a></br> --%>
<div class="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }">
	<b style="color : red;" clubPostCommentNo="${ clubPost.getClubPostCommentList[i].clubPostCommentNo }"
	clubPostNo="${ clubPost.getClubPostCommentList[i].clubPostNo }">
	��� �� ${ clubPost.getClubPostCommentList[i].commentCount }</b></br>
</div>
//////////////////////////////////////////////////////////////////////</br>
</c:if>
</c:forEach>
</c:if>
</body>
</html>




