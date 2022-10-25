<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title></title>
</head>


<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("td.ct_btn01:contains('이전')").bind("click", function() {

			history.go(-1);

		});

		$("td.ct_btn01:contains('수정')").bind("click", function() {
			self.location = "../serviceCenter/updateReport?no="+$('tr.no').find('td').text();
		})



	});
</script>

<body bgcolor="#ffffff" text="#000000">

	<form>

		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37"></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">신고 처리한다</td>
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
				<td width="104" class="ct_write">번호 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr class ="no">
							<td width="105"><input type="hidden" name="no" id="no" value="${report.no}">
								${report.no}</td>
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
				<td class="ct_write01">${report.title}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>

			<c:set var="text" value="${fn:split(report.reportImage1, '*')}"></c:set>

			<tr>
				<td width="104" class="ct_write">이미지 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>

				<td class="ct_write01"><c:forEach var="i" items="${text}">
						<img src="/images/uploadFiles/${i}" width="300" height="300"
							align="absmiddle" />
					</c:forEach></td>
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
				<td class="ct_write01">${report.content}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">작성일자</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${report.regDate}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			
		    <label for="reportReason" class="col-sm-offset-1 col-sm-3 control-label">신고 사유</label>
		    <div class="col-sm-4">
		    <c:if test="${report.reportReason == '1'|| report.reportReason == '3' || report.reportReason == '5' || report.reportReason =='7'|| report.reportReason =='9'
		    || report.reportReason =='11'|| report.reportReason =='13'|| report.reportReason =='15'}">
		      욕설<input type="checkbox" class="form-control" id="reportReason" name="reportReason" value="1" checked >
		    </c:if>
		     <c:if test="${report.reportReason == '2'|| report.reportReason == '3' || report.reportReason =='6'|| report.reportReason =='7'|| report.reportReason =='10'
		     || report.reportReason =='14'|| report.reportReason =='15'}">
		      광고<input type="checkbox" class="form-control" id="reportReason" name="reportReason" value="2" checked>
		    </c:if>
		    <c:if test="${report.reportReason == '4'|| report.reportReason == '5' || report.reportReason == '6' || report.reportReason =='7'|| report.reportReason == '12'
		    || report.reportReason =='13'|| report.reportReason =='14'|| report.reportReason =='15'}">
		      기타<input type="checkbox" class="form-control" id="reportReason" name="reportReason" value="4" checked>
		     </c:if>
		    <c:if test="${report.reportReason == '8'|| report.reportReason == '9' || report.reportReason == '10' || report.reportReason == '11' || report.reportReason == '12'
		     || report.reportReason == '11' || report.reportReason == '14' || report.reportReason == '15' }">
		      성적<input type="checkbox" class="form-control" id="reportReason" name="reportReason" value="8" checked>
		   </c:if>

		    </div>
		  	</tr>
		 <tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">신고한 ID</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${report.user1.userId}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">신고대상ID</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${report.user2.userId}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">신고누적횟수</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${report.user2.reportCount}</td>
			</tr>
			<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
				<tr>
				<td width="104" class="ct_write">신고출처</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
				<c:if test="${report.reportSource=='1'}">모임게시물</c:if>
				<c:if test="${report.reportSource=='2'}">모임게시물댓글</c:if>
				<c:if test="${report.reportSource=='3'}">피드</c:if>
				<c:if test="${report.reportSource=='4'}">피드댓글</c:if>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr/><tr/>
			<tr>
				<td width="104" class="ct_write">신고처리상태</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${report.reportCondition}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">신고처리날짜</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${report.user2.stopStartDate}</td>
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
	</form>

</body>

</html>