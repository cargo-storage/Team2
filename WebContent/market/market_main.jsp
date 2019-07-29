<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>TEAM2 WAREHOUSE MARKET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<!-- css/cdn links -->
	<jsp:include page="market_link.jsp"></jsp:include>
    
    
    <c:set var="email" value="${sessionScope.mdto.email }"/>
    <c:if test="${email==null }">
    	<script type="text/javascript">
    		alert("로그인 후 이용가능합니다.");
    		location.href="${contextPath}/co/login.go";
    	</script>
    </c:if>
    
    <script type="text/javascript">
    	function goPage(page){
    		location.href=""
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
	    	<div class="col-lg-12">
	    				
   				<!-- 아이템분류 -->
				<div class="ftco-bread mb-5">
				<div class="row">
				    <div class="col-md-9 ftco-animatev fadeInUp ftco-animated">
						<p class="breadcrumbs" id="category" >
							<span class="mr-2"><a href="./market.do?cate=all" <c:if test="${category=='all'||category==null }">class="selected"</c:if>>
								ALL ITEMS</a></span>
							<span class="mr-2"><a href="./market.do?cate=fur" <c:if test="${category=='fur' }">class="selected"</c:if>>
								FURNITURE</a></span>
							<span class="mr-2"><a href="./market.do?cate=elec" <c:if test="${category=='elec' }">class="selected"</c:if>>
								ELECTRONIC</a></span>
							<span class="mr-2"><a href="./market.do?cate=mat" <c:if test="${category=='mat' }">class="selected"</c:if>>
								TOOL/MATERIAL</a></span>
							<span><a href="./market.do?cate=oth" <c:if test="${category=='oth' }">class="selected"</c:if>>
								OTHERS</a></span>
						</p>
					</div>
					
					<!-- 검색 -->
					<form action="./market.do" class="search-form" id="searchFrm">
		                <div class="form-group">
		                  <a href="#" onclick="document.getElementById('searchFrm').submit();"><span class="icon icon-search"></span></a>
		                  <input type="hidden" name="cate" value="${category }">
		                  <input type="text" id="keyword" name="keyword" class="rounded form-control" placeholder="SEARCH">
		            	</div>
		            </form>
		            
			    </div>
				</div>
	    	
	    	
	    			
			    <!-- 아이템 리스트 영역 -->
			    <div class="row">
		<c:forEach var="bdto" items="${requestScope.boardList }">
					<div class="col-md-4">
					<div class="blog-entry ftco-animate">
						<a href="${contextPath }/mk/showcontent.do?no=${bdto.no}" class="img"
							style="background-image: url(${contextPath}/market/uploaded/${bdto.image }); background-size: contain;"></a>
						<div class="text text-2 pt-2 mt-3">
					    	<h3 class="mb-2 d-inline"><a href="single.html">${bdto.title }</a></h3>
					    	<div class="meta-wrap">
								<p class="meta">
					         		<small><span class="icon-calendar"></span> ${bdto.date}</small>
			<%-- 	         		<span><a href="single.html">${bdto.price }</a></span> --%>
			<!-- 	         		<span>5 Comment</span> -->
					         	</p>
					        </div>
					    	<p class="mb-4">${bdto.content }</p>
					    </div>
					</div>
					</div>
		</c:forEach>
				</div>
			    	
				<!-- 페이징-->
		    	<div class="d-block row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
			<%-- <c:if test="${not paging.isFirstGroup}">
						<li><a href="${contextPath }/mk/market.do?page=${paging.startPageNum -1}">&lt;</a></li>
			</c:if>  --%>
		    <c:forEach var="i" begin="${paging.startPageNum }" end="${paging.lastPageNum }">
		    	<c:choose>
	                <c:when test="${i eq paging.nowPage}"><li class="active"><span>${i }</span></li></c:when>
	                <c:otherwise><li><a href="${contextPath }/mk/market.do?page=${i}">${i }</a></li></c:otherwise>
            	</c:choose>
		    </c:forEach>
		   <%--  <c:if test="${not paging.isLastGroup}">
						<li><a href="${contextPath }/mk/market.do?page=${paging.lastPageNum +1}">&gt;</a></li>
			</c:if> --%>            
		                <!-- <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li> -->
		              </ul>
		            </div>
		          </div>
		        </div> 
		        
		        
		        
	    	</div>
	    	</div>
	    	</div>
	    	
	 <div>   			
${nowPage }&nbsp;${nowGroup }&nbsp;${recPerPage }&nbsp;${pagePerGroup }&nbsp;${totalRecord }
&nbsp;${totalPage }&nbsp;${totalGroup }&nbsp;${lastPageNum }&nbsp;${startPageNum }
&nbsp;${isFirstGroup }&nbsp;${isLastGroup }
	    	</div>
		</section>
		

	    
	    <!-- footer -->
		<jsp:include page="market_footer.jsp"></jsp:include>
 	   
	</div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
	<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
	<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg>
</div>


<!-- bottom link -->
<jsp:include page="market_link_js.jsp"></jsp:include>
    
</body>
</html>