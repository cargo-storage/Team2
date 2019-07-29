<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>NOTICE - TEAM2 WAREHOUSE</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<!-- CSS/CDN links-->
	<jsp:include page="../inc/head_link.jsp"></jsp:include>
	<link href="${contextPath }/css/board.css" rel="stylesheet">

</head>
<body>

<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>

	<section>
		<div class="container-fuild">
		<div class="row">
		
		<!--left Menu-->
		<jsp:include page="board_menu.jsp"></jsp:include>
			
		<div class="col-sm-10 mr-auto ml-auto" id="content">
        <div class="container mt-5">
      	
            <h1 class="text-center">공지사항</h1>
            <table class="table mt-5 table-hover table-bordered">
                  <tr class="text-center bg-light">
                     <th width="5%">번호</th>  
                     <th width="60%">제목</th>
                     <th width="10%">작성자</th>
                     <th width="10%">작성일</th>
                  </tr>
		<c:forEach var="boardn" items="${list}">
				<tr>
					<td class="text-center">${boardn.no}</td>
					<td><a href="${contextPath }/bo/NoticeViewAction.bo?no=${boardn.no}">
						${boardn.subject}
					</a></td>
					<td class="text-center"><a href="${contextPath}/bo/NoticeViewAction.bo?no=${boardn.no}">
						${boardn.name}
					</a></td>
					<td class="text-center"><fmt:formatDate value="${boardn.date}"/></td>
				</tr>
		</c:forEach>
            </table>
            
	            <ul class="pagination d-inline-block mx-auto">
	       <c:if test="${currentPage > 1}">
	              <li class="page-item">
	              	<a class="page-link" href="${contextPath}/bo/NoticeListAction.bo?currentPage=${currentPage-1}">&lt;</a>
	              </li>
	       </c:if>  
	            <li class="page-item">
	            	<a class="page-link" href="${contextPath}/bo/NoticeListAction.bo?currentPage=${currentPage}"> ${currentPage} </a>
	            </li>
	       <c:if test="${currentPage < lastPage}"> 
	              <li class="page-item">
	              	<a class="page-link" href="${contextPath}/bo/NoticeListAction.bo?currentPage=${currentPage+1}">&gt;</a>
	              </li>
	       </c:if>																				
	            </ul>
	            
           <div class="row d-inline-block">
            <form action="${contextPath}/bo/NoticeSearchAction.bo">
             
                <input type="text" name="search" class="form-control d-inline col-md-4">
            	<input type="submit" value="검색" class="btn btn-primary btn-sm ml-2">
       <c:if test="${sessionScope.mdto.admin == 1}">
                <a href="${contextPath}/bo/NoticeAddFormAction.bo" class="btn btn-primary btn-sm ml-2">작성하기</a>
    	</c:if>
            </form>
            </div>	
	            
         </div>
      	</div>
		</div>
		</div>
	</section>

        
<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!--         <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
</body>
</html>