<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:choose>   
	<c:when test="${sessionScope.email==null }"><c:set var="mem_email" value="not_logined"/></c:when>
	<c:when test="${sessionScope.email!=null }"><c:set var="mem_email" value="${sessionScope.email }"/></c:when>
</c:choose>
<c:choose>
	<c:when test="${sessionScope.name==null }"><c:set var="mem_name" value="not_logined"/></c:when>
	<c:when test="${sessionScope.name !=null }"><c:set var="mem_name" value="${sessionScope.name }"/></c:when>
</c:choose>   
    

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lambda - Free Bootstrap 4 Multipurpose Landing Page Template</title>
        <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 

        <!--Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <!--vendors styles-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
	
		<!-- jQuery UI CSS파일 --> 
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>  
		<!-- jQuery 기본 js파일 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<!-- jQuery UI 라이브러리 js파일 -->
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
		
		
        <!-- Bootstrap CSS / Color Scheme -->
        <link rel="stylesheet" href="../css/default.css" id="theme-color">
        <!-- font-awesome CSS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		
		<style type="text/css">
			.table tr>td:not(.confirm){
				text-align: center;
			}
			.red{
				color: #ff3333;
			}
			.confirm{
				text-align: right;
			}
	
		</style>
 
</head>

<body class="bg-light">
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7 bg-light">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">예약확인</h2>
	                <p class="lead">성공적으로 예약되셨습니다!</p>
	            </div>
			</div>
		  
		  <div class="my-3 p-3 bg-white rounded shadow-sm">
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명</p></td>
			    		<td><input type="text" class="form-control" name="name" value="${param.name }(${param.email })" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">휴대전화</p></td>
			    		<td><input type="text" class="form-control" name="phone" value="${param.phone}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용하실 공간</p></td>
			    		<td><input type="text" class="form-control" name="house" value="${param.house }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약일</p></td>
			    		<td><input type="text" class="form-control" name="res_day" value="${param.res_day }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용기간</p></td>
			    		<td><input type="text" class="form-control" name="start_day" value="${param.start_day } ~ ${param.end_day } (총 ${param.totalDay })" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="red font-weight-bold pt-2 m-0">최종 금액</p></td>
			    		<td><input type="text" class="form-control" name="payment" value="${param.payment }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="red font-weight-bold pt-2 m-0">결제하신 금액<br><small class="text-muted">최종 금액의 10%</small></p></td>
			    		<td><input type="text" class="form-control" name="res_payment" value="${param.res_payment }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="red font-weight-bold pt-2 m-0">차액<br><small class="text-muted">차액은 물건 입고 시 결제됩니다.</small></p></td>
			    		<td><input type="text" class="form-control" name="res_payment" value="${param.payment-param.res_payment}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td colspan="2"><a href="./goIndex.me" class="btn btn-primary">메인으로 돌아가기</a></td>
			    	</tr>
			    	
			    </table>
		  </div>		
	
	        </div>          
	</section>



        <!--footer -->
        <footer class="py-4 bg-black">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-6">
                        <h5 class="text-white">About Lambda</h5>
                        <p class="about">Magnis modipsae que voloratati andigen daepeditem quiate conecus aut labore. 
                            Laceaque quiae sitiorem rest non restibusaes maio es dem tumquam explabo.</p>
                        <ul class="list-inline social social-rounded social-sm">
                            <li class="list-inline-item">
                                <a href=""><i class="fa fa-facebook"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href=""><i class="fa fa-twitter"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href=""><i class="fa fa-google-plus"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href=""><i class="fa fa-dribbble"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-6 ml-auto">
                        <h5 class="text-white">Lambda</h5>
                        <ul class="list-unstyled mt-4">
                            <li><a href="#">About</a></li>
                            <li><a href="#">Privacy</a></li>
                            <li><a href="#">Terms</a></li>
                            <li><a href="#">Blog</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-6">
                        <h5 class="text-white">Products</h5>
                        <ul class="list-unstyled mt-4">
                            <li><a href="#">Publish</a></li>
                            <li><a href="#">Outreach</a></li>
                            <li><a href="#">Collaborate</a></li>
                            <li><a href="#">Global</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-6">
                        <h5 class="text-white">Community</h5>
                        <ul class="list-unstyled mt-4">
                            <li><a href="#">Help forum</a></li>
                            <li><a href="#">Slack channel</a></li>
                            <li><a href="#">Support</a></li>
                            <li><a href="#">Policies</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-12 text-muted text-center small-xl">
                        <p>&copy; 2019 Lambda. All rights reserved.</p>
                        Free Bootstrap 4 Multipurpose Landing Page Template by <a href="https://wireddots.com" target="_blank">Wired Dots</a>.
                    </div>
                </div>
            </div>
        </footer>

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
