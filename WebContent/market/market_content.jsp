<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%-- <fmt:formatDate value="${result.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Capture - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
   <!-- css/cdn links -->
	<jsp:include page="market_link.jsp"></jsp:include>
	
    <script type="text/javascript">
    	
   		function caltotal(){
   			var quantity = parseInt(document.getElementById("quantity").value);
   			var price = ${mjdto.price };
   			var total = quantity * price;
   			
   			document.getElementById("totalprice").innerHTML = total;
   			document.getElementById("price").value = total;
   			document.getElementById("quantity").value = quantity;
   		}
    
    </script>
    
  </head>
  <body>

	<div id="colorlib-page">
		
		<!-- navbar -->
		<jsp:include page="market_nav.jsp"></jsp:include>
		
		<div class="mt-5">
			<!-- header -->
			<jsp:include page="market_header.jsp"></jsp:include>
			
			
			<section class="ftco-section">
	    	<div class="container">
	    		<div class="row">
	    		<div class="col-lg-8 ftco-animate px-4">
	    		
	    		<!-- 게시글 영역 -->
	            <h2 class="mb-5 font-weight-bold d-inline">${requestScope.mjdto.title }</h2>
	            <p class="float-right"><small><span class="icon-calendar"></span> ${mjdto.date }</small></p>
	            <p class="mt-5">
	              <img src="${contextPath }/market/uploaded/${mjdto.image }" alt="${mjdto.image }" class="img-fluid">
	            </p>
	            <div class="about-author d-flex p-4 bg-light">
	                <p style="color: #4a4a4a;">${mjdto.content }</p>
	            </div>


				<!-- 댓글 영역 -->
	            <div class="pt-5 mt-5">
	              <h4 class="mb-5 font-weight-bold"><span class="icon-chat"></span> ${totalComment } Comments</h4>
	              <div class="comment-list">
	                <div class="comment">
	                <c:forEach var="mrdto" items="${replyList }">
	                	 <div class="comment-body">
		                    <h5 class="d-inline mr-5">${mrdto.name }</h5>
		                    <small>(${mrdto.email })</small>
		                    <small class='float-right'>${mrdto.date }</small>
		                    <p class="mt-2">${mrdto.content } </p>
	                  	</div>
	                  	<hr>
	                </c:forEach>
	                </div>
	              </div>
	              
	              
	              <!-- 댓글 폼 -->
	              <div class="comment-form-wrap pt-5">
	                <h5 class="mb-3">Leave a comment</h5>
	                <form action="#" class="p-3 bg-light" method="post">
	                  <div class="d-inline mb-1">
	                    <label for="name" class="mr-5">Name</label>
	                    <span style="color: #4a4a4a;">${mdto.name } <small> ( ${mdto.email } )</small></span>
	                  </div>
	                  <div class="float-right">
	                    <input type="submit" value="comment" class="btn-white submit" style="border: none;">
	                  </div>
	                  <div class="form-group">
	                    <label for="message">Comment</label>
	                    <textarea name="content" id="message" cols="30" rows="5" class="form-control"></textarea>
	                  </div>
	                  <input type="hidden" value="${mdto.name }" name="name">
	                  <input type="hidden" value="${mdto.email }" name="email">
	                </form>
	              </div>
	              
	              
	            </div>
	          </div>
	          
	          
	          
	          <!-- 우측메뉴 -->
	    	<div class="col-lg-4 sidebar ftco-animate bg-light">
	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading fontcolor">SHOPPING</h3>
	              
	              <form> <!-- 주문 or 카트로 넘길때 사용할 폼? -->
	              <ul class="categories mt-3">
	                <li><a>가격 <span style="color: black;">${mjdto.price }</span></a></li>
	                <li><a>구매가능수량 <span style="color: black;">${mjdto.stock }</span></a></li>
	                
	                <!-- 구매가능수량만큼 forEach -->
	                <li><a>수량선택<span><select onchange="caltotal()" name="quantity" id="quantity">
	             <c:forEach var="i" begin='1' end="${mjdto.stock }">
	                	<option value="${i }"/>${i }
	             </c:forEach> 	
	                </select></span></a></li>
	                <li><a>결제예상가격
	                	<span id="totalprice" style="color: #00c853; weight: bolder;">${mjdto.price }</span>
	                	</a></li>
	                <li>
	                	<div class="row px-3 mt-3">
	                	<a class="btn m-auto hover" href="#"><b>장바구니에 담기 </b></a>
	                	<a class="btn m-auto hover" href="#"><b>바로구매</b></a>
	                	</div>
	                </li>
	              </ul>
	              		<!-- 넘길값세팅 -->
	              		<input type="hidden" name="price" id="price" value="${mjdto.price }">
	                	<input type="hidden" name="quantity" id="quantity_" value="1">
	                	<input type="hidden" name="item" value="${mjdto.item }">
	                	<input type="hidden" name="name" id="itemname" value="${mjdto.name }">
	              </form>
	            </div>


				<!-- 다른아이템 for문 돌릴거임 -->
	            <div class="mt-5 sidebar-box ftco-animate">
	              <h3 class="sidebar-heading fontcolor">OTHER ITEMS</h3>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(../images/image_1.jpg);"></a>
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
	                <a class="blog-img mr-4" style="background-image: url(../images/image_2.jpg);"></a>
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
	                <a class="blog-img mr-4" style="background-image: url(../images/image_3.jpg);"></a>
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

	          </div><!-- END COL -->
	          
	    		</div>
	    	</div>
	    </section>
	    
	    <!-- navbar -->
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