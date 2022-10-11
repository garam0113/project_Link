<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>������������Ʈ</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip ��� JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
	body {
		padding-top : 70px;
	}
	
	</style>

	<script type="text/javascript">
	
	function fncUpdateMemberRole() {
		
		$("form").attr("method", "POST").attr("action", "/club/updateMemberRole")
		alert("���ӿ� ���� ȭ��")
		.submit();
	}
	
	$(function(){
		$()
		
		
	})
	
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			alert("������ �����Ͻðڽ��ϱ�?");
			deleteClub();
			
		});
	});
	
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
		
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>������������Ʈ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>���������̸�</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>������������</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >������������</th>
            <th align="left">����������¥</th>
            <th align="left">���������ð�</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>
		<%-- ${clubList} --%>
		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${meetingList}">
		  <input type="hidden" name="meetingNo" value="${i.meetingNo}">
			<tr>
			<td align="center"><a href="/club/getMeeting?meetingNo=${i.meetingNo}">${i.meetingNo}</a>
			  <td align="left">${i.meetingTitle}</td>
			  <td align="left">${i.meetingDate}</td>
			  <td align="left">${i.meetingTime}</td>
			  <td align="left">${i.meetingPlace}</td>			  
			</tr>
          </c:forEach>
        </tr>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
	
	
</body>

</html>