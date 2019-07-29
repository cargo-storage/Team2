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
								<form method="post">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th>물품ID</th>
											<th>이름</th>
											<th>가격</th>
											<th>카테고리</th>
											<th>재고</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>물품ID</th>
											<th>이름</th>
											<th>가격</th>
											<th>카테고리</th>
											<th>재고</th>
										</tr>
									</tfoot>
									<tbody>
									<c:forEach var="idto" items="${list}">
										<tr>
											<td>${idto.item}</td>
											<td>${idto.name}</td>
											<td>${idto.price}</td>
											<td>${idto.category}</td>
											<td>${idto.stock}</td>
										</tr>
									</c:forEach>
									</tbody>
									<tbody>
										<tr>
											<td><input type="button" class="btn-lg btn-success" value="입력"></td>
											<td><input type="text" name="name" class="form-control" placeholder="이름"></td>
											<td><input type="text" name="price" class="form-control" placeholder="가격"></td>
											<td>
												<select class="custom-select-lg" name="category">
												  <option value="fur">가구</option>
												  <option value="mat">공구</option>
												  <option value="elec">전자제품</option>
												  <option selected value="oth">기타</option>
												</select>
											</td>
											<td><input type="text" name="stock" class="form-control" placeholder="재고"></td>
										</tr>
									</tbody>
								</table>
								</form>
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
	
	<jsp:include page="market_link_js.jsp"/>
</body>
</html>