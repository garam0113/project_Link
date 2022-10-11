<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
    
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>

<head>


<title>Q&A수정</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<script type="text/javascript">
	
	function fncUpdateQandA(){


	
		alert($($("form")[0]));
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/updateQandA").submit();
	}
			
	
	
	$(function(){
		
		$("td.ct_btn01:contains('수정')").bind("click", function(){
			fncUpdateQandA();
		});
		
		$("td.ct_btn01:contains('취소')").bind("click", function(){
			history.go(-1);
		});

		
	});

	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<form>

번호<input type="text" name="qandANo" value="${qandA.qandANo}"/>

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">QANDA 수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			제목 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input 	type="text" name="qandATitle" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20" 
								value="${qandA.qandATitle}">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
		<tr>
		<td width="104" class="ct_write">
			내용 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandAContent" value="${qandA.qandAContent}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
	
		<tr>
		<td width="104" class="ct_write">
			작성일자 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandARegDate" value="${qandA.qandARegDate}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
	
		<tr>
		<td width="104" class="ct_write">
			이미지1 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandAImage1" value="${qandA.qandAImage1}" enctype="multipart/form-data" 
			 class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
	
		<tr>
		<td width="104" class="ct_write">
			이미지2 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandAImage2" value="${qandA.qandAImage2}" enctype="multipart/form-data" 
			class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	

	
	<tr>
		<td width="104" class="ct_write">
			답변내용 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandAAnswerContent" value="${qandA.AnswerContent}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
		<tr>
		<td width="104" class="ct_write">
			답변상황 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandACondition" value="${qandA.qandACondition}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
<tr>
		<td width="104" class="ct_write">
			답변날짜 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandAAnswerRegDate" value="${qandA.qandAAnswerRegDate}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
			<td width="104" class="ct_write">
			오픈 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="qandAOpenCondition" value="${qandA.qandAOpenCondition}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	

	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
				
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		
	
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	
	
	
	<tr>

		
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						수정
					</td>
				
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>