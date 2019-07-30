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
    
  </head>
  <body>

	<div id="colorlib-page">
		
		<!-- navbar -->
		<jsp:include page="market_nav.jsp"></jsp:include>
		
		<div class="mt-5">
			<!-- header -->
			<jsp:include page="market_header.jsp"></jsp:include>
			
			<section class="ftco-section mb-5">
	    	<div class="container">
	    		<div class="row">
	    			<div class="col-lg-12 ftco-animate">
	            <div class="comment-form-wrap pt-5">
	            <h2 class="mb-3 font-weight-bold">POST ITEMS</h2>
	                
	                
	                
	                <!-- ********************* 글쓰기 폼***************  -->
	                <form action="${contextPath }/mk/postItem.do" class="p-3 p-md-5 bg-light">
	                  <div class="form-group">
	                    <label for="name">Item *</label>
	                    <input type="text" class="form-control" name="item">
	                  </div>
	                  <div class="form-group">
	                    <label for="name">Title *</label>
	                    <input type="text" class="form-control" name="title">
	                  </div>
	                  <div class="form-group">
	                    <label for="name">Image *</label>
	                    <input type="text" class="form-control" name="image">
	                  </div>
<!-- 	                  <div class="form-group"> -->
<!-- 	                    <label for="email">Title *</label> -->
<!-- 	                    <input type="email" class="form-control" id="title"> -->
<!-- 	                  </div> -->
<!-- 	                  <div class="form-group"> -->
<!-- 	                    <label for="website">Image</label> -->
<!-- 	                    <input type="url" class="form-control" id="image"> -->
<!-- 	                  </div> -->

	                  <div class="form-group">
	                    <label for="message">Content</label>
	                    <textarea name="content" cols="30" rows="10" class="form-control"></textarea>
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


<!-- bottom link -->
<jsp:include page="market_link_js.jsp"></jsp:include>
    
		

</body>
</html>