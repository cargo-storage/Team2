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
      <li><a href="${contextPath}/bo/NoticeListAction.bo">공지사항</a></li>
      <li><a href="${contextPath}/bo/FAQ.bo">자주하는 질문</a></li>
      <li><a href="${contextPath}/bo/QuestionListAction.bo">문의 하기</a></li>
      <li><a href="#">1:1 실시간 상담</a></li> 
      <li><a href="${contextPath}/bo/ViewMap.bo">오시는 길</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->
</nav>
<!-- 왼쪽메뉴 -->
 <section class="py-7" id="oo">
<div align="center">
<h2>오시는 길</h2>
                <!-- -----------------------지도---------------------------- -->
                    <!-- <div id="map" style="width:500px;height:400px;"></div>
                    
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=307404c2f277ccff2e8934cf340a8986"></script>
      
               <script type="text/javascript">
                  var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                  var options = { //지도를 생성할 때 필요한 기본 옵션
                     center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
                     level: 3 //지도의 레벨(확대, 축소 정도)
                  };
         
                  var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
                  
                  
               </script> -->
               <!-- * 카카오맵 - 지도퍼가기 -->
               <!-- 1. 지도 노드 -->
               <div id="daumRoughmapContainer1563237107174" class="root_daum_roughmap root_daum_roughmap_landing"></div>
               
               <!--
                  2. 설치 스크립트
                  * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
               -->
               <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
               
               <!-- 3. 실행 스크립트 -->
               <script charset="UTF-8">
                  new daum.roughmap.Lander({
                     "timestamp" : "1563237107174",
                     "key" : "ud7a",
                     "mapWidth" : "640",
                     "mapHeight" : "360"
                  }).render();
               </script>
               
	<table class="t2">
		<tr>
			<td>지하철</td>
			<td>8번출구 와서 꺽어</td>
		</tr>
		<tr>
			<td>버스</td>
			<td>138타고와서 가</td>
		</tr>
		<tr>
			<td>승용차</td>
			<td>주차는 아무대나</td>
		</tr>
</table>
</div>
</section>     

         <jsp:include page="../inc/footer.jsp"></jsp:include>
     

      

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>