<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>CART - TEAM2 WAREHOUSE MARKET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- css/cdn links -->
	<jsp:include page="market_link.jsp"></jsp:include>
    
    <script type="text/javascript">
	    $(document).ready(function() {
	    	
	    	
	    	
	        $('.checkAll').click(function() {
	          $('.cb').prop('checked', this.checked);
	        });
	        
	      });
    
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
	    	<div class="container mb-5">
	    		<div class="row">
	    			<div class="col-lg-10 ftco-animate pt-2">
	            

	              <h3 class="mb-5 font-weight-bold"><i class="fas fa-shopping-cart"></i> CART</h3>
	              
	              <table class="table text-center">
	              <thead>
	              	<tr class="text-center font-weight-bold bg-light" style="font-family: 'Jeju Gothic' !important;">
		              	<td width='5%'><input type="checkbox" class="checkAll" checked></td>
	              		<td colspan="2">상품명</td>
	              		<td width='15%'>가격</td>
	              		<td width='10%'>수량</td>
	              		<td width='15%'>총 가격</td>
	              	</tr>
	              </thead>
	              <tbody>
	            <c:set var="total" value="${0 }"/>
	            <c:set var="i" value="${0 }"/>
	            <c:forEach var="item" items="${sessionScope.cart.itemList }">
	            	<tr height="60px" id="itemTable">
	            		<td width='5%'><input type="checkbox" class="cb item_${i }" checked></td>
	            		<td width='10%'>
	            			<img alt="${item.img }" src="${contextPath }/market/uploaded/${item.img}">
	            		</td>
	              		<td width='45%'>&nbsp;&nbsp; ${item.name }</td>
	              		<td width='15%'>${item.price }</td>
	              		<td width='10%'>${item.quantity }</td>
	              		<td width='15%'>${item.price * item.quantity }</td>
	            	</tr>
	            	<input type="hidden" value="${item.price * item.quantity }" id="price_${i }">
	            	<c:set var="i" value="${i+1 }"/>
	            	<c:set var="total" value="${total+ item.price * item.quantity }"/>
	            </c:forEach>
	              </tbody>
	              <tfoot>
	              	<tr>
	              		<td colspan='3'><h5 class="mt-3 mb-0">총 결제예상금액</h5></td>
	              		<td colspan='3'><h5 class="mt-3 mb-0 fontcolor">${total }</h5></td>
	              	</tr>
	              </tfoot>
	              </table>
	          </div>
	          
	          
	          
	          <!-- 우측 결제영역 -->
	          
	          
	          <div class="col-lg-2 sidebar ftco-animate bg-light">
	          	
	          	<div class="sidebar-box mt-4 mx-auto text-center">
	          		<small class="d-inline-block">결제예상금액</small>
	          		<h4 class="d-inline-block">TOTAL</h4>
	          		<h4 class="fontcolor d-inline-block">${total }</h4>
				</div>	  
				        
	          	<div class="sidebar-box mt-4 mx-auto text-center">
	          		<small class="d-inline-block">주문</small>
					<h4 class="d-inline-block">ORDER</h4>
	                <div class="form-group" id="order">
	                  <input type="button" value="선택삭제" class="rounded mt-2 btn submit mx-auto">
	                  <input type="button" value="선택주문" class="rounded mt-2 btn submit mx-auto">
	                  <input type="button" value="전체주문" class="rounded mt-2 btn submit mx-auto">
	                </div>
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
	          </div><!-- END COL -->
	    		</div>
	    	</div>
	    </section>
	    
	    <!-- footer -->
		<jsp:include page="market_footer.jsp"></jsp:include>
		
		</div><!-- END COLORLIB-MAIN -->
	</div>
		
		  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<!-- bottom link -->
<jsp:include page="market_link_js.jsp"></jsp:include>
    
		

</body>
</html>