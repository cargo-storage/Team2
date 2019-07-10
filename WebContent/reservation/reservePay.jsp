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
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

 
</head>
<body class="bg-light">
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7 bg-light">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">결제</h2>
	                <p class="lead">예약 및 결제정보를 확인하세요</p>
	            </div>
			</div>
						
			
			<div class="my-3 p-3 bg-white rounded shadow-sm">
			    <p class="lead border-bottom border-gray display-5 pb-2 mb-0"><b>주문자 정보</b></p>
			    <div class="media text-muted pt-3">
			      <p class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
			        <strong class="d-block">주문자명</strong>
			        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
			      </p>
			    </div>
			    <div class="media text-muted pt-3">
			      <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"></rect><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>
			      <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
			        <strong class="d-block text-gray-dark">@username</strong>
			        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
			      </p>
			    </div>
			    <div class="media text-muted pt-3">
			      <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"></rect><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
			      <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
			        <strong class="d-block text-gray-dark">@username</strong>
			        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
			      </p>
			    </div>
			    <small class="d-block text-right mt-3">
			      <a href="#">All updates</a>
			    </small>
		  </div>
		  
		  <div class="my-3 p-3 bg-white rounded shadow-sm">
			    <p class="lead border-bottom border-gray display-5 pb-2 mb-0"><b>결제 정보</b></p>
			    <div class="media text-muted pt-3">
			      <p class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
			        <strong class="d-block">주문자명</strong>${mem_name }
			      </p>
			    </div>
			    <div class="media text-muted pt-3">
			      <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"></rect><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>
			      <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
			        <strong class="d-block text-gray-dark">@username</strong>
			        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
			      </p>
			    </div>
			    <div class="media text-muted pt-3">
			      <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"></rect><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
			      <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
			        <strong class="d-block text-gray-dark">@username</strong>
			        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
			      </p>
			    </div>
			    <small class="d-block text-right mt-3">
			      <a href="#">All updates</a>
			    </small>
		  </div>		
						
						
						
             <%-- <div class="row px-4 py-5 mt-5 bg-white raised-box rounded">
                 <form class="signup-form form-group m-auto" method="post" action="#">
						<div class="rounded form-group form-row p-4" id="inputArea">
							<!-- DatePicker input tag -->
							<label for="house" class="m-1">공간명</label>
								<input type="text" class="form-control" id="house" name="house" value="${param.house }" readonly="readonly"><br><!-- block -->
							<label for="name" class="m-1">이름</label>
								<input type="text" class="form-control" id="name" name="name" value="${mem_name }" readonly="readonly"><br><!-- value--session값 -->
							<label for="email" class="m-1">E-mail</label>
								<input type="text" class="form-control" id="email" name="email" value="${param.email }" readonly="readonly"><br><!-- block -->
							<label for="res_day" class="m-1">현재날짜</label>
								<input type="text" class="form-control" id="res_day" name="res_day" value="${today}" readonly="readonly"><br>
							<label for="start_day" class="m-1">시작일</label>
							    <input type="text" class="form-control" id="start_day" name="start_day" value="${param.start_day }"><br>
							<label for="end_day" class="m-1">종료일</label>
							    <input type="text" class="form-control" id="end_day" name="end_day" value="${param.end_day }"><br>
							<label for="totalDay" class="m-1">총 이용기간</label>
							    <input type="text" class="form-control" id="totalDay" name="totalDay" value="${totalDay }"><br>
							<label for="payment" class="m-1">총 이용기간</label>
							    <input type="text" class="form-control" id="payment" name="payment" value="${payment}"><br>   
							<input type="submit" class="mx-auto col-md-5 btn btn-primary mt-3" value="결제하기">
						</div>
                  </form>
	         </div> --%>
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
