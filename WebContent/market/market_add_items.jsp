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
<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/vendor/datatables/select.bootstrap4.min.css" rel="stylesheet">

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
								<form method="post" action="${contextPath}/mk/add_item.do">
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
									<tfoot>
										<tr>
											<td><input type="submit" class="btn-lg btn-success" value="입력" onclick="addItem();"></td>
											<td><input type="text" name="name" id="name" class="form-control" placeholder="이름"></td>
											<td><input type="text" name="price" id="price" class="form-control" placeholder="가격" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
											<td>
												<select class="custom-select-lg" name="category" id="category">
												  <option value="fur">가구</option>
												  <option value="mat">공구</option>
												  <option value="elec">전자제품</option>
												  <option selected value="oth">기타</option>
												</select>
											</td>
											<td><input type="text" name="stock" id="stock" class="form-control" placeholder="재고" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
										</tr>
									</tfoot>
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
	<script src="${contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript">
	function addItem() {
		var price = $("#price").val();
		var name = $("#name").val();
		var category = $("#category").val();
		var stock = $("#stock").val();
		
		if(price==''){
			alert("가격을 입력하세요");
			return false;
		}else if(name==''){
			alert("이름을 입력하세요");
			return false;
		}else if(stock==''){
			alert("재고를 입력하세요");
			return false;
		}
	}

	$(document).ready(function() {
		//Call the dataTables jQuery plugin
		var table = $('#dataTable').DataTable();
		  
		$('#dataTable tbody').on( 'click', 'tr', function () {
		    if ( $(this).hasClass('selected') ) {
		        $(this).removeClass('selected');
		    }
		    else {
		        table.$('tr.selected').removeClass('selected');
		        $(this).addClass('selected');
		    }
		});//table tr 클릭시 강조
	});
	</script>
</body>
</html>