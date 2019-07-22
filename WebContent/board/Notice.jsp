<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
        <!-- font-awesome CSS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <style>
           
   #page-wrapper {
    padding-left: 250px;
  	padding-top: 83px;
  	background-color: #999;
   }
  
  #sidebar-wrapper {
    position: fixed;
    width: 200px;
    height: 100%;
    margin-left: -250px;
    background: white;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 200px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #399;
  }
  
  .sidebar-nav li a:hover {
    color: #ff6600;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
 
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
        	<jsp:include page="../inc/header.jsp"></jsp:include>
    </head>
    <body data-spy="scroll" data-target="#lambda-navbar" data-offset="0">


<!-- 왼쪽메뉴 -->
<nav id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="CustomerSupport.jsp">고객지원</a>
      </li>
		<li><a href="${contextPath}/NoticeListAction.bo">공지사항</a></li>
		<li><a href="FAQ.jsp">자주하는 질문</a></li>
		<li><a href="${contextPath}/bo/QuestionListAction.bo">문의 하기</a></li>
		<li><a href="#">1:1 실시간 상담</a></li>
		<li><a href="ViewMap.jsp">오시는 길</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->
</nav>
<!-- 왼쪽메뉴 -->

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
           <div class="container" >
      <div class="boardn">
         <div class="col-sm-12" align="center">
            <h2>공지사항</h2>
            <br>
            <table class="table mx-3 table-hover table-striped table-bordered">
               <thead class="thead-light">
                  <tr>
                     <th width="5%" style="text-align: center">번호</th>  
                     <th width="60%">제목</th>
                     <th width="10%" style="text-align: center">작성자</th>
                     <th width="10%" style="text-align: center">작성일</th>
                  </tr>
                  
		<c:forEach var="boardn" items="${list}">
			<tr>
				<td>${boardn.no}</td>
				<td>
					<a href="${pageContext.request.contextPath}/bo/NoticeViewAction.bo?no=${boardn.no}">
					${boardn.subject}
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/bo/NoticeViewAction.bo?no=${boardn.no}">
					${boardn.name}
					</a>
				</td>
				<td>
					<fmt:formatDate value="${boardn.date}"/>
				</td>
			</tr>
		</c:forEach>
                   </thead>
               <tbody>
            
               
               </tbody>
               <tfoot>
                  <tr>
                     <td colspan="2">
                         <ul class="pagination">
                        <c:if test="${currentPage > 1}">
                          <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/bo/NoticeListAction.bo?currentPage=${currentPage-1}"> < </a></li>
                        </c:if>  
                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/bo/NoticeListAction.bo?currentPage=${currentPage}"> ${currentPage} </a></li>
                        <c:if test="${currentPage < lastPage}"> 
                          <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/bo/NoticeListAction.bo?currentPage=${currentPage+1}">></a></li>
                        </c:if>																				
                        </ul>
                     </td>
                     <td colspan="3">
                                           
                      	 <form action="${pageContext.request.contextPath}/bo/NoticeSearchAction.bo">
                         <input type="text" name="search" class="input_box" size="9">
                     	   <input type="submit" value="검색" class="btn btn-primary btn-sm">
                       <c:if test="${sessionScope.mdto.admin==1}">
                         <a href="${contextPath}/bo/NoticeAddFormAction.bo" class="btn btn-primary btn-sm">작성하기</a>
             			</c:if>
                        </form>
                     </td>
                  </tr>
               </tfoot>
            </table>
         </div>
      </div>
</div>
     

        
     

      

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>