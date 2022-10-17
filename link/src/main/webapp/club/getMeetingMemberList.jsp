<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>모임일정 참여자 리스트</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip 사용 JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
	body {
		padding-top : 70px;
	}
	
	</style>

	<script type="text/javascript">
	
	

	
	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-waring").on("click", function() {
			self.location="/club/updateClubView.jsp"
		});
	});
	
	
	
	</script>	
	
</head>

<body>
		
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>모임일정참여자리스트</h3>
	    </div>
	    
	  <form class="form-horizontal">  
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원 아이디</th>
            <th align="left">회원 닉네임</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>
		  <c:forEach var="i" items="${meetingMemberList}">
		  <input type="hidden" name="participantNo" value="${i.participantNo}">
			<tr>
			<td align="center">${i.participantNo}</td>
 			  <td align="left">${i.user.userId}</td>
			  <td align="left">${i.user.nickName}</td>
			  
			</tr>
          </c:forEach>
        </tr>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
		<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a class="btn btn-primary btn" href="#" role="button">닫&nbsp;기</a>					
		    </div>
			</div>		
	  
	  </form>
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	
	
</body>

</html>