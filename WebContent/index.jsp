<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>TEAM2 WAREHOUSE</title>
        <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 

        <!--Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <!--vendors styles-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">

        <!-- Bootstrap CSS / Color Scheme -->
        <link rel="stylesheet" href="css/default.css" id="theme-color">
        <!-- font-awesome CSS -->
       	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
		<link href="${contextPath }/css/font.css" rel="stylesheet">
		
		<!-- jquery.js -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- bootstrap.min.js -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
    	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
		
        
        <style>
        	/* 중고 장터 */
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
			
			/* login */
			.modal-login {
			width: 350px;
			}
		
			.modal-login .modal-content {
				padding: 20px;
				border-radius: 1px;
				border: none;
			}
			
			.modal-login .modal-header {
				border-bottom: none;
				position: relative;
				justify-content: center;
			}
			
			.modal-login h4 {
				text-align: center;
				font-size: 26px;
			}
			
			.modal-login .form-control, .modal-login .btn {
				min-height: 40px;
				border-radius: 1px;
			}
			
			.modal-login .close {
				position: absolute;
				top: -5px;
				right: -5px;
			}
			
			.modal-login .btn {
				background: #3498db;
				border: none;
				line-height: normal;
				font-size: 1.25rem;
			}
			
			.modal-login .btn:hover, .modal-login .btn:focus {
				background: #248bd0;
			}
			
			.modal-login .hint-text, .modal-login .hint-text a{
				color: #14ba9a;
				font-size: 12px;
				font-weight: bold;
				line-height: 3;
				margin: 0 7px;
			}
			
			.trigger-btn {
				display: inline-block;
			}
			
			.help-block {
				color: red;
				font-size: 11px;
			}
        </style>
        
        <script type="text/javascript"> //login.js
			$(function(){
				
				if(${param.login!=null}){
					$("#loginModal").modal('toggle');
				}
		
				/* 이메일 저장 */
				// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
			    var key = getCookie("key");
			    $("#email").val(key); 
			     
			    if($("#email").val() != ''){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			        $("#emailSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			    }
			     
			    $("#emailSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
			        if($("#emailSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
			            setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
			        }else{ // ID 저장하기 체크 해제 시,
			            deleteCookie("key");
			        }
			    });
			        
				$("#email").blur(function(){
					if($(this).val()==''){
						$("#emailErr").text("필수 입력 사항입니다.");
						$("#emailErr").show();
					}else{
						$("#emailErr").hide();
						if($("#emailSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
				            setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
				            }
					}
				});
				
				$("#pw").blur(function(){
					if($(this).val() ==''){
						$("#pwErr").text("필수 입력 사항입니다.");
						$("#pwErr").show();
					}else{ $("#pwErr").hide(); }
				});
			});
			
		 	function login(){
		 		var result = 0;
		 		var email = $("#email");
				var pw = $("#pw");
		
				if (email.val() == '') {
					$("#emailErr").text("필수 입력 사항입니다.");
					$("#emailErr").show();
					result = 1;
				}
				if (pw.val() == '') {
					$("#pwErr").text("필수 입력 사항입니다.");
					$("#pwErr").show();
					result = 1;
				}
				if(result==1){
					alert("필수 사항을 기입해주세요.");
					return false;
				}
		 	};
		 	
		 	/* 쿠키관련 */
		 	function setCookie(cookieName, value, exdays){
			    var exdate = new Date();
			    exdate.setDate(exdate.getDate() + exdays);
			    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
			    document.cookie = cookieName + "=" + cookieValue;
			}
			 
			function deleteCookie(cookieName){
			    var expireDate = new Date();
			    expireDate.setDate(expireDate.getDate() - 1);
			    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
			}
			 
			function getCookie(cookieName) {
			    cookieName = cookieName + '=';
			    var cookieData = document.cookie;
			    var start = cookieData.indexOf(cookieName);
			    var cookieValue = '';
			    if(start != -1){
			        start += cookieName.length;
			        var end = cookieData.indexOf(';', start);
			        if(end == -1)end = cookieData.length;
			        cookieValue = cookieData.substring(start, end);
			    }
			    return unescape(cookieValue);
			}
			
			/* 간편견적 */
			var go;
			var day;
		
			$(function () {
				
				$("#ajaxbtn").on("click", function() {
					go = $("#size").val(); //A,B,C,D
					day = $("#minday").val();
					//var AllData = {'minday': day,'house': go};
					$.ajax({
						type : 'POST',
						url : "${contextPath}/re/simplepayment.me",
						data : {house : go},
						dataType: 'text',
						success : function(r) {
							var re = JSON.parse(r);
							$("#ajaxresult").val(re.price * day);
							$("#rsname").val($("#name").val());
							$("#rssize").val($("#size").val());
							$("#rsminday").val($("#minday").val());
						}
					});//end of ajax
				});//end of onclick
			});
			
			$(function(){
	            
				//$("#dialog").dialog();
	            $("#dialog").dialog({
	                autoOpen:false, //자동으로 열리지않게
	                position:[100,200], //x,y  값을 지정
	                //"center", "left", "right", "top", "bottom"
	                modal:true, //모달대화상자
	                resizable:false, //크기 조절 못하게
	                width: 350,
	                height: 525,
	                buttons:{
	                    "확인" : function(){
	                    	location.href='${contextPath}/re/info.me?warehouse='+$("#rssize").val();
	                    },"취소" : function(){
	                        $(this).dialog("close");
	                    }
	                }
	            });
	
	            //창 열기 버튼을 클릭했을경우
	            $("#ajaxbtn").on("click",function(){
	            	if($("#name").val()==""){
	            		alert("이름을 입력하세요.");
	            	}else if($("#size").val()==""){
	            		alert("사이즈를 선택하세요.");
	            	}else if($("#minday").val()==""){
	            		alert("이용하실 일 수를 입력하세요.");
	            	}else if(parseInt($("#minday").val())<15){
	            		alert("최소 15일 이상 사용가능합니다.");
	            	}else{
	            		$("#dialog").dialog("open"); //다이얼로그창 오픈                
	            	}
	            });
        });
		</script>
    </head>
    <body data-spy="scroll" data-target="#lambda-navbar" data-offset="0">

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
                   <a class="nav-link page-scroll" href="#faq">고객지원</a>
               </li>
          	<c:set var="email" value="${sessionScope.mdto.email }"/>
          	<c:set var="name" value="${sessionScope.mdto.name }"/>
          	<c:set var="admin" value="${sessionScope.mdto.admin }"/>
         	
			<c:if test="${admin == 1 }">
        		<li class="nav-item">
                	<a class="nav-link page-scroll" href="#">관리자</a>
            	</li> 
            </c:if>
           	<c:choose>
               	<c:when test="${email != null }">
               		<li class="nav-item">
                   		<a class="nav-link page-scroll" href="${contextPath }/member/mypage.jsp">마이페이지</a>
               		</li>               
              		<a href="${contextPath }/me/logout.me" class="btn btn-outline-secondary btn-navbar">${name }님 환영합니다. 로그아웃 <i class="fas fa-arrow-alt-circle-right"></i></a>
               	</c:when>
               	<c:otherwise>
               		<div class="text-center">
						<a href="#loginModal" class="btn btn-outline-secondary btn-navbar trigger-btn" data-toggle="modal">로그인/회원가입</a>
					</div>
              	</c:otherwise>
       		</c:choose>
          	</ul>
        </div>
    </nav>

        <!--hero header-->
        <section class="py-7 py-md-0 bg-hero" id="home" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.1)), url(img/main-1.jpg)">
            <div class="container">
                <div class="row vh-md-100">
                    <div class="col-md-7 my-md-auto text-center text-md-left">
                        <h1 class="display-3 text-white font-weight-bold">간편견적</h1>
                        <p class="lead text-light my-4">간단하게 견적을 계산해 보세요!</p>
		                      <!-- 간편검색 --> 
		                       <div class="ml-auto">
		                        <div class="card">
		                            <div class="card-body p-4">
		                                <form class="signup-form">
		                                    <div class="form-group">
		                                        <input type="email" class="form-control" id="name" name="name" placeholder="Customer Name">
		                                    </div>
		                                    <div class="form-group form-row" >
			                                        <select class="col-md-6 form-control mx-2" id="size" name="size">
			                                            <option value="">사이즈선택</option>
			                                            <option value="A">A - 9㎥ : 3m x 3m x 1m</option>
			                                            <option value="B">B - 50㎥ : 5m x 5m x 2m</option>
			                                            <option value="C">C - 122.5㎥ : 7m x 7m x 2.5m</option>
			                                            <option value="D">D - 300㎥ : 10m x 10m x 3m</option>
			                                        </select>
			                                        <input type="text" id="minday" name="minday"  class="form-control col-md-4 ml-2" placeholder="최소 대여기간 15">
			                                        
			                                        <span class="ml-3 text-muted lead">일</span>
		                                    </div>
		                                    <div class="form-group">
		                                        <input type="button" id="ajaxbtn" value="계산하기" class="btn btn-primary btn-block">
		                                        
		                                    </div>
		                                </form>
		                            </div>
		                        </div>
		                       </div>
                    </div>
                </div>
            </div>
            


			<div id="dialog" title="간편견적">
				<label for="rsname"><small>Name</small></label>
				<input type="text" class="form-control" id="rsname" readonly="readonly">
				<label for="rssize"><small>Size</small></label>
			    <input type="text" class="form-control" id="rssize" readonly="readonly">
			    <label for="rsminday"><small>Using day</small></label>
			    <input type="text" class="form-control" id="rsminday" readonly="readonly">
			    <label for="ajaxresult"><small>Price</small></label>
			    <input type="text" class="form-control" id="ajaxresult" readonly="readonly" placeholder="예상견적"><br>
			    <div class="text-center"><small><b>※ 확인을 눌러 예약페이지에서 예약해주세요.</b></small></div>
			</div>
        </section>
        
        

       <!-- company section -->
        <section class="py-7 bg-light" id="company">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-9 mx-auto text-center">
                        <span class="text-muted text-uppercase">Everything you need for PR</span>
                        <h2 class="display-4">회사소개</h2>
                        <p class="lead">고객의 취지에 맞게 설계하여 보관하는 공간! warehouse!</p>
                    </div>
                </div>
                <div class="row p-4 mt-5 bg-white raised-box rounded">
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                               <!-- <img src="./img/roomsize.PNG"> -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><polygon points="14 2 18 6 7 17 3 17 3 13 14 2"></polygon><line x1="3" y1="22" x2="21" y2="22"></line></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">다양한 보관 공간</h4>
                        <p class="text-muted">고객의 의도에 맞게 원하시는 크기의<br> 보관공간을 선택하십시오.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-thumbs-up"><path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">안전한 포장 보관</h4>
                        <p>보관물 손상걱정 No!<br> 모든 보관물을 포장하여<br> 보관하고있습니다.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">예약제 시스템</h4>
                        <p>예약제 시스템으로 인한 <br> 유연하고 정확한 시간.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">중고장터 서비스</h4>
                        <p>더이상 필요없는 물건은 저희에게 맡겨주세요!</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">방문 입출고 서비스</h4>
                        <p>무게,크기,시간 걱정마세요!<br>WAREHOUSE가 도와드리겠습니다!</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-rotate-ccw"><polyline points="1 4 1 10 7 10"></polyline><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">온라인 실시간 문의</h4>
                        <p>WAREHOUSE에게 궁금한 점<br>언제든 문의주세요!</p>
                    </div>
                </div>
                <div class="row press mt-5">
                    <div class="col-12 text-muted small-xl text-uppercase text-center mb-5">We have got our clients covered in</div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-1.png" alt=""></a></div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-2.png" alt=""></a></div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-3.png" alt=""></a></div>                                 
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-4.png" alt=""></a></div> 
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-5.png" alt=""></a></div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-6.png" alt=""></a></div>
                </div>
            </div>
        </section>


        

        <!--houseinfo section-->
        <section class="py-7" id="houseinfo">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto text-center">
                        <span class="text-muted text-uppercase">Simple pricing</span>
                        <h2 class="display-4">이용안내</h2>
                        <p class="lead">
                            Nam liber tempor cum eleifend option congue nihil imper. Nam liber tempor cum soluta nobis.
                        </p>
                    </div>
                </div>
                
                <div class="row mt-5">
                    <div class="col-md-11 mx-auto">
                        <div class="card-group pricing-table">
                            <div class="card text-center bg-light">
                                <div class="card-body">
                                    <h4 class="card-title pt-3">A동</h4>
                                    <h2 class="card-title text-primary pt-4">$99</h2>
                                    <div class="text-muted mt-4">per month</div>
                                    <ul class="list-unstyled pricing-list">
                                        <li>대략적인</li>
                                        <li>20 media submissions</li>
                                    </ul>
                                    <a href="#" class="btn btn-primary">
                                        Get Started
                                    </a>
                                </div>
                            </div>
                            <div class="card bg-primary text-white text-center">
                                <div class="card-body">
                                    <h4 class="card-title text-white pt-3">B동</h4>
                                    <h2 class="card-title text-white pt-4">$159</h2>
                                    <div class="text-light mt-4">per month</div>
                                    <ul class="list-unstyled pricing-list">
                                        <li>정보들</li>
                                        <li>50 media submissions</li>
                                    </ul>
                                    <a href="#" class="btn btn-secondary">
                                        Get started
                                    </a>
                                </div>
                            </div>
                            <div class="card text-center bg-light">
                                <div class="card-body">
                                    <h4 class="card-title pt-3">C동</h4>
                                    <h2 class="card-title text-primary pt-4">$499</h2>
                                    <div class="text-muted mt-4">per month</div>
                                    <ul class="list-unstyled pricing-list">
                                        <li>넣어요</li>
                                        <li>200 media submissions</li>
                                    </ul>
                                    <a href="#" class="btn btn-primary">
                                        Get Started
                                    </a>
                                </div>
                            </div>
                            <div class="card bg-primary text-white text-center">
                                <div class="card-body">
                                    <h4 class="card-title text-white pt-3">D동</h4>
                                    <h2 class="card-title text-white pt-4">$159</h2>
                                    <div class="text-light mt-4">per month</div>
                                    <ul class="list-unstyled pricing-list">
                                        <li>조정가능</li>
                                        <li>50 media submissions</li>
                                    </ul>
                                    <a href="#" class="btn btn-secondary">
                                        Get started
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-md-9 mx-auto">
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <div class="icon-box border-box">
                                    <div class="icon-box-inner p-2 text-primary">
                                        <span data-feather="umbrella"></span>
                                    </div>
                                </div>
                                <h6 class="mb-2">Money-back guarantee</h6>
                                <p class="text-muted small-xl">100% money back guarantee within 14 days. No worries.</p>
                            </div>
                            <div class="col-md-4 text-center">
                                <div class="icon-box border-box">
                                    <div class="icon-box-inner p-2 text-primary">
                                        <span data-feather="shield"></span>
                                    </div>
                                </div>
                                <h6 class="mb-2">Secure payment</h6>
                                <p class="text-muted small-xl">Money transfers are protected with a 256-bit SSL Protocol.</p>
                            </div>
                            <div class="col-md-4 text-center">
                                <div class="icon-box border-box">
                                    <div class="icon-box-inner p-2 text-primary">
                                        <span data-feather="credit-card"></span>
                                    </div>
                                </div>
                                <h6 class="mb-2">Payment methods</h6>
                                <p class="text-muted small-xl">Pay with multiple payment methods — credit card, bank transfer or PayPal.</p>
                            </div>
                        </div>
                    </div>
                </div>
             
                
            </div>
        </section>
        
        
        <!--reservation section-->
        <section class="py-7 bg-light" id="reservation">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 my-auto">
                        <img src="img/feature1.png" class="img-fluid d-block mx-auto" alt="Feature 1" />
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-left pt-5 pt-md-0">
                        <h2 class="display-4">예약안내</h2>
                        <p class="lead text-muted">Nam liber tempor cum eleifend option congue nihil imper. 
                            Nam liber tempor cum soluta nobis.</p>
                        <ul class="features-list">
                            <li>Lorem ipsum dolor sit amet.</li>
                            <li>Aenean commodo ligula eget dolor.</li>
                            <li>Aenean massa.</li>
                            <li>Cum sociis natoque penatibus mus.</li>
                        </ul>
                        <p class="lead mt-3">
                            <a href="${contextPath }/re/info.me?warehouse=A" class="btn btn-primary btn-sm d-inline-flex flex-row align-items-center">
                                예약하러가기 <span class="ml-1" width="18" height="18" data-feather="chevron-right"></span>
                            </a>
                        </p>
                    </div>
                </div>
<!--                 <div class="row mt-7">
                    <div class="col-md-6 my-auto order-1 order-md-2">
                        <img src="img/feature2.png" class="img-fluid d-block mx-auto" alt="Feature 2" />
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-left pt-5 pt-md-0 order-2 order-md-1">
                        <h2 class="display-4">B동</h2>
                        <p class="lead text-muted">Nam liber tempor cum eleifend option congue nihil imper. 
                            Nam liber tempor cum soluta nobis.</p>
                        <ul class="features-list">
                            <li>Lorem ipsum dolor sit amet.</li>
                            <li>Aenean commodo ligula eget dolor.</li>
                            <li>Aenean massa.</li>
                            <li>Cum sociis natoque penatibus mus.</li>
                        </ul>
                        <p class="lead mt-3">
                            <a href="#" class="btn btn-primary btn-primary d-inline-flex flex-row align-items-center">
                                Sign up now <span class="ml-1" width="18" height="18" data-feather="chevron-right"></span>
                            </a>
                        </p>
                    </div>
                </div>
                <div class="row mt-7">
                    <div class="col-md-6 my-auto">
                        <img src="img/feature3.png" class="img-fluid d-block mx-auto" alt="Feature 3" />
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-left pt-5 pt-md-0">
                        <h2 class="display-4">C동</h2>
                        <p class="lead text-muted">Nam liber tempor cum eleifend option congue nihil imper. 
                            Nam liber tempor cum soluta nobis.</p>
                        <ul class="features-list">
                            <li>Lorem ipsum dolor sit amet.</li>
                            <li>Aenean commodo ligula eget dolor.</li>
                            <li>Aenean massa.</li>
                            <li>Cum sociis natoque penatibus mus.</li>
                        </ul>
                        <p class="lead mt-3">
                            <a href="#" class="btn btn-primary btn-primary d-inline-flex flex-row align-items-center">
                                Contact us <span class="ml-1" width="18" height="18" data-feather="chevron-right"></span>
                            </a>
                        </p>
                    </div>
                </div> -->
            </div>
        </section>
        
        <!-- market section -->
        <section class="py-7" id="market">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-8 mx-auto text-center">
                        <span class="text-muted small-xl text-uppercase">미수령물건을 판매로!</span>
                        <h2 class="display-4">중고장터</h2>
                    </div>
                </div>
                <div class="row mt-5">
                	<div class="col-4 bg-dark">
                		<div class="mx-auto review-wrapper">
                			<div class="card border-0 review p-5 bg-dark">
                				<div class="card-body">
                					<img src="img/online-shop.png" width="200" class="rounded-circle d-block mx-auto"/>
									<p class="market-go text-white">중고 장터 서비스</p>
									<p class="text-white">미수령된 물건들은<br>중고장터에서 판매 가능합니다!</p>
									<a href="${contextPath }/mk/market.do" class="btn btn-outline-success btn-lg text-white">바로가기 <i class="far fa-arrow-alt-circle-right"></i></a>
                				</div>	
                			</div>
                		</div>
                	</div>
                	<div class="col-8">
	                    <div class="col-md-12 mx-auto review-wrapper slick-reviews">
	                        <div class="card border-0 review p-5 raised-box">
	                            <div class="card-body">
	                                <img src="img/client-1.jpg" class="img-review rounded d-block mx-auto" alt="Client 1"/>
	                                <p class="quote">물품에 대한 정보를 알려주는 곳</p>
	                                <div class="mt-4">가격 &nbsp;&nbsp; <span class="text-muted">미정입니다.</span></div>
	                            </div>
	                        </div>
	                        <div class="card border-0 review p-5 raised-box">
	                            <div class="card-body">
	                                <img src="img/client-2.jpg" class="img-review rounded d-block mx-auto" alt="Client 2"/>
	                                <p class="quote">물품에 대한 정보를 알려주는 곳</p>
	                                <div class="mt-4">가격 &nbsp;&nbsp; <span class="text-muted">미정입니다</span></div>
	                            </div>
	                        </div>
	                        <div class="card border-0 review p-5 raised-box">
	                            <div class="card-body">
	                                <img src="img/client-3.jpg" class="img-review rounded d-block mx-auto" alt="Client 3"/>
	                                <p class="quote">물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳물품에 대한 정보를 알려주는 곳</p>
	                                <div class="mt-4">가격 &nbsp;&nbsp; <span class="text-muted">미정입니다</span> </div>   
	                            </div>
	                        </div>
	                    </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- faq section -->
        <section class="py-7 bg-light" id="faq">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto text-center">
                        <span class="text-muted text-uppercase">Answers to common questions</span>
                        <h2 class="display-4">FAQ</h2>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-md-9 mx-auto">
                        <div class="row mt-4">
                            <div class="col-md-6 mb-4">
                                <h5>Lorem ipsum dolor sit amet?</h5>
                                <p class="text-muted">
                                    Magnis modipsae que voloratati andigen daepeditem quiate conecus aut labore. Laceaque quiae sitiorem 
                                    rest non restibusaes maio es dem tumquam explabo.
                                </p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5>Lorem sit andigen daepeditem amet?</h5>
                                <p class="text-muted">
                                    Magnis modipsae que voloratati andigen daepeditem quiate conecus aut labore. Laceaque quiae sitiorem 
                                    rest non restibusaes maio es dem tumquam explabo.
                                </p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5>Lorem ipsum dolor sit andigen daepeditem amet?</h5>
                                <p class="text-muted">
                                    Magnis modipsae que voloratati andigen daepeditem quiate conecus aut labore. Laceaque quiae sitiorem 
                                    rest non restibusaes maio es dem tumquam explabo.
                                </p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5>Lorem sit andigen daepeditem amet dem tumquam explabo?</h5>
                                <p class="text-muted">
                                    Magnis modipsae que voloratati andigen daepeditem quiate conecus aut labore. Laceaque quiae sitiorem 
                                    rest non restibusaes maio es dem tumquam explabo.
                                </p>
                            </div>
                        </div>
                        <div class="row text-center my-5">
                            <div class="col-lg-6 col-md-8 mx-auto">
                                <div class="font-weight-bold lead">Still have more questions?</div>
                                <p class="text-muted">Magnis modipsae que voloratati andigen daepeditem quiate conecus aut labore.</p>
                                <a href="#" class="btn btn-primary btn-sm">
                                    	문의게시판가기
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--hero header-->
        <section class="py-5 py-md-6 bg-hero inverse" id="signup" style="background-image: url(img/parallex.jpg)">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 my-md-auto text-center text-md-left pb-5 pb-md-0">
                        <h1 class="display-3 text-white">회원가입</h1>
                        <p class="lead text-light">Magnis modipsae que voloratati andigen daepeditem quiate conecus aut labore. Laceaque quiae sitiorem rest non restibusaes maio es dem tumquam explabo.</p>
                    </div>
                    <div class="col-md-5 ml-auto">
                        <div class="card">
                            <div class="card-body p-4">
                                <form class="signup-form">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Full name">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Website">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Email address">
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" placeholder="Short description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control">
                                            <option value="">Plan type</option>
                                            <option value="basic">Basic</option>
                                            <option value="startup">Startup</option>
                                            <option value="growth">Growth</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary btn-block">Create your account</button>
                                    </div>
                                </form>
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
       	<div id="loginModal" class="modal fade">
				<div class="modal-dialog modal-login">
					<div class="modal-content">
						<div class="modal-header">				
							<h4 class="modal-title">LOGIN</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<form action="${contextPath }/me/login.me" method="post" onsubmit="return login()">
								<div class="form-group">
									<input type="text" class="form-control" id="email" name="email" placeholder="EMAIL">
									<span id="emailErr" class="help-block"></span>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
									<span id="pwErr" class="help-block"></span>
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-primary btn-block btn-lg" value="LOGIN">
								</div>
							</form>
							<div class="remember">
								<input type="checkbox" id="emailSaveCheck"><span class="text-muted hint-text">이메일 기억</span>
							</div>	
							<div class="hint-text">			
								<span><a href="${contextPath }/member/findMember.jsp?find=email">이메일찾기</a></span> | 
								<span><a href="${contextPath }/member/findMember.jsp?find=pwd">비밀번호찾기</a></span> | 
								<span><a href="${contextPath }/member/join.jsp">회원가입</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>