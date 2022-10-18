<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>���Ӹ���Ʈ</title>
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
		.thumbnail {
			display: flex;
			height : 100%;
		}
		
		.thumbnail img { 
			min-height:200px; height:150px;
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
			self.location="/club/getApprovalConditionList"
			
		});
	});
	
	
	
	</script>	
</head>

<body>
		
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���Ӹ���Ʈ</h3>
	       <a href="/club/addClubView.jsp">���ӵ��</a>      
	       
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    
		    <div class="col-md-6 text-right" style="float: right;">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>�����̸�</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>����ī�װ�</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  <button type="button" class="btn btn-primary">������Ȳ����Ʈ</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <!-- <table class="table table-hover table-striped" > -->
      
    <!--     <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >���� ����</th>
            <th align="left">���� �󼼼���</th>
            <th align="left">���� ī�װ�</th>
            <th align="left">���� �����ο� �� </th>
            <th align="left">�ִ� ���ӿ� ��</th>
            <th align="left">���� Ȱ������</th>
            <th align="left">���� �̹���</th>
            <th align="left">������Ȳ����Ʈ</th>
          </tr>
        </thead> -->
       
		<div class="row">
		
		<%-- ${clubList} --%>
		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${clubList}">
			<div class="col-xs-4 col-md-4">
			<div class="thumbnail" style="">
			  <%-- <td align="center">${ i }</td> --%>
			  <%-- <td align="left"><a href="/club/getClub?clubNo=${i.clubNo}">${i.clubNo}</a> --%>

			  <img src="/resources/image/uploadFiles/${i.clubImage}" alt=".">
			  <div class="caption">
			  	<p>${i.clubTitle}</p>
			  	<p>${i.clubArea}</p>
			  	<p>�����ο� : ${i.currentMember}</p>
			  	<p>�ִ��ο� : ${i.clubMaxMember}</p>
			  	<p><a href="/club/getClub?clubNo=${i.clubNo}" class="btn btn-success" role="button">���Ӻ���</a></p>
			  	
			  </div>
			  </div>
			</div>			  
		
        </c:forEach>

        </div>
        
      
      
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
	
	
</body>

</html>