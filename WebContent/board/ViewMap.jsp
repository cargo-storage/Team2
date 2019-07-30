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
        <div class="container my-5">
      	
      	<div class="row">
            <div class="col-md-7 col-sm-9 mx-auto text-center">
            	<h1 class="text-center mb-0">오시는 길</h1>
            	<span class="text-muted">Location</span>
        	</div>
        </div>
        
        
        <div class="mx-auto">
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
			<div id="daumRoughmapContainer1563237107174" class="root_daum_roughmap root_daum_roughmap_landing mx-auto mt-5"></div>
	               
	        <!-- 2. 설치 스크립트  * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
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
	               
			<table class="t2 mx-auto mt-3">
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