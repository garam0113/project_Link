<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function YesScroll () {
		const pagination = document.querySelector('#paginaiton'); // ���������̼� ����ȹ��
		const fullContent = document.querySelector('.row'); // ��ü�� �ѷ��� ������ ����ȹ��
		const screenHeight = screen.height; // ȭ�� ũ��
		let oneTime = false; // ��ȸ�� �۷ι� ����
		document.addEventListener('scroll',OnScroll,{passive:true}) // ��ũ�� �̺�Ʈ�Լ�����
		 function OnScroll () { //��ũ�� �̺�Ʈ �Լ�
		   const fullHeight = fullContent.clientHeight; // infinite Ŭ������ ����   
		   const scrollPosition = pageYOffset; // ��ũ�� ��ġ
		   if (fullHeight-screenHeight/2 <= scrollPosition && !oneTime) { // ���� ��ü����-ȭ�����/2�� ��ũ�������Ǻ��� �۾����ٸ�, �׸��� oneTime ������ �����̶��
		     oneTime = true; // oneTime ������ true�� �������ְ�,
		     madeBox(); // �������� �߰��ϴ� �Լ��� �ҷ��´�.
		   }
		 }
		 }
</script>
</head>

<div class="container text-center">

	<nav>
		<!-- ũ������ :  pagination-lg pagination-sm-->
		<ul class="pagination">

			<!--  <<== ���� nav -->
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
				<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li>
			</c:if>
			<a href="javascript:fncGetUserList('${ resultPage.currentPage-1}')"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a>
			</li>

			<!--  �߾�  -->
			<c:forEach var="i" begin="${resultPage.beginUnitPage}"
				end="${resultPage.endUnitPage}" step="1">

				<c:if test="${ resultPage.currentPage == i }">
					<!--  ���� page ����ų��� : active -->
					<li class="active"><a
						href="javascript:fncGetUserList('${ i }');">${ i }<span
							class="sr-only">(current)</span></a></li>
				</c:if>

				<c:if test="${ resultPage.currentPage != i}">
					<li><a href="javascript:fncGetUserList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>

			<!--  ���� nav==>> -->
			<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li>
			</c:if>
			<a href="javascript:fncGetUserList('${resultPage.endUnitPage+1}')"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a>
			</li>
		</ul>
	</nav>

</div>



<div class="container">
	<nav>
		<ul class="pager">
			<li><a href="#">Previous</a></li>
			<li><a href="#">Next</a></li>
		</ul>
	</nav>
</div>


<div class="container">
	<nav>
		<ul class="pager">
			<li class="previous disabled"><a href="#"><span
					aria-hidden="true">&larr;</span> Older</a></li>
			<!-- <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>  -->
			<li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li>
		</ul>
	</nav>
</div>