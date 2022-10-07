<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("a:contains('ȸ������')").on("click", function() {
			self.location = "/user/addUser"
		});
	});
	
	$(function() {
		$("a:contains('�α���')").on("click", function() {
			self.location = "/user/login"
		});
	});
	
	$(function() {
		$("a:contains('�α׾ƿ�')").on("click", function() {
			self.location = "/user/logout"
		})
	})
	
	$(function() {
		$("a:contains('����������')").on("click", function() {
			
		self.location = "/user/getUser?userId=${user.userId}"
		
		});
	});
	
/*	�Ʒ�������� �׺���̼� ��� ����
	$(function() {
		$("span:contains('�ǵ�')").on("click", function() {
			self.location = "/user/login"
		});
	});
	*/
</script>

<div class="navbar  navbar-inverse navbar-fixed-top">

	<div class="container">

		<a class="navbar-brand" href="/mian.jsp">Link</a>

		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#target">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<!-- toolBar Button End //////////////////////// -->

		<!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target"
			data-hover="dropdown"
			data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">

			<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
			<ul class="nav navbar-nav">

				<!--  ȸ������ DrowDown -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>�ǵ�</span>
							<span class="caret"></span>
					</a>

				<!-- �ǸŻ�ǰ���� DrowDown  -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>Live</span>
							<span class="caret"></span>
					</a>

				<!-- ���Ű��� DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>����Ȩ��</span>
						<span class="caret"></span>
				</a>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>������</span>
						<span class="caret"></span>
				</a>

			</ul>

			<c:if test="${! empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">����������</a></li>
					<li><a href="#">�α׾ƿ�</a></li>
				</ul>
			</c:if>

			<c:if test="${ empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">�α���</a></li>
					<li><a href="#">ȸ������</a></li>
				</ul>
			</c:if>
		</div>
		<!-- dropdown hover END -->

	</div>
</div>
