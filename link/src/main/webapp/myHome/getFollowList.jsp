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
					data : JSON.stringify ,
					
			
					dataType : "json",
					contentType: "application/json",
					success : function(data, status) {
			    
						alert("생성");
						for(var i =0; i<data.list.length; i++){
							var userId = data.list[i].userId;
							var receiveId = data.list[i].receiveId;
							var nickName = data.list[i].nickName;
							
							console.log(userId);
							console.log(receiveId);
							console.log(nickName);
							
					               $($(".userId")[i]).html(userId);
					               $($(".receiveId")[i]).html(receiveId);
					               $($(".nickName")[i]).html(nickName);

					               console.log($($(".userId")[i]).html());
					               console.log($($(".receiveId")[i]).html());
					               console.log($($(".nickName")[i]).html());
							
						}
								
						
								
					
							
						})
						
						
					
		
					
				} // ajax inner close
		
		); // ajax close
	



</script>
</head>
<body>
<div >
<c:set var="i" value="0" />
            <c:forEach var="user" items="${list}">
               <c:set var="i" value="${ i+1 }" />
            <!--    <div class="col-md-6 col-md-4" id="${prod.prodNo}">  -->
               <div class="col-md-6 col-md-4" id="${user.userId}">
                  <div class="thumbnail">
                     <div class="userId" style="width: 50%; height: 300px;">
                     </div>
                     <div class="bottom" style="width: 50%">
                        <div class="caption">
                           <h3 class="receiveId"></h3>
                           <p class="nickName"></p>
                           <br />
                           <p>
		</p>
		</div>
		</div>
		</div>
		</div>
		</c:forEach>
	
</div>
</body>
</html>