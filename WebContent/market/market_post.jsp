<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Capture - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- css/cdn links -->
	<jsp:include page="market_link.jsp"></jsp:include>
    
    
    <style type="text/css">
    
    #uppernav{
    	background-color: rgba( 0, 200, 83, 0.9);
    	padding-top: 0; 
    	padding-bottom: 0; 
    	
    }
    .logosm{
    	color: #ffffff;
    	font-size: 1.5em;
    	font-weight: bold;
    	font-family: 'Nanum Gothic';
    }
    
    .logosm:HOVER{
    	color: #cdcdcd;
    }
    
    .uppernav li a, .uppernav li {
    	font-family: 'Nanum Gothic';
    	color: white !important;
    }
    
    .uppernav li:HOVER{
    	color: #cdcdcd;
    }
    
    #titlesec{
/*     	background-image: url(../img/reservation2.jpg); */
		background-size: cover;
    }
    
    </style>
    
    
    
  </head>
  <body>

	<div id="colorlib-page">
		
		<!-- navbar -->
		<jsp:include page="market_nav.jsp"></jsp:include>
		
		<div class="mt-5">
			<section class="ftco-section bg-light ftco-bread" id="titlesec">
				<div class="container">
				<div class="row no-gutters slider-text align-items-center">
	          	<div class="col-md-9 ftco-animate">
	            <h1 class="mb-3 bread">TEAM2 <i class="fas fa-warehouse"></i> WAREHOUSE MARKET</h1>
	            	<p>창고사용자가 미수령하거나 판매대행을 신청한 물품을 판매하는 중고장터입니다.<br>모든 물품 및 거래는 TEAM2 WAREHOUSE에서 관리합니다.</p>
	          	</div>
	        	</div>
				</div>
			</section>
			
			<section class="ftco-section mb-5">
	    	<div class="container">
	    		<div class="row">
	    			<div class="col-lg-12 ftco-animate">
	            <div class="comment-form-wrap pt-5">
	            <h2 class="mb-3 font-weight-bold">POST ITEMS</h2>
	                
	                
	                
	                <!-- ********************* 글쓰기 폼***************  -->
	                <form action="${contextPath }/mk/postItem.do" class="p-3 p-md-5 bg-light">
	                  <div class="form-group">
	                    <label for="name">Name *</label>
	                    <input type="text" class="form-control" id="name">
	                  </div>
	                  <div class="form-group">
	                    <label for="email">Email *</label>
	                    <input type="email" class="form-control" id="email">
	                  </div>
	                  <div class="form-group">
	                    <label for="website">Website</label>
	                    <input type="url" class="form-control" id="website">
	                  </div>

	                  <div class="form-group">
	                    <label for="message">Message</label>
	                    <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
	                  </div>
	                  <div class="form-group">
	                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
	                  </div>

	                </form>
	                
	                
	                
	                
	              </div>
	          </div>
	          
	          
	          
	    		</div>
	    	</div>
	    </section>
	    
	   <!-- footer -->
		<jsp:include page="market_footer.jsp"></jsp:include>
		
		</div><!-- END COLORLIB-MAIN -->
	</div>
		
		  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
		

</body>
</html>