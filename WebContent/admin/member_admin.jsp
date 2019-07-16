<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원 정보 관리</title>
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
				<li class="breadcrumb-item"><a href="${contextPath}/ad/admin_main">관리자 종합 메뉴</a></li>
				<li class="breadcrumb-item active">회원 정보 관리</li>
			</ol>

			<!-- DataTables -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 회원 정보  표 </div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>구분</th>
									<th>이름</th>
									<th>이메일</th>
									<th>연락처</th>
									<th>우편</th>
									<th>주소</th>
									<th>상세 주소</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>구분</th>
									<th>이름</th>
									<th>이메일</th>
									<th>연락처</th>
									<th>우편</th>
									<th>주소</th>
									<th>상세 주소</th>
									<th>가입일</th>
								</tr>
							</tfoot>
							<tbody>
							<c:forEach items="${list}" var="mdto">
								<tr data-toggle="modal" data-target="#detailModal" data-cate="member" data-house="" data-email="${mdto.email}">
								<c:choose>
									<c:when test="${mdto.admin ==1}"><td><c:out value="관리자"/></td></c:when>
									<c:otherwise><td><c:out value="고객"/></td></c:otherwise>
								</c:choose>
									<td><c:out value="${mdto.name}"/></td>
									<td><c:out value="${mdto.email}"/></td>
									<td><c:out value="${mdto.phone}"/></td>
									<td><c:out value="${mdto.postCode}"/></td>
									<td><c:out value="${mdto.roadAddr}"/></td>
									<td><c:out value="${mdto.detailAddr}"/></td>
									<td><fmt:formatDate value="${mdto.reg_date}" pattern="YYYY-MM-dd a hh:mm"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="full" timeStyle="short"/></div>
			</div>

			<p class="small text-center text-muted my-5">
				<em>More table examples coming soon...</em>
			</p>

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
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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