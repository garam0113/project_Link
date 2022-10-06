<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
//alert("생성");

$.ajax(
				{
					url : "/myHomeRest/json/getFollowList",
					method : "POST",
					data : JSON.stringify ({
						currentPage : $("#currentPage").val()
					}),
					dataType : "json",
					contentType: "application/json",
					success : function(data) {
			
						
						alert("생성");
						$.map(data, function(item, index){
							console.log(item);	
							for(var i = 0 ; i < item.length ; i++) {
							
								$(".c(" + i + ") ").text(item[i].userId);
								
						
								
							}
							
						})
						
						
					
					} // success close
					
				} // ajax inner close
		
		) // ajax close
	

});

</script>
</head>
<body>
<div class="c">
<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<tr class="ct_list_pop">
				<td align="center">${list.userId}</td>
				<td></td>
				<td align="center">
</td>
</tr>
</c:forEach>
</div>
</body>
</html>