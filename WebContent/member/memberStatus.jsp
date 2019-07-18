<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
					<div class="p-5 background raised-box rounded">
						<div class="m-auto">
				            <div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
				                <span class="text-muted text-uppercase">
				                <c:choose>
				                	<c:when test="${requestScope.currentPage eq '사용현황' }">USAGE </c:when>
				                	<c:otherwise>RESERVATION </c:otherwise>
				                </c:choose>
				                STATUS</span>
				                <h2 class="display-4"><c:out value="${requestScope.currentPage }"/></h2>
							</div>
						</div>
						<div class="card mb-3">
							<div class="card-header">
								<i class="fas fa-table"></i><c:out value="${requestScope.currentPage }"/>표 
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<c:choose>
										<c:when test="${requestScope.currentPage eq '사용내역' }">
										<thead>
											<tr>
												<th>상태</th>
												<th>물품ID</th>
												<th>창고번호</th>
												<th>시작일</th>
												<th>종료일</th>
												<th>실수령일</th>
												<th>이용금액</th>
												<th>상품가치</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach  var="adto" items="${list}">
											<tr>
												<td><c:out value="${adto.state}"/></td>
												<td><c:out value="${adto.item}"/></td>
												<td><c:out value="${adto.house}"/></td>
												<td><fmt:formatDate value="${adto.start_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
												<td><fmt:formatDate value="${adto.end_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
												<td><fmt:formatDate value="${adto.return_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
												<td><fmt:formatNumber value="${adto.payment}" type="currency" currencySymbol="￦"/></td>
												<td><fmt:formatNumber value="${adto.item_price}" type="currency" currencySymbol="￦"/></td>
											</tr>
										</c:forEach>
										</tbody>
										</c:when>
										<c:when test="${requestScope.currentPage eq '예약현황' }">
										<thead>
											<tr>
												<th>상태</th>
												<th>물품ID</th>
												<th>창고번호</th>
												<th>예약일</th>
												<th>시작일</th>
												<th>종료일</th>
												<th>이용금액</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="mdto" items="${list}" >
											<tr data-toggle="modal" data-target="#detailModal" data-cate="member" data-house="" data-email="${mdto.email}">
												<td><c:out value="${adto.state}"/></td>
												<td><c:out value="${adto.item}"/></td>
												<td><c:out value="${adto.house}"/></td>
												<td><fmt:formatDate value="${adto.res_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
												<td><fmt:formatDate value="${adto.start_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
												<td><fmt:formatDate value="${adto.end_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
												<td><fmt:formatNumber value="${adto.payment}" type="currency" currencySymbol="￦"/></td>
											</tr>
										</c:forEach>
										</tbody>
										</c:when>
									</c:choose>
									</table>
								</div>
							</div>
						</div>
					</div>
</body>
</html>