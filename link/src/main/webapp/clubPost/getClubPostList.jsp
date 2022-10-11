<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- alertâ CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button:contains('�Խù� ����ϱ�')").bind("click", function() {
			//swal.fire("���̵� �Է��ϼž� �մϴ�.");
			//self.location = "/clubPost/addClubPostView?clubNo=2";
			location.href = "/clubPost/addClubPostView?clubNo=2";
		});
		$("b:contains('�ֽż�')").bind("click", function() {
			location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=0";
		});
		$("b:contains('�����ȼ�')").bind("click", function() {
			location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=1";
		});
		$("b:contains('���ƿ� ������')").bind("click", function() {
			location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=2";
		});
		$("b:contains('���� �ۼ��� �Խù�')").bind("click", function() {
			location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=3";
		});
		$("button:contains('�˻�')").bind("click", function() {
			$("input[name='currentPage']").val("1");
			$("form").submit();
		});
		
		var currentPage = 1;
		$(window).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
			
			if(currentScroll >= maxHeight) {
				
				currentPage++;
				//alert(currentPage);
				$("input[name='currentPage']").val(currentPage);
				
				var clubNo = "2";
				var searchCondition = $("option:selected").val();
				var searchKeyword = $("input[name='searchKeyword']").val();
				var order = $("input[name='order']").val();
				
				//alert(searchCondition);
				//alert(searchKeyword);
				//alert(order);
				
				$.ajax({
					url : "/clubPostRest/json/getClubPostList",
					type : "post",
					dataType : "json",
					data : JSON.stringify({
						pageUnit : clubNo,
						currentPage : currentPage,
						searchCondition : searchCondition,
						searchKeyword : searchKeyword,
						order : order
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function( JSONData, status ) {
						alert(status);
						
						console.log(JSONData.search);
						console.log(JSONData.clubPostListCount);
						console.log(JSONData.clubPostList);
					}// end of success
				});// end of ajax				
			}// end of if			
		}); // end of scroll
		
		
		
	});// end of function()
	
	//����� Ŭ���� �󼼻�ǰ��ȸ ������ or ��ǰ���� �������� �̵�
	function getClubPostGo(clubPostNo){
		location.href = "/clubPost/getClubPost?clubPostNo="+clubPostNo;
	}
</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="contains">
	<hr/><hr/><hr/>
	
		<div class="page-header text-info">
	       <h3>���ӰԽù�����Ʈ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${ map.clubPostListCount } �Ǽ�, ���� ${resultPage.currentPage} ������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>�ֽż�</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>�����ȼ�</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>���ƿ� ������</b>&nbsp;&nbsp;/&nbsp;&nbsp;
					<b>���� �ۼ��� �Խù�</b>	&nbsp;&nbsp;&nbsp;
					<a href="/clubPost/addPay">����</a>
					<!-- <a href="/clubPost/getClubNoticeList">���Ӱ�������</a> -->
					<button type="button" class="btn btn-default">�Խù� ����ϱ�</button>
		    	</p>
		    </div>
		    
			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm" action="/clubPost/getClubPostList" method="post">
			 
			<div class="form-group">
				<select class="form-control" name="searchCondition" >
					<option value="0"  ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>���̵�</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>����</option>
				</select>
			</div>
			 
			<div class="form-group">
				<label class="sr-only" for="searchKeyword">�˻���</label>
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���" value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }"  >
			</div>
			
			<button type="button" class="btn btn-default">�˻�</button>
			
			<!-- PageNavigation ���� ������ ���� ������ �κ� -->
			<input type="hidden" name="currentPage" value=""/>
			<input type="hidden" name="order" value="${ search.order }">
			  
			</form>
			</div>
	    	
		</div>		
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	
 	<!-- ����Ϸ� list display start -->
	<div class="contains" id="container">
		<c:set var="i" value="${ clubPostList }"></c:set>
		<c:if test="${ clubPostListCount > 0}">
		<c:forEach var="i" begin="0" end="${ fn:length(clubPostList) - 1 }" step="1">
			<div class="col-md-4">
				<a href="javascript:getClubPostGo('${ clubPostList[i].clubPostNo }')">
					<img src="/images/uploadFiles/${ uploadList[i] }" height="350" width="350">
				</a>
				<p align="center" style="font-size: 30px">${ clubPostList[i].clubPostNo }</p>
				<p align="center" style="font-size: 20px">���� : ${ clubPostList[i].clubPostTitle }</p>
				<p align="center" style="font-size: 20px">���ƿ� �� : ${ clubPostList[i].clubPostHeartCount }</p>
				<p align="center" style="font-size: 20px; color: red;">�ۼ��� ���̵� : ${ clubPostList[i].user.userId }</p>
				<p align="center" style="font-size: 20px; color: red;">�ۼ��� �г��� : ${ clubPostList[i].user.nickName }</p>
				<p align="center" style="font-size: 20px; color: red;">�ۼ��� �������̹��� : ${ clubPostList[i].user.profileImage }</p>
			</div>
		</c:forEach>
		</c:if>
	</div> 	
	<!-- ����Ϸ� list display end -->


	
</body>
</html>

