<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("utf-8"); %>  

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
    <link rel="stylesheet" href="${contextPath }/css/default.css" id="theme-color">
    <!-- font-awesome CSS -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    
    <script type="text/javascript">
    
    $(function() {
    	
    	 
      	 $('#start_day').datepicker({
               //dateFormat: "yy-mm-dd",
              monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
              dayNamesMin:["일","월","화","수","목","금","토"],
              dateFormat: "yy-mm-dd",             // 날짜의 형식
              changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
              minDate: 1,  //오늘포함 이전  날짜 선택 불가                  
              onClose: function( selectedDate ) {    
            	  
                 selectedDate = new Date(selectedDate);
            	 selectedDate.setDate(selectedDate.getDate()+15); // 입력받은 날짜에서 +15일
            	 
                 $("#end_day").datepicker( "option", "minDate", selectedDate); //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
           	     return $("#end_day").datepicker("show");
                 
             	}
          });
        
          //종료일
          $('#end_day').datepicker({
               //dateFormat: "yy-mm-dd",
               monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
               dayNamesMin:["일","월","화","수","목","금","토"], 
               dateFormat: "yy-mm-dd",
               changeMonth: true,
           
          });// end_date - 끝
      }); // function() - 끝

    </script>
    <style type="text/css">
   	#inputArea{
	   	background-color: rgba(108, 117, 125, 0.2);
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
	                <h2 class="display-4">예약하기</h2>
	                <p class="lead">예약을 원하는 날짜를 선택하세요.</p>
	            </div>
			</div>
			
				
             <div class="row p-5 mt-5 bg-white raised-box rounded">
             	<div class="m-auto">
					<c:set var="hn" value="${fn:substring(param.house,0,1)}"/>
					<img class="" alt="house${hn}" src="../img/house${hn}.png">
				</div>	
				<div class="float-right m-auto col-lg-6">
				<form class="form-group" method="post" action="./reserveCheck.me">
					<ul class="list-group rounded mb-3">
						<li class="list-group-item text-center">
						  <div>
						 	 <b>공간명</b>
						    <h4 id="houseName" class="my-0">${param.house }</h4>
						    <input type="hidden" name="house" value="${param.house }">
						  </div>
						</li>
						<li class="list-group-item">
				          <div>
							<label for="email" class="mt-1"><b>E-mail</b></label>
								<input type="text" class="form-control" id="email" name="email" value="${mem_email }" readonly=""><br>
							<label for="res_day" class="mt-1"><b>예약일</b></label>
								<input type="text" class="form-control" id="res_day" name="res_day" value="${res_day}" readonly=""><br>
							<label for="start_day" class="mt-1 strong"><b>사용 시작일</b><small class="text-muted ml-2">오늘 날짜 이후로 선택 가능합니다.</small></label>
							    <input type="text" class="form-control" id="start_day" name="start_day"readonly="readonly"><br>
							<label for="end_day" class="mt-1"><b>사용 종료일</b><small class="text-muted ml-2">보관 최소기간은 15일입니다.</small></label>
							    <input type="text" class="form-control" id="end_day" name="end_day" readonly="readonly"><br>
				          </div>
				        </li>
						<li class="list-group-item text-center">
						  <input type="submit" class="mx-auto col-md-5 btn btn-primary" value="최종 금액 계산">
						</li>
					</ul>
				</form>
				</div>
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
