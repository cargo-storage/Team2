<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("utf-8"); %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<script type="text/javascript">
	
		function showHouse(warehouse){
			location.href = "${contextPath}/reserve/info.do?warehouse="+warehouse;
		}
		
		function showInfo(btn){
			var houseName = btn.value;
			$.ajax({
				type : 'POST',
				url  : '${contextPath}/reserve/moreInfo',
				data: {house: houseName}, 	
				success: function(data, textStatus){
					var jsonInfo = JSON.parse(data);
					var resInfo = "예약정보<br>"
					for(var i in jsonInfo.reservations){
						resInfo += jsonInfo.reservations[i].house+"<br>";
						resInfo += jsonInfo.reservations[i].start_day+"<br>";
						resInfo += jsonInfo.reservations[i].end_day+"<br>";
					}
					$("#info").html(resInfo);
				},
				error: function(data, textStatus){
					alert("ERROR!!");
				}
			});
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

<body class="bg-light">

<!--navigation in page-->
		
	<nav class="navbar navbar-expand-md navbar-transparent fixed-top sticky-navigation navbar-light bg-white shadow-bottom" id="lambda-navbar">
       <a class="navbar-brand" href="/Team2/index.jsp">
           TEAM2 WAREHOUSE
       </a>
       <button class="navbar-toggler navbar-toggler-right border-0 collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
           <line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
       </button>
       <div class="navbar-collapse collapse" id="navbarCollapse" style="">
           <ul class="navbar-nav ml-auto">
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#company">회사소개</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#houseinfo">이용안내</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="${contextPath }/reserve/info.do?warehouse=A">예약안내</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#market">중고장터</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#faq">FAQ</a>
               </li>
           </ul>
           <form class="form-inline">
               <a href="#signup" class="btn btn-navbar page-scroll btn-primary">로그인/회원가입</a>
           </form>
       </div>
	</nav>
        
	<section class="py-7 bg-light" id="company">
		<div class="container">
			<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">예약안내</h2>
	                <p class="lead">원하는 공간을 선택하세요!</p>
	            </div>
			</div>
			<div class="p-5 mt-5 bg-white raised-box rounded">
			
	            <select class="form-control col-md-3" onchange="showHouse(this.value)">
					<option value="A" <c:if test="${param.warehouse == 'A'}">selected="selected"</c:if>>House A</option>
					<option value="B" <c:if test="${param.warehouse == 'B'}">selected="selected"</c:if>>House B</option>
					<option value="C" <c:if test="${param.warehouse == 'C'}">selected="selected"</c:if>>House C</option>
					<option value="D" <c:if test="${param.warehouse == 'D'}">selected="selected"</c:if>>House D</option>
				</select>

				<div class="row pl-3 py-2 my-3">
				<table>
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
				<div id="info" class="ml-6 col-md-5 text-center" style="border: 1px solid #000000; width: 100px;">
				</div>
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