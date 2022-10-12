<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
	
	<title>Feed</title>
	<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
	<link rel="stylesheet" href="/resources/css/style.css" media="screen">
	
	<link rel="apple-touch-icon" href="/resources/image/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/image/apple-touch-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/resources/image/apple-touch-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/resources/image/apple-touch-icon-152x152.png">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
	<script type="text/javascript">
		
	
	
	/* 
	
	
	
	��ư Ȯ��
	
	<input type="button" id="update" value="����">
	<input type="button" id="delete" value="����"> 
		
	
	
	*/
	
	
	
	$(function(){
		
		<!-- REST CONTROLLTER TEST -->
		$(".btn_jsonTest").bind("click", function(){
			
			$.ajax(
					{
						url : "/feedRest/json/getFeedList",
						method : "POST",
						data : JSON.stringify ({
							currentPage : 1
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							swal.fire("��?");
							
							var value = "";
							
							$.each(data, function(index, item) {
								value += item.content + " // ";
							}); // $.each close
							
							$("#test").text(value);
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close

		}); // btn_jsonTest close
		<!-- REST CONTROLLTER TEST -->
		
		<!-- ADD_FEED -->
		$(".addFeed").bind("click", function(){
			alert("�ǵ� �߰���ư");
			$(this.form).attr("method", "POST").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
		});
		<!-- ADD_FEED -->
		
		<!-- UPDATE_FEED -->
		$(".btn_update").bind("click", function(){
			alert("�ǵ� ���� ��ư");
			$(this.form).attr("method", "GET").attr("action", "/feed/updateFeed").submit();
		});
		<!-- UPDATE_FEED -->
		
		<!-- DELETE_FEED -->
		$(".btn_delete").bind("click", function(){
			alert("�ǵ� ���� ��ư");
			$(this.form).attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
		});
		<!-- DELETE_FEED -->
		
		<!-- GET_FEED -->
		$(".btn_getFeed").bind("click", function(){
			alert("Ŭ���� �� ��ȣ : " + $(this).parent().find("input[name='feedNo']").val());
			location.href="/feed/getFeed?feedNo=" + $(this).parents(".feedForm").find("input[name='feedNo']").val();
		})
		<!-- GET_FEED -->
		
		<!-- ADD_FEED_HEART -->
		$(".like:contains('���ƿ�')").bind("click", function(){
			event.stopPropagation();
			alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "�� �� ���ƿ�");
			
			var html = $(this);
			
			$.ajax(
					{
						url : "/feedRest/json/addFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							feedNo : $(this).parents(".feedForm").children("input[name='feedNo']").val()
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							swal.fire("�ǵ� ���ƿ� ���� : " + data);
							
							$(html).parents(".row").children(".like:contains('���ƿ�')").hide();
							$(html).parents(".row").children(".dislike:contains('�÷���')").show();
							$(html).parents(".row").children(".likeCount").text(data);
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<!-- ADD_FEED_HEART -->
		
		<!-- DELETE_FEED_HEART -->
		$(".dislike:contains('�÷���')").bind("click", function(){
			event.stopPropagation();
			alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "�� �� �÷���");
			
			var html = $(this);
			
			$.ajax(
					{
						url : "/feedRest/json/deleteFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							feedNo : $(this).parents(".feedForm").children("input[name='feedNo']").val()
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							swal.fire("�ǵ� �÷��� ���� : " + data);
							
							$(html).parents(".row").children(".like:contains('���ƿ�')").show();
							$(html).parents(".row").children(".dislike:contains('�÷���')").hide();
							$(html).parents(".row").children(".likeCount").text(data);
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<!-- DELETE_FEED_HEART -->
		
	})
	
	
	
	</script>

<!------------------------------ CSS ------------------------------>

<style type="text/css">

	textarea {
		width: 100%;
		height: 6.25em;
		border-style: solid;
		border-color: black;
		resize: none;
	}

	@
	-ms-viewport {
		width: device-width;
	}
	
</style>

<!------------------------------ CSS ------------------------------>


	
</head>

<body>
	<header role="banner" class="transparent light">
		<div class="row">
			<div
				class="nav-inner row-content buffer-left buffer-right even clear-after">
				<div id="brand">
					<h1 class="reset">
						<!--<img src="img/logo.png" alt="logo">-->
						<a href="../main.jsp">Beetle</a>
					</h1>
				</div>
				<!-- brand -->
				<a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
				<nav>
					<ul class="reset" role="navigation">
						<li class="menu-item"><a href="../main.jsp">Home</a></li>
						<li class="menu-item"><a href="/feed/getFeedList">Feed</a></li>
						<li class="menu-item"><a href="/">Live</a></li>
						<li class="menu-item"><a href="/club/getClubList">Club</a></li>
						<li class="menu-item"><a href="/myHome/getMyHome?userId=${user.userId}">MyHome</a></li>
						<li class="menu-item"><a href="/serviceCenter/serviceCenterHome.jsp">ServiceCenter</a></li>
						<li class="menu-item"><a href="/user/login">Login</a></li>
						<li class="menu-item"><a href="/user/addUser">Join</a></li>
						<li class="menu-item"><a href="/user/logout?userId=${user.userId}">�α׾ƿ�</a></li>
						<li class="menu-item"><a href="/user/getUser?userId=${user.userId}">����������</a></li>
					</ul>
				</nav>
			</div>
			<!-- row-content -->
		</div>
		<!-- row -->
	</header>

	<main role="main">

		<div id="main">

			<section class="row section">
				<div class="row-content buffer even clear-after">
					<div class="column three">
						<a href="/feed/getFestivalLocation.jsp">��ã��</a>
					</div>
					
					<div class="column six">
						<div class="addFeedForm">
							<form id="addForm">

								<c:if test="${!empty sessionScope.user}">
								
									������ ���� : ${sessionScope.user.profileImage}
									�ۼ��� : ${sessionScope.user.nickName}
						
									<textarea name="content" placeholder="���� �Ϸ�� �����?"></textarea>
									<button type="button" class="addFeed">���</button>

								</c:if>

								<!-- REST CONTROLLTER TEST -->
								<button type="button" class="btn_jsonTest">������ �׽�Ʈ</button>
								<p id="test">REST CONTROLLTER TEST</p>
								<!-- REST CONTROLLTER TEST -->

							</form>
						</div>


						<c:set var="i" value="0"></c:set>
						<c:forEach var="feed" items="${feedList}">
							<c:set var="i" value="${i + 1}"></c:set>

							<c:if test="${fn:trim(feed.deleteCondition) eq '0'}">

								<div class="showFeedForm" style="border: 1px solid gray; width: 500px; padding: 5px; margin-top: 5px;">
									<form class="feedForm">

										${feed.feedNo}��°�� 
										[������ ���� : ${feed.user.profileImage}]
										[�ۼ��� :	${feed.user.userId}] 
										
										<br /> <br />
										${feed.content} 
										<br />
										
										<c:if test="${!empty feed.hashtag}"><br />${feed.hashtag}</c:if>
										
										<br />

										<c:if test="${feed.checkHeart != 0}">
										�ڡڡڳ��� ���ƿ� �� �ǵ��Դϴ�.�ڡڡ� ���߿� ��Ʈ�� ����
										</c:if>

										<c:if test="${sessionScope.user.userId eq feed.user.userId}">
											<input type="button" class="btn_update" value="����">
											<input type="button" class="btn_delete" value="����">
										</c:if>

										<input type="button" class="btn_getFeed" value="����">
										<input type="hidden" name="feedNo" value="${feed.feedNo}">

										<section class="row section">
											<div class="row">
												<c:if test="${feed.checkHeart == 0}">
													<div class="column two like" style="display: show;">
														���ƿ�
													</div>
													<div class="column two dislike" style="display: none;">
														�÷���
													</div>
												</c:if>
												<c:if test="${feed.checkHeart != 0}">
													<div class="column two like" style="display: none;">
														���ƿ�
													</div>
													<div class="column two dislike" style="display: show;">
														�÷��� 
													</div>
												</c:if>
												
												<div class="column two likeCount">
													${feed.heartCount}
												</div>
												
												<div class="column two comment">��ۼ�</div>
												
												<div class="column two commentCount">
													 ${feed.commentCount}
												</div>
													
												<div class="column four last">�Ű�</div>
											</div>
										</section>

									</form>

								</div>

							</c:if>
						</c:forEach>


					</div>

					<div class="column three"></div>

				</div>

			</section>

		</div>

	</main>

</body>
</html>
