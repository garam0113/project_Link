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
			 		var addHead ="";
			 		var a = 0;
					$.each(myItem,function(index,item){
					
						const firstimage1 =$.trim(item.firstimage);
						const firstimage2 =$.trim(item.firstimage2);

					<%--	document.write(item.title);   --%>
			  if(firstimage1!=""){    //이미지 없는 거 거르기
				 	 a+=1
				  	
				  	addHead+= "<li data-target=#carousel-example-generic data-slide-to="+a+" class=active></li>"
				  	
				  
				  
					addHtml+=	"<div class=item>"+
								"<img src="+item.firstimage+" style= width:300px; height:300px;/>"+
								"<div class=carousel-caption>"+
								"</div>"+
								"</div>"

								}//if문 끝
						}) //each 끝
							console.log(addHtml);
					
							
							$(".slide").html(addHtml);
							$(".carousel-inner").html(addHead);
							
							
							
					} //success 끝
			 
		 }) //화면 찾아오기 끝

	
<%--	$("button:contains('살펴보기')").bind("click", function() {	 
		$.ajax({
			url  : "/serviceCenterRest/json/getFestival",
			type : "get",
			data : {"contentId": this.item.contentId},
				   
			dataType: "json",
			success:function(msg){
						
			}		 
		 
		 
		})//개인 이미지 찾아오기
	})    --%>
});//펑션 끝
</script>
<style>
.card-header{

}

</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			 <div class="carousel-inner" role="listbox">
			 </div>
		</ol>
	</div>
	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>	
</body>
</html>