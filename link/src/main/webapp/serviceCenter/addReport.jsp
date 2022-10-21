<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>공지사항 확인</title>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"></script>


<script type="text/javascript"> <%-- 자바스크립트 확인 --%>
</script>
<style><%-- CSS 확인 --%>

</style>

<head>
<meta charset="EUC-KR">

</head>
<body>
	

<body>
<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37"></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">공지사항 조회</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품번호 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr class ="noticeNo">
							<td width="105"><input type="hidden" name="noticeNo" id="noticeNo"value="${notice.noticeNo}">
								${notice.noticeNo}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">제목 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

	

			<tr>
				<td width="104" class="ct_write">이미지 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>${notice.noticeImage1}
				${notice.noticeImage2}
				<img src="/resources/image/uploadFiles/${notice.noticeImage1}" width="100" height="100" align="absmiddle"/>
				<img src="/resources/image/uploadFiles/${notice.noticeImage2}" width="100" height="100" align="absmiddle"/>
					
			</tr>

			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<tr>
				<td width="104" class="ct_write">내용 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${notice.noticeContent}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">작성일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${notice.noticeRegDate}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">WoW</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><fmt:formatNumber type="number"
						maxFractionDigits="3" value="${notice.noticeCount}" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
	
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">

					<table border="0" cellspacing="0" cellpadding="0">
						<tr>

							
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="ct_write01"><input type="hidden"
											id="Quantity" name="Quantity" value="1" /></td>
									</tr>
								</table>
							<td width="30"></td>
							<td background="/images/ct_btnbg02.gif" width="90" class="ct_btn01" style="padding-top: 3px;">수정</td>
							
							<td width="30"></td>

							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">삭제</td>
								
							<td width="14" height="23">
							<td background="/images/ct_btnbg02.gif" width="90"
								class="ct_btn01" style="padding-top: 3px;">이전</td>

							<td width="14" height="25"><img src="/images/ct_btnbg03.gif"
								width="14" height="23"></td>

						</tr>
					</table>

				</td>
			</tr>
		</table>
</body>
</body>
</div>
</body>
</html>