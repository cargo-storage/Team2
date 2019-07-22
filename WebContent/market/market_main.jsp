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
    
    <c:set var="email" value="${sessionScope.mdto.email }"/>
    <c:if test="${email==null }">
    	<script type="text/javascript">
    		alert("로그인 후 이용가능합니다.");
    		location.href="${contextPath}/index.jsp?login=true";
    	</script>
    </c:if>
    
    
  </head>
  <body>

	<div id="colorlib-page">
		
		<!-- navbar -->
		<jsp:include page="market_nav.jsp"></jsp:include>
	
		
		<div class="mt-5">
			<section class="ftco-section bg-light ftco-bread"  id="titlesec">
				<div class="container">
					<div class="row no-gutters slider-text align-items-center">
	          <div class="col-md-9 ftco-animate">
	            <h1 class="mb-3 bread">TEAM2 <i class="fas fa-warehouse"></i> WAREHOUSE MARKET</h1>
	            <p>창고사용자가 미수령하거나 판매대행을 신청한 물품을 판매하는 중고장터입니다.<br>모든 물품 및 거래는 TEAM2 WAREHOUSE에서 관리합니다.</p>
	          </div>
	        </div>
				</div>
			</section>
			<section class="ftco-section">
	    	<div class="container">
	    		<div class="row">
	    			<div class="col-lg-12">
	    			
	    			
	    				<div class="row">
	    				
	    					<!-- for문돌릴거임 -->
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="${contextPath }/mk/showcontent.do" class="img img-2" style="background-image: url(../images/image_1.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    			<!-- for문돌릴거임 -->
			    			
			    			
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="single.html" class="img img-2" style="background-image: url(../images/image_2.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="single.html" class="img img-2" style="background-image: url(../images/image_3.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="single.html" class="img img-2" style="background-image: url(../images/image_4.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="single.html" class="img img-2" style="background-image: url(../images/image_5.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="single.html" class="img img-2" style="background-image: url(../images/image_6.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="single.html" class="img img-2" style="background-image: url(../images/image_7.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    			<div class="col-md-4">
			    				<div class="blog-entry ftco-animate">
										<a href="single.html" class="img img-2" style="background-image: url(../images/image_8.jpg);"></a>
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div>
			    			</div>
			    		</div><!-- END-->
			    		
			    		
			    		
			    		<div class="row mt-5">
			          <div class="col text-center">
			            <div class="block-27">
			              <ul>
			                <li><a href="#">&lt;</a></li>
			                <li class="active"><span>1</span></li>
			                <li><a href="#">2</a></li>
			                <li><a href="#">3</a></li>
			                <li><a href="#">4</a></li>
			                <li><a href="#">5</a></li>
			                <li><a href="#">&gt;</a></li>
			              </ul>
			            </div>
			          </div>
			        </div>
			        
			        
			    	</div>
	    			<!--<div class="col-lg-4 sidebar ftco-animate bg-light">
	            <div class="sidebar-box">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
	                </div>
	              </form>
	            </div>
	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Categories</h3>
	              <ul class="categories">
	                <li><a href="#">Fashion <span>(6)</span></a></li>
	                <li><a href="#">Technology <span>(8)</span></a></li>
	                <li><a href="#">Travel <span>(2)</span></a></li>
	                <li><a href="#">Food <span>(2)</span></a></li>
	                <li><a href="#">Photography <span>(7)</span></a></li>
	              </ul>
	            </div>

	             <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Popular Articles</h3>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Oct. 04, 2018</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	            </div>

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Tag Cloud</h3>
	              <ul class="tagcloud">
	                <a href="#" class="tag-cloud-link">animals</a>
	                <a href="#" class="tag-cloud-link">human</a>
	                <a href="#" class="tag-cloud-link">people</a>
	                <a href="#" class="tag-cloud-link">cat</a>
	                <a href="#" class="tag-cloud-link">dog</a>
	                <a href="#" class="tag-cloud-link">nature</a>
	                <a href="#" class="tag-cloud-link">leaves</a>
	                <a href="#" class="tag-cloud-link">food</a>
	              </ul>
	            </div>

							<div class="sidebar-box subs-wrap img" style="background-image: url(images/bg_1.jpg);">
								<div class="overlay"></div>
								<h3 class="mb-4 sidebar-heading">Newsletter</h3>
								<p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia</p>
	              <form action="#" class="subscribe-form">
	                <div class="form-group">
	                  <input type="text" class="form-control" placeholder="Email Address">
	                  <input type="submit" value="Subscribe" class="mt-2 btn btn-white submit">
	                </div>
	              </form>
	            </div>

	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Archives</h3>
	              <ul class="categories">
	              	<li><a href="#">October 2018 <span>(10)</span></a></li>
	                <li><a href="#">September 2018 <span>(6)</span></a></li>
	                <li><a href="#">August 2018 <span>(8)</span></a></li>
	                <li><a href="#">July 2018 <span>(2)</span></a></li>
	                <li><a href="#">June 2018 <span>(7)</span></a></li>
	                <li><a href="#">May 2018 <span>(5)</span></a></li>
	              </ul>
	            </div>


	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Paragraph</h3>
	              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut.</p>
	            </div>
	          </div> -->
	          <!-- END COL -->
	          
	          
	          
	    		</div>
	    	</div>
	    </section>
	    
	    
 	    <footer class="ftco-footer ftco-bg-dark ftco-section">
	      <div class="container px-md-5">
	        <div class="row mb-5">
	          <div class="col-md">
	            <div class="ftco-footer-widget mb-4 ml-md-4">
	              <h2 class="ftco-heading-2">Category</h2>
	              <ul class="list-unstyled categories">
	                <li><a href="#">Photography <span>(6)</span></a></li>
	                <li><a href="#">Fashion <span>(8)</span></a></li>
	                <li><a href="#">Technology <span>(2)</span></a></li>
	                <li><a href="#">Travel <span>(2)</span></a></li>
	              </ul>
	            </div>
	          </div>
	          <div class="col-md">
	             <div class="ftco-footer-widget mb-4">
	              <h2 class="ftco-heading-2">Archives</h2>
	              <ul class="list-unstyled categories">
	              	<li><a href="#">November 2018 <span>(105)</span></a></li>
	              	<li><a href="#">October 2018 <span>(212)</span></a></li>
	                <li><a href="#">September 2018 <span>(150)</span></a></li>
	                <li><a href="#">August 2018 <span>(100)</span></a></li>
	                <li><a href="#">July 2018 <span>(200)</span></a></li>
	              </ul>
	            </div>
	          </div>
	          <div class="col-md">
	            <div class="ftco-footer-widget mb-4">
	            	<h2 class="ftco-heading-2">Have a Questions?</h2>
	            	<div class="block-23 mb-3">
		              <ul>
		                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
		                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
		                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
		              </ul>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-md-12">

	            <p>Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p>
	          </div>
	        </div>
	      </div>
	    </footer>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

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