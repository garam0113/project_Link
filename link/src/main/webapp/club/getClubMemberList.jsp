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
		
	 <!-- jQuery UI toolTip ��� CSS-->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip ��� JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
	body {
		padding-top : 70px;
	}
	
	#btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	
	td {
		text-align: center;
	}
	
	</style>
	
	<!-- ?? -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
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
	
	function refreshMemList(){
		location.reload();
	}
	
	$(function() {

		$("button.btn.btn-danger").on("click", function() {
			alert("������ �����Ͻðڽ��ϱ�?");
			fncDeleteClub();
		});
	});
	
	//�߹� �׳� ��Ʈ�ѷ�
	 $(function() {
		$("#banMember").on("click", function() {
			alert("���ӿ��� �߹��մϴ� : ");
			$("form").attr("method", "POST").attr("action", "/club/deleteClubMember").submit();
		}); 
		
		$(function() {
			$("#updateApprovalCondition").on("click", function() {
				//alert("���ӿ��� �����մϴ� : ");
				$("form").attr("method", "POST").attr("action", "/club/updateApprovalCondition").submit();
		});
		
		
			//�߹� �׳� ��Ʈ�ѷ�	
			$(document).on("click", "#banMember", function(){
			//alert('�߹�');
			var clubUserNo = $(this).val();
			//alert(clubUserNo);
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
					refreshMemList();
			}); //���ӿ� �߹� 
		
			
			
			/* $(function() {
				$("#banMember").on("click", function(e){
					var clubUserNo = $(this).val();
					$("banMember").off(e);
				$.ajax({
					url : "/clubRest/json/deleteClubMember",
					type : "POST",
					datatype : "json"
					data : JSON.stringify({
						clubUserNo : clubUserNo
					}),
					
					contentType : "application/json",
					success : function(data) {
						console.log(data.clubMemberList);
						
					}
					
				})
					
				})
			}) */
			

		
				
			$(document).on("click", "#updateApprovalCondition", function(){
				//alert('����');
				var clubUserNo = $(this).val();
				var approvalCondition = $(this).attr('approvalCondition');
 				//alert(clubUserNo);
				//alert(approvalCondition);
				$.ajax("/clubRest/json/updateApprovalCondition",
						{
							method : "POST" ,
							data : JSON.stringify({
								clubUserNo : clubUserNo ,
								approvalCondition : approvalCondition
							}) ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							dataType : "json",
							success : function(JSONData, status) {
								alert(status);
							} // end of success
						}); // end of ajax
						refreshMemList();
				}); // end of ����

	
	
	$(function() {

		$("button.btn.btn-primary").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {

		$("button.btn.btn-warning").on("click", function() {
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
	 });
	</script>
</head>

	
	<body class="blog masonry-style">
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	
	<jsp:include page="/toolbar.jsp" />
	
	<main role="main">
		
			<div id="intro-wrap" data-height="27.778"><!-- ��� ������ ���� ���� -->
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB MEMBER LIST</h2>
							<p>Manage the members of the club...</p>
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- �߰� �������� -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList">���� ����</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">���� �Խù�</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">���ӿ�</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList">���� ä��</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">����</a>
						</li> --%>
					</ul>

		

	<div class="container">
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <!-- <input type="hidden" id="currentPage" name="currentPage" value=""/> -->
				  
				  <div class="form-group" id="btn_group" style="float: right; margin: 0px;">
				  
					<!--  <div class="col-sm-offset-4  col-sm-4 text-center"> -->
										
						<button type="button" class="btn btn-success btn" id="updateMemberRole">��&nbsp;å&nbsp;��&nbsp;��</button>
						<button type="button" class="btn btn-primary">��&nbsp;��</button>
						<button type="button" class="btn btn-warning"  >��&nbsp;��&nbsp;��&nbsp;��</button>
						<button type="button" class="btn btn-danger"  >��&nbsp;��</button>
		  			</div>
				</div>	
	    	
	
	
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">�����ʻ���</th>	
            <th align="left" >ȸ�� ID</th>
            <th align="left">ȸ�� �г���</th>
            <th align="left">������å</th>
            <th align="left">������ ���ӽð�</th>
            <th align="left">���Ӱ��Գ�¥</th>
            <th align="left">���λ���</th>
            <th align="left">��å����</th>
            <th align="left">�߹�</th>
            <th align="left">����/����</th>
            <th align="left">Max</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>
		  <c:forEach var="i" items="${clubMemberList}">
			<tr>
			<td align="center"><img src="/resources/image/uploadFiles/${i.user.profileImage}" width="100" height="100"></td>
			  <td >${i.user.userId}</td>
			  <td align="left">${i.user.nickName}</td>
			  <td align="center">${i.memberRole}</td>
			  <td align="left">${i.logoutDate}</td>
			  <td align="left">${i.joinRegDate}</td>
			  <td align="center">${i.approvalCondition}</td>
			  <%-- <td><center>${i.approvalCondition}</center></td> --%>
			  <td align="left"><button value="${i.clubUserNo}" memberRole="${i.memberRole}">����</button>
			  <td align="left"><button value="${i.clubUserNo}" id="banMember">�߹�</button>
			  <td align="left"><button value="${i.clubUserNo}" approvalCondition = "${i.approvalCondition}" id="updateApprovalCondition">����</button>
			  <td>${i.club.clubMaxMember}</td>
			  <c:if test="${i.memberRole}== 0">
			  	���ӿ�
			  </c:if>
			</tr>
          </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  

 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<%-- <jsp:include page="../common/pageNavigator_new2.jsp"/> --%>
	</div>
	</div>
	</div>
	</main>
</body>

</html>