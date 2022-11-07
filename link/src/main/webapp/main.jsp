<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	/* BOOTSTRAP & TEMPLATE CLASH */

	.row {

		margin-left: 0px !important;

	}
	
	/* BOOTSTRAP & TEMPLATE CLASH */
</style>

</head>

<body>
	<jsp:include page="/toolbar.jsp" />

	<main role="main">
		<section class="row section">
			<div class="container">
				
				<img src="/resources/image/uploadFiles/" alt="...">
							
			</div>
		</section>
	</main>

	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
</body>

</html>