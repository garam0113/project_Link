<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<title>Feed</title>

<link href="/resources/css/feed/getFeedList.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>

<%-- SUMMER NOTE --%>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<%-- SUMMER NOTE --%>

<%-- ALERT --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%-- ALERT --%>

<%-- BOOTSTRAP ICON --%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%-- BOOTSTRAP ICON --%>
<script type="text/javascript">
 // 데이터를 aJax로 받기
 
$(function(){

		
		$.ajax({  //화면 나타내기
				url  : "/serviceCenterRest/json/getFestivalList",
				type : "get",
				data : {"contentTypeId" : 15},
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success:function(msg){
					var myItem =msg.response.body.items.item;
					
			 		var addHtml ="";
			 		
			 		
			$.each(myItem,function(index,item){
					
						const firstimage1 =$.trim(item.firstimage);
						const firstimage2 =$.trim(item.firstimage2);
						
					<%--	document.write(item.title);   --%>
			  if(firstimage1!=""){    //이미지 없는 거 거르기
					addHtml+=	"<div class=card style = 'width:230px; margin-bottom:20px; border:2px solid black;'>"+
						 	 		"<div class=card-header style= 'text-align: center;'>"+
						 	  		 item.title+
							 		 "</div>"+
							  "<img src="+item.firstimage+" style= width:226px; height:300px;/>"+
							  "<div class=card-body style='text-align:center;'>"+
						 	   "<h5 class=card-title>"+ item.title+"</h5>"+
						 	   "<input type='hidden' name='contentid' value="+item.contentid+">"
								
							<%--		console.log($(this).parent().find('input[name="contentid"]').val());  --%>
										$.ajax({
										url  : "/serviceCenterRest/json/getFestival",
										type : "get",
										data : {"contentid":item.contentid},
										datatype: "json",
										contentType: "application/json; charset=utf-8",
										async: false,
										success:function(msg2){
											const msg2data = JSON.parse(msg2)
											addHtml+= msg2data.response.body.items.item[0].homepage+
												 "</div>"+
												  "</div>";
											
											
												}//안의 success
									 		
											})//개인 이미지 찾아오기
											}//if문 끝
						}) //each 끝
 
						
						$(".festival").html(addHtml);
					
				} //ssuccess끝		 
					
			 
		 }) //화면 찾아오기 끝

		 
	});//펑션 끝	 
		 
		 
</script>
<style>
.box{
overflow:scroll;
overflow-x:hidden;
}
.box::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="box festival" style="width:230px; height: 522px;"> 
	
	</div>
</body>
</html>