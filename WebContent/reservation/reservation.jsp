<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("utf-8"); %>  

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>TEAM2 WAREHOUSE RESERVATION</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<!--Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	
	<!--vendors styles-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
	
	<!-- Bootstrap CSS / Color Scheme -->
	<link rel="stylesheet" href="${contextPath }/css/default.css" id="theme-color">
	<!-- font-awesome CSS -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	
	<c:choose>   
		<c:when test="${sessionScope.email==null }">
			<script type="text/javascript">
				alert("로그인 후 이용 가능합니다.");
				history.back();
			</script>
		</c:when>
	</c:choose>

	<script type="text/javascript">
	
		function showHouse(warehouse){
			location.href = "${contextPath}/re/info.me?warehouse="+warehouse;
		}
		
		function showInfo(btn){
			var houseName = btn.value;
			$.ajax({
				type : 'POST',
				url  : '${contextPath}/re/moreInfo.me',
				data: {house: houseName}, 
				
				success: function(data, textStatus){
					var jsonInfo = JSON.parse(data);
					var currRes = "";								
					for(var i in jsonInfo.reservations){
						currRes += jsonInfo.reservations[i].start_day+"~";
						currRes += jsonInfo.reservations[i].end_day+"<br>";
					}
					$("#houseName").html(houseName);
					if(currRes=="")	$("#currRes").html("현재 비어있는 공간입니다.<br><br>");
					else $("#currRes").html(currRes+"<br>");
					
				},
				error: function(data, textStatus){
					alert("ERROR!!");
				}
			});
		}
		
		function goReservation(){
			var houseName = $('#houseName').text();
			if(houseName=='WAREHOUSE'){
				alert("예약하실 공간을 선택하세요.");
			}else{
				var go = confirm(houseName+"을 예약하시겠습니까?");
				
				if(go==true)	location.href='${contextPath}/re/reservePro.me?house='+houseName;
				else 			return false;
			}
			
			
		}
	</script>
	
	<style type="text/css">

	.button{
		width: 5.5em;
		height: 5.5em;
		border: 0;
	}
	.notEmpty{
		background-color: #ff3333;
	}
	
	#houseinfo{
		height:100%;
	}

	</style>

</head>

<body>

<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
        
	<section class="py-7 bg-light">
		<div class="container">
		
			<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">예약안내</h2>
	                <p class="lead">원하는 공간을 선택하세요!</p>
	            </div>
			</div>
			
			<div class="row p-5 mt-5 bg-white raised-box rounded">
				
				<div class="mx-auto">
	            <select class="form-control col-md-6" onchange="showHouse(this.value)">
					<option value="A" <c:if test="${param.warehouse == 'A'}">selected="selected"</c:if>>House A</option>
					<option value="B" <c:if test="${param.warehouse == 'B'}">selected="selected"</c:if>>House B</option>
					<option value="C" <c:if test="${param.warehouse == 'C'}">selected="selected"</c:if>>House C</option>
					<option value="D" <c:if test="${param.warehouse == 'D'}">selected="selected"</c:if>>House D</option>
				</select>
				<!-- 창고 사용 현황 테이블 -->
				<table class="my-3 col-lg-5">
				<c:choose>
					<c:when test="${requestScope.hList == null }"><tr><td colspan="5">nothing</td></tr></c:when>
					<c:when test="${hList !=null }">
						<c:set var="i" value="0"/>
						<c:forEach var="hDTO" items="${hList }">
							<c:if test="${i%5==0}">
								<tr>
							</c:if>
							<c:choose>
								<c:when test="${hDTO.isEmpty==1 }">
									<td>
										<input type="button" value="${hDTO.house }" class="button notEmpty" onclick="showInfo(this)">
									</td>
								</c:when>
								<c:when test="${hDTO.isEmpty==0 }">
									<td><input type="button" value="${hDTO.house }" class="button" onclick="showInfo(this)"></td>
								</c:when>
							</c:choose>
							<c:set var="i" value="${i+1 }"/>
						</c:forEach>
					</c:when>
				</c:choose>
				</table>
				</div>
				
				<!-- 예약정보 표시 영역 -->
				<div id="info" class="col-lg-5 text-center mx-auto mt-5">
					<ul class="list-group mb-3">
						<li class="list-group-item">
						  <div>
						    <h4 id="houseName" class="my-0">WAREHOUSE</h4>
						  </div>
						  <span id="houseFee" class="text-muted"></span>
						</li>
						<li class="list-group-item">
				          <div>
				            <h6 class="my-0">현재 사용현황 및 예약정보</h6><br>
				            <span class="text-muted" id="currRes">확인하고자 하는 공간을 선택 해 주세요.</span>
				          </div>
				        </li>
						<li class="list-group-item">
						  <button class="btn d-block m-auto btn-primary col-5" onclick="goReservation()">예약하기</button>
						  <small class="text-muted">예약은 비어있는 날짜에 한해 최소 15일부터 가능합니다.</small>
						</li>
					</ul>
				</div>
				
				
			</div>
		</div>
	</section>
		


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
</body>
</html>