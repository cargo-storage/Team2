<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 페이지 메인</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Custom fonts for this template-->
<link href="${contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/vendor/datatables/select.bootstrap4.min.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${contextPath}/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

	<%@include file="Top.jsp"%>
	<div id="content-wrapper">

		<div class="container-fluid">
			<!-- Breadcrumbs-->
	        <ol class="breadcrumb">
	          <li>현재 페이지 :&nbsp;&nbsp;&nbsp;</li>
	          <li class="breadcrumb-item active">
	            <a href="#">관리자 종합 메뉴</a>
	          </li>
	        </ol>

			<!-- Icon Cards-->
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-comments"></i>
							</div>
							<div class="mr-5">문의사항</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-list"></i>
							</div>
							<div class="mr-5">창고 현황 관리</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="${contextPath}/ad/listTables?category=items">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-shopping-cart"></i>
							</div>
							<div class="mr-5">예약 내역 관리</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="${contextPath}/ad/listTables?category=reservation">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-life-ring"></i>
							</div>
							<div class="mr-5">회원 정보 관리</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="${contextPath}/ad/member_admin">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
			</div>

			<!-- DataTables Example -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 모든 기록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>상태</th>
									<th>이름</th>
									<th>휴대전화</th>
									<th>이메일</th>
									<th>물품ID</th>
									<th>창고번호</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>이용금액</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>상태</th>
									<th>이름</th>
									<th>휴대전화</th>
									<th>이메일</th>
									<th>물품ID</th>
									<th>창고번호</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>이용금액</th>
								</tr>
							</tfoot>
							<tbody>
							<c:forEach items="${list}" var="adto">
								<tr data-toggle="modal" data-target="#detailModal" data-cate="${adto.state}" data-house="${odto.house}" data-email="${odto.email}">
									<td><c:out value="${adto.state}"/></td>
									<td><c:out value="${adto.name}"/></td>
									<td><c:out value="${adto.phone}"/></td>
									<td><c:out value="${adto.email}"/></td>
									<td><c:out value="${adto.item}"/></td>
									<td><c:out value="${adto.house}"/></td>
									<td><fmt:formatDate value="${adto.start_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatDate value="${adto.end_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatNumber value="${adto.payment}" type="currency" currencySymbol="￦"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">
					Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="full" timeStyle="short"/>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Your Website 2019</span>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="${contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${contextPath}/js/sb-admin.js"></script>

	<!-- Demo scripts for this page-->
	<script src="${contextPath}/js/datatables-custom.js"></script>
</body>

</html>
