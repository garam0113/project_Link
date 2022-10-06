<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>

	<title>회원정보조회</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		
		//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
			
		
		
		
		
		
	</script>
<style>
.calendar
{
  margin: 0 auto;
  width: 1000px;
  display: flex;
 justify-content: center;
}

</style>

<style>
.image
{
  margin: 0 auto;
  width: 400px;
  text-align: center;
}
.to
{
  margin: 0;
  width: 350px;
  text-align: left;
}
.usertext{
    margin-right: 10px;
    padding: 10px;
    margin-left: -100px;}
.calendertext{
	padding: 10px;
}
</style>

<script>
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 	$("a:contains('로그인')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "/myHome/getProfile"
	}); 
 });

</script>


</head>

<body bgcolor="#ffffff" text="#000000">



<div class="image"><img src="/images/images.png"></div>
				
				
<div class="calendar">

<div class="usertext">
<table width="300px" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;" class="to">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>

		<td width="104" class="ct_write">
			아이디 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${user.userId}</td>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			이름 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.name}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">주소</td>
		<td bgcolor="D6D6D6" width="1"></td>
	
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">휴대전화번호</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${user.phoneNo}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">이메일 </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">${user.email}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">가입일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td height="26">${club.clubTitle}</td>
		<td height="26">${feedList.content}</td>
	</tr>
	<tr>
		<td width="104" class="ct_write">자기소개</td>
		<td bgcolor="D6D6D6" width="1"></td>
		
	</tr>
	</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
	<td width="104" class="ct_write">자기소개</td>
		<td bgcolor="D6D6D6" width="1"></td>
		
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
			
			<li><a href="#" id="sgr">로그인</a></li>
			
				<tr>
					
					<!--	jQuery Event 처리로 변경
					
						<a href="javascript:history.go(-1);">확인</a>
						
					-->
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<div class="calendertext">
<jsp:include page="/myHome/calendar.jsp"/>
</div> 
<div>
<td width="104" class="ct_write">자기소개</td>
		<td bgcolor="D6D6D6" width="1"></td>
		
</div>
	
	<div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      
					      <a class="btn btn-primary btn" href="getMyHome?userId=user1&clubNo=1" role="button">마 &nbsp;이 &nbsp;홈 &nbsp;피</a>
					    </div>




</body>

</html>