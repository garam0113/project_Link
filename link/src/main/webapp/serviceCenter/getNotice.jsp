<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
    
<%@	taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<title></title>
	</head>
	
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">



	
	$(function(){
			

		$("td.ct_btn01:contains('����')").bind("click", function(){
			
			history.go(-1);
			
		});
		
	
	
	});
	
	</script>

<body bgcolor="#ffffff" text="#000000">

<form>
	
	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">�������� ��ȸ</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">
							<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
								${notice.noticeNo}
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
				���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<c:set var="text" value="${fn:split(notice.noticeImage1, '*')}" ></c:set>
		
		<tr>
			<td width="104" class="ct_write">
				�̹��� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			
			<td class="ct_write01">
				<c:forEach var="i" items="${text}">
					<img src="/images/uploadFiles/${i}" width="300" height="300" align="absmiddle"/>
				</c:forEach>
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">
				���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${notice.noticeContent}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�ۼ�����</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${notice.noticeRegDate}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">WoW</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${notice.noticeCount}" />
	
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�������</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${notice.noticeRegDate}</td>
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
				
					<c:if test="${user eq null || user.role == 'user'}" >
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="ct_write01" >
									<input type="hidden" id="Quantity" name="Quantity" value="1"/>
								</td>
							</tr>
						</table>
						<td width="30"></td>
					 <td background="/images/ct_btnbg02.gif" width="90" class="ct_btn01" style="padding-top: 3px;">
								?
					</td>	
						</c:if>		
						<td width="30"></td>	
					<td background="/images/ct_btnbg02.gif" width="90" class="ct_btn01" style="padding-top: 3px;">
						����
					</td>
					
					<td width="14" height="25">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
					
				</tr>
			</table>
	
			</td>
		</tr>
	</table>
</form>

</body>

</html>