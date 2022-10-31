<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">

<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
 // 데이터를 aJax로 받기
 
$(function(){

		
		$.ajax({  //화면 나타내기
				url  : "/serviceCenterRest/json/getFestivalList",
				type : "get",
				data : {"contentTypeId" : 15},
				dataType: "json",
				success:function(msg){
					var myItem =msg.response.body.items.item;
			 		var addHtml ="";
			 		
					$.each(myItem,function(index,item){
					
						const firstimage1 =$.trim(item.firstimage);
						const firstimage2 =$.trim(item.firstimage2);
						
					<%--	document.write(item.title);   --%>
			  if(firstimage1!=""){    //이미지 없는 거 거르기
					addHtml+=	"<div class=card style = 'width:300px;'>"+
						 	 		"<div class=card-header style= 'text-align: center;'>"+
						 	  		 item.title+
							 		 "</div>"+
							  "<img src="+item.firstimage+" style= width:300px; height:300px;/>"+
							  "<div class=card-body>"+
						 	   "<h5 class=card-title style='text-align:center;'>"+ item.title+"</h5>"+
						 	   "<input type='hidden' name='contentid' value="+item.contentid+">"+
						 	   
						 	   "<button class='custom-btn btn-13'style='margin-left: 83px;'>"+"살펴보기"+"</button>"+
							  "</div>"+
							"</div>"
								
							
	
							
					  }//if문 끝
								
					}) //each 끝
						
					  
					$(".festival").html(addHtml);
					
				
					 $("button:contains('살펴보기')").bind("click", function() {
					<%--		console.log($(this).parent().find('input[name="contentid"]').val());  --%>
							$.ajax({
							url  : "/serviceCenterRest/json/getFestival",
							type : "get",
							data : {"contentid":$(this).parent().find('input[name="contentid"]').val()},
							dataType: "json",
							success:function(msg2){
								alert(1);
								var homepage =msg.response.body.items.item.homepage;
								alert(homepage);
								
									}//안의 success
						 
								})//개인 이미지 찾아오기
							})//버튼 펑션
							} //ssuccess끝		 

			 
		 }) //화면 찾아오기 끝

		 
	});//펑션 끝	 
		 
		 
</script>
<style>
.btn-13 {
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background-color: white;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: solid 2px;
  box-shadow:none !important;
  outline: none;
  box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
  border-radius: 10px;
  padding: 10px;
  color: #5F0080 !important;
  font-size: 16px !important;
  text-align: center;
}

.btn-13:hover { 
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}

</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="festival"> 
	
	</div>
</div>	
</body>
</html>