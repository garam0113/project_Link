<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>���ӿ�����Ʈ</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <!-- <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
    <!-- Bootstrap Dropdown Hover JS -->
   <!-- <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
	
	 <!-- jQuery UI toolTip ��� CSS-->
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
	
	function fncDeleteClub() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteClub")
		.submit();
	}
	
	$(function() {

		$("button.btn.btn-danger").on("click", function() {
			alert("������ �����Ͻðڽ��ϱ�?");
			fncDeleteClub();
		});
	});
	
	
	$(function() {
		$("input[value='�߹�']").bind("click", function() {
			alert("���ӿ��� �߹��մϴ� : ");
			$("form").attr("method", "POST").attr("action", "/club/deleteClubMember").submit();
		});
		
		
		
		$(document).on("click", "input[value='�߹�']", function(){
			alert('�߹�');
			var clubUserNo = $("#clubUserNo2").val();
			alert(clubUserNo);
			$.ajax("/clubRest/json/deleteClubMember",
					{
						method : "POST" ,
						data : JSON.stringify({
							clubUserNo : clubUserNo
						}) ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
						} // end of success  
					}); //end of ajax
			}); //���ӿ� �߹�
		

	
	
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
	
	var openWin;
	function popup() {
		var url = "/club/updateMemberRoleView.jsp";
		var name = "updateMemberRoleView";
		var option = "width = 800, height = 300, top = 100, left = 200, location = no"
		openWin= window.open(url, name, option);
	}

	$(function() {
		$("#updateMemberRole").on("click", function() {
			popup();
		});
		$("button:contains('����')").on("click", function() {
			openWin.document.getElementById("clubUserNo").value = $(this).val();
			openWin.document.getElementById("memberRole").value = $(this).attr("memberRole") ;
		});
		
	});
	
	});
	
	</script>	
	
</head>

<body>
		

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���ӿ�����Ʈ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
 		    <div class="col-md-6 text-left">
		    	<%-- <p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p> --%>
		    </div> 
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				  <div class="form-group">
					<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-danger"  >��&nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
					<button type="button" class="btn btn-waring"  >��&nbsp;��&nbsp;��&nbsp;��</button>
					<button type="button" class="btn btn-success btn" id="updateMemberRole">��&nbsp;å&nbsp;��&nbsp;��</button>
		  			</div>
				</div>	
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ�� ID</th>
            <th align="left">ȸ�� �г���</th>
            <th align="left">������å</th>
            <th align="left">������ ���ӽð�</th>
            <th align="left">���Ӱ��Գ�¥</th>
            <th align="left">���λ���</th>
            <th align="left">��å����</th>
            <th align="left">�߹�</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>

		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${clubMemberList}">
		  <input type="hidden" name="clubUserNo" value="${clubUserNo}">
			<%-- <c:set var="i" value="${ i+1 }" /> --%>
			<tr>
			<td align="center">${i.clubUserNo}</td>
			  <td align="left">${i.user.userId}</td>
			  <td align="left">${clubUser.nickName}</td>
			  <td align="left">${i.memberRole}</td>
			  <td align="left">${i.user.logoutDate}</td>
			  <td align="left">${i.joinRegDate}</td>
			  <td align="left">${i.approvalCondition}</td>
			  <!-- <td align="left"><button type="button" class="btn btn-success btn" id="updateMemberRole">��&nbsp;å&nbsp;��&nbsp;��</button> -->
			  <td align="left"><button value="${i.clubUserNo}" memberRole="${i.memberRole}">����</button>
			  <input type="hidden" id="clubUserNo2" name="clubUserNo2" value="${i.clubUserNo}">
			  <td align="left"><input type="button" value="�߹�">
			</tr>
          </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<%-- <jsp:include page="../common/pageNavigator_new2.jsp"/> --%>
	
	
</body>

</html>