<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>중고장터 아이템 추가 페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- css/cdn links -->
<jsp:include page="market_link.jsp" />

</head>
<body>
	<div id="colorlib-page">

		<!-- navbar -->
		<jsp:include page="market_nav.jsp"></jsp:include>

		<div class="mt-5">
			<!-- header -->
			<jsp:include page="market_header.jsp"></jsp:include>

			<section class="ftco-section mb-5">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 ftco-animate">
							<div class="comment-form-wrap pt-5">
								<h2 class="mb-3 font-weight-bold">ITEMS TABLE</h2>
								<table>
									<tr>
										<th></th>
									</tr>
									<tr>
										
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- footer -->
			<jsp:include page="market_footer.jsp"></jsp:include>

		</div>
		<!-- END COLORLIB-MAIN -->
	</div>

<!-- 	<!-- loader --> -->
<!-- 	<div id="ftco-loader" class="show fullscreen"> -->
<!-- 		<svg class="circular" width="48px" height="48px"> -->
<%-- 			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> --%>
<%-- 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /> --%>
<!-- 		</svg> -->
<!-- 	</div> -->


	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/vendor/jquery/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/vendor/jquery/jquery.waypoints.min.js"></script>
	<script src="${contextPath}/vendor/jquery/jquery.stellar.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="${contextPath}/vendor/jquery/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/scrollax.min.js"></script>
	<script src="../js/main.js"></script>
</body>
</html>