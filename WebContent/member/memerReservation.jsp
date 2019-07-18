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
				                <span class="text-muted text-uppercase">Usage Status</span>
				                <h2 class="display-4">예약 현황</h2>
							</div>
						</div>
						<div class="card mb-3">
							<div class="card-header">
								<i class="fas fa-table"></i> 예약현황 현황표 
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
						</div>
					</div>

</body>
</html>