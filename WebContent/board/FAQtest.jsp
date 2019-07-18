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

        <!-- Bootstrap CSS / Color Scheme -->
        <link rel="stylesheet" href="../css/default.css" id="theme-color">
        <link rel="stylesheet" href="../css/support.css" id="theme-color">
        <!-- font-awesome CSS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <style>
<!-- 슬라이드-->
#side{
    float:top;
    width:50px;
    height:50px;
  background: #428D9B;
}

.hide{
    display:none;
}

#slidable{
    float:right;
    height:50px;
    background:#F4F4F4;
    width:500px;
}
   </style>
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
                        <a class="nav-link page-scroll" href="#faq">고객지원</a>
                    </li>
                </ul>
                <form class="form-inline">
                    <a href="#signup" class="btn btn-outline-secondary btn-navbar page-scroll">로그인/회원가입</a>
                </form>
            </div>
        </nav>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
jQuery(document).ready(function($) {
$( "#side" ).click(function() {
$('#slidable').animate({width: 'toggle'});
});
})
</script>
        
        
    </head>
    <body data-spy="scroll" data-target="#lambda-navbar" data-offset="0">


<!-- 왼쪽메뉴 -->
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">고객지원</a>
      </li>
		<li><a href="#">공지사항</a></li>
		<li><a href="#">자주하는 질문</a></li>
		<li><a href="${contextPath}/bo/QuestionListAction.bo">문의 하기</a></li>
		<li><a href="#">1:1 실시간 상담</a></li>
		<li><a href="#">오시는 길</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->
</div>
<!-- 왼쪽메뉴 -->

<!--  FAQ -->

 <section class="py-7 " id="company">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-9 mx-auto text-center">
                        <h2 class="display-4">자주하는 질문</h2>
                        <p class="lead">Frequently Asked Questions</p>
                    </div>
                </div>
                
                <!-- 질문1 -->
<div id="container1">
<div id="slidable"class="hide"><B>1. 폭발물같은 위험물품,물질<br>2. 식품과 같이 부패되기 쉬운 물품<br>3. 동식물을 비롯한 각종 생물<br>4. 마약,총기 등의 불법 또는 도난 물품</div>
<div id="side">보관할 수 없는 물품</div>
</div>


               
         </div> <!--끝 -->      
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

      

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>