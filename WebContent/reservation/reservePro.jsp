<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

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
        <link rel="stylesheet" href="css/default.css" id="theme-color">
        <!-- font-awesome CSS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <style>
           
           .market-intro{
              border: 4px solid #00c58c;
           }
           
           .market-go{
              font-size: 25px;
               font-weight: 600;
             margin: 40px 0;
           }
           .quote{
              display:block;
             overflow: hidden; 
              text-overflow: ellipsis;
              white-space: nowrap; 
              
            white-space: normal; 
            line-height: 1.2; 
            height: 3.6em; 
            text-align: left;
            word-wrap: break-word; 
            display: -webkit-box; 
            -webkit-line-clamp: 3; 
            -webkit-box-orient: vertical;
            text-align: center;
         }
        </style>
        
        <script type="text/javascript">
        
        $(function() {
        	 $('#start_day').datepicker({
                 //dateFormat: "yy-mm-dd",
                 monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                 dayNamesMin:["일","월","화","수","목","금","토"],
                //buttonImage: "/jdAdmin/images/calendar.png", // 버튼 이미지
                //buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                //buttonText: "날짜선택",             // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd",             // 날짜의 형식
                changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    minDate: 0,  //오늘 이전  날짜 선택 불가                  // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                onClose: function( selectedDate ) {    
                    // 시작일(fromDate) datepicker가 닫힐때
                    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#end_day").datepicker( "option", "minDate", selectedDate );
                }
            });

            //종료일
            $('#end_day').datepicker({
                 //dateFormat: "yy-mm-dd",
                 monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                 dayNamesMin:["일","월","화","수","목","금","토"], 
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                minDate: 0, // 오늘  날짜 선택 불가
                onClose: function( selectedDate ) {
                    // 종료일(toDate) datepicker가 닫힐때
                    // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#start_day").datepicker( "option", "maxDate", selectedDate );
                }                
            });// end_date - 끝
        }); // function() - 끝

        </script>
    </head>
    <body data-spy="scroll" data-target="#lambda-navbar" data-offset="0">
        <%
    	String house = request.getParameter("house");
    	String email = request.getParameter("email");
        
        SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        String today = formatter.format(new java.util.Date());
		
        
    	%>
    	

        <!--navigation-->
        <nav class="navbar navbar-expand-md navbar-dark navbar-transparent fixed-top sticky-navigation" id="lambda-navbar">
            <a class="navbar-brand" href="index.html">
                TEAM2 WAREHOUSE
            </a>
            <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" 
                    data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span data-feather="menu"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="#company">회사소개</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="#houseinfo">이용안내</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="#reservation">예약안내</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="#market">중고장터</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="#faq">FAQ</a>
                    </li>
                </ul>
                <form class="form-inline">
                    <a href="#signup" class="btn btn-outline-secondary btn-navbar page-scroll">로그인/회원가입</a>
                </form>
            </div>
        </nav>

        <!--hero header-->
        <section class="py-7 py-md-0 bg-hero" id="home" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.1)), url(img/main-1.jpg)">
            <div class="container">
                <div class="row vh-md-100">
                    <div class="col-md-7 my-md-auto text-center text-md-left">
                        
                        <p class="lead text-light my-4">간단하게 견적을 계산해 보세요!</p>
                            <!-- 간편검색 -->
                            <select class="col-md-6 form-control mx-2">
                                                     <option value="">사이즈선택</option>
                                                     <option value="housea">A - small</option>
                                                     <option value="houseb">B - middle</option>
                                                     <option value="housec">C - big</option>
                                                     <option value="housed">D - Container</option>
                            </select> 
                             <div class="ml-auto">
                              <div class="card" style="width: 1070px; height: 550px; margin-top: 20px">
                                  <div class="card-body p-4">
                                      <form class="signup-form" method="post" action="./reserveCheck.me">
                                      
                                          <div class="form-group">
                                          
                                          <div class="form-group form-row" >
                                          	<input type="button" value="주동석" style="width: 450px; height: 400px; margin-left: 50px; margin-top: 30px">
												<div style="background-color: pink; margin-left: 50px; margin-top: 30px; width: 450px; height: 400px;">
					  								<!-- DatePicker input tag -->
					  									<input type="text" id="house" name="house" value="${param.house }"><br>
					  									<input type="text" id="email" name="email" value="ds931229@naver.com" ><br>
					  									<input type="text" value="samll"><br>
                        								<input type="text" id="start_day" name="start_day" readonly="readonly"><br>
                        								<input type="text" id="end_day" name="end_day" readonly="readonly"><br>
                        								<input type="text" id="res_day" name="res_day" value="<%=today%>" readonly="readonly"><br>
                        								<input type="submit" value="금액계산">
                        							
											</div>
                                          </div>
                                         
                                              
                                          </div>

                                      </form>
                                  </div>
                              </div>
                             </div>
                    </div>
                </div>
            </div>
        </section>

               <!--footer / contact-->
        <footer class="py-6 bg-black" id="contact">
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

        <!--scroll to top-->
        <div class="scroll-top">
            <i class="fa fa-angle-up" aria-hidden="true"></i>
        </div>

        <!-- theme switcher (FOR DEMO ONLY - REMOVE FROM PRODUCTION)-->
        <div class="switcher-wrap">
            <div class="switcher-trigger">
                <span class="fa fa-gear"></span>
            </div>
            <div class="color-switcher">
                <h6>Color Switcher</h6>
                <ul class="mt-3 clearfix">
                    <li class="bg-green active" data-color="default" title="Default Green"></li>
                    <li class="bg-purple" data-color="purple" title="Purple"></li>
                    <li class="bg-blue" data-color="blue" title="Blue"></li>
                    <li class="bg-red" data-color="red" title="Red"></li>
                    <li class="bg-orange" data-color="orange" title="Orange"></li>
                    <li class="bg-indigo" data-color="indigo" title="Indigo"></li>
                    <li class="bg-black" data-color="black" title="Black"></li>
                    <li class="bg-teal" data-color="teal" title="Teal"></li>
                    <li class="bg-cyan" data-color="cyan" title="Cyan"></li>
                    <li class="bg-pink" data-color="pink" title="Pink"></li>
                </ul>
                <p>These are just demo colors. You can <b>easily</b> create your own color scheme.</p>
            </div>
            <div class="mt-4">
                <a href="https://wireddots.com/themes/lambda?utm_source=lambda-demos" class="btn btn-primary btn-block">Free Download</a>
            </div>
        </div>

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
