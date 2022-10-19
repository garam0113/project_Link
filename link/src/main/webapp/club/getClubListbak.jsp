<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ����? -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
 	 
 	 
 	 <!-- ���� ����?? -->
 	 	<meta name="description" content="The Page Description">
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		<title>Beetle - Home page</title>
		<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
		<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
		<link rel="stylesheet" href="/resources/css/style.css" media="screen">
 	 
 	 
 	 
 	 <style>
		body {
		padding-top : 70px;
		clear: none;
		
		}
		
		header {
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 9;
	    padding: 0.7rem;
	    width: 100%;
	    /* background-color: rgba(255, 255, 255, 0.97);
	    -webkit-box-shadow: 0 1px 0 rgb(0 0 0 / 10%);
	    -moz-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
	    box-shadow: 0 1px 0 rgb(0 0 0 / 10%); */
		}
		
		header.transparent {
    		background-color: #23242b;
		    -webkit-box-shadow: none;
		    -moz-box-shadow: none;
 	   		box-shadow: none;
		}
		.thumbnail {
			    display: flex;
			    height: 100%;
			    justify-content: flex-start;
		    	align-items: center;
		    	flex-direction: column;
		}
		
		.thumbnail img { 
			min-height:200px; height:150px;
		 }     
		 
		 div {
		 	clear: none;
		 }
	
	</style>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
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
	
	//���� ����¡
	var currentPage = 1;
	$(window).scroll(function() {
		var maxHeight = $(document).height();
		var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
		
		if(currentScroll >= maxHeight) {
			
			currentPage++;
			
			$("input[name='currentPage']").val(currentPage);
			
			var searchCondition = $("option:selected").val();
			var searchKeyword = $("input[name='searchKeyword']").val();
			
			alert(searchCondiiton);
			alert(searchKeyword);
			
			$.ajax({
				url : "/clubRest/json/getClubList" ,
				type : "post" ,
				dataType : "json" ,
				data : JSON.stringify({
					currentPage : currentPage,
					searchCondition : searchCondition,
					searchKeyword : searchKeyword
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function( JSONData, status) {
					alert(status);
					
					console.log(JSONData.search);
					console.log(JSONData.clubPostList);
				} // end of success
			}); // end of ajax
		} // end of if
	}); // end of scroll
	
	
	
	
	</script>	
</head>

<body class="page">

   <header role="banner" class="transparent light">
      <div class="row">
         <div
            class="nav-inner row-content buffer-left buffer-right even clear-after">
            <div id="brand">
               <h1 class="reset">
                  <!--<img src="img/logo.png" alt="logo">-->
                  <a href="/main.jsp">Link</a>
               </h1>
            </div>
            <!-- brand -->
            <a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
            <nav>
               <ul class="reset" role="navigation">
                  <li class="menu-item"><a href="/main.jsp">Home</a></li>
                  <li class="menu-item"><a href="/feed/getFeedList">Feed</a></li>
                  <li class="menu-item"><a href="/">Live</a></li>
                  <li class="menu-item"><a href="/club/getClubList">Club</a></li>
                  <li class="menu-item"><a
                     href="/myHome/getMyHome?userId=${sessionScope.user.userId}">MyHome</a></li>
                  <li class="menu-item"><a
                     href="/serviceCenter/serviceCenterHome.jsp">ServiceCenter</a></li>
                  <c:if test="${ empty sessionScope.user }">
                     <li class="menu-item"><a href="/user/login">�α���</a></li>
                     <li class="menu-item"><a href="/user/addUser">ȸ������</a></li>
                  </c:if>
                  <c:if test="${!empty sessionScope.user }">
                     <li class="menu-item"><a
                        href="/user/logout?userId=${user.userId}">�α׾ƿ�</a></li>
                     <c:if test="${fn:trim(sessionScope.user.role) == '0' }">
                        <li class="menu-item"><a
                           href="/user/getUser?userId=${user.userId}">����������</a></li>
                     </c:if>
                     <c:if test="${fn:trim(sessionScope.user.role) == '1' }">
                        <li class="menu-item"><a href="/user/getUserList">������������</a></li>
                     </c:if>
                  </c:if>
               </ul>
            </nav>
         </div>
         <!-- row-content -->
      </div>
      <!-- row -->
   </header>




<body class="blog masonry-style">


	<main role="main">
		
			<div id="intro-wrap" data-height="27.778">
				<div id="intro" class="preload darken">
					<div class="intro-item"
						style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB LIST</h2>
							<p>The meeting is waiting for you.. </p>
						</div>
						<!-- caption -->
					</div>
					<!-- intro -->
				</div>
				<!-- intro -->
			</div>
		
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div id="main" class="row">
	    
		    
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
				  
				  <div class="form-group">
				  <button type="button" class="btn btn-default">�˻�</button>
				  <button type="button" class="btn btn-primary">������Ȳ����Ʈ</button>
				  </div>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
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
       
		<div id="main" class="row">
		
		${clubList}
		  <c:forEach var="i" items="${clubList}">
			<div class="col-xs-4 col-md-4">
			<div class="thumbnail" style="">
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
		</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	</main>

	
</body>

</html>