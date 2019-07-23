<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- CSS/CDN links-->
<jsp:include page="../inc/head_link.jsp"></jsp:include>	

<style type="text/css">
   	#inputArea{
	   	background-color: rgba(108, 117, 125, 0.2);
   	}
   	
   	section{
		background-image: url(../img/reservation2.jpg);
		background-size: cover;
	}
	.background{
		background-color: rgba( 0, 0, 0, 0.9);
	}
	
	.info{
		max-width: 80%;
		margin: auto auto;
	}
	.border{
		border-right: 2px solid #ffffff;
		border-left: none;
	}
</style>
	
</head>
<body>
     
<section class="py-7">
     	 <div class="info">	
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">INFORMATION</span>
	                <h2 class="display-4">HOUSE INFORMATION</h2>
	            </div>
			</div>
			
             <div class="row p-5 mt-5 background raised-box rounded">
             	
             	<table class="table p-1">
             		<tr>
             			<td>
             				<img class="col-md-6 d-inline" alt="houseA" src="../img/houseA_i.png">
             				<div class="d-inline">
	             				<h1 class="text-white">HOUSE A</h1>
	             				<span>
	             				스토리지 크기<br>
								면적: 1.0 제곱미터 ~ 3.9 제곱미터<br>
								(0.3평 ~ 1.2평)<br>
								높이: 2.4 미터 이상<br>
								개인용 원룸 이사짐 (책장, 침대세트,책상 등),<br>
								계절용품 등 1 톤 화물차 1대 적재 분량의 크기<br>
								</span>
							</div>
             			</td>
             			<td class="text-center">
             				<img class="col-md-8" alt="houseB" src="../img/houseB_i.png">
             				<span class="d-block">
             				스토리지 크기<br>
							면적: 1.0 제곱미터 ~ 3.9 제곱미터 (0.3평 ~ 1.2평)<br>
							높이: 2.4 미터 이상<br>
							개인용 원룸 이사짐 (책장, 침대세트,책상 등),<br>
							계절용품 등 1 톤 화물차 1대 적재 분량의 크기<br>
							</span>
             			</td>
             		</tr>
             		<tr class="text-center">
             			<td>
             				<img class="col-md-8" alt="houseC" src="../img/houseC_i.png">
             				<span class="d-block">
             				스토리지 크기<br>
							면적: 1.0 제곱미터 ~ 3.9 제곱미터 (0.3평 ~ 1.2평)<br>
							높이: 2.4 미터 이상<br>
							개인용 원룸 이사짐 (책장, 침대세트,책상 등),<br>
							계절용품 등 1 톤 화물차 1대 적재 분량의 크기<br>
							</span>
             			</td>
             			<td>
             				<img class="col-md-11" alt="houseD" src="../img/houseD_i.png">
             				<span class="d-block">
             				스토리지 크기<br>
							면적: 1.0 제곱미터 ~ 3.9 제곱미터 (0.3평 ~ 1.2평)<br>
							높이: 2.4 미터 이상<br>
							개인용 원룸 이사짐 (책장, 침대세트,책상 등),<br>
							계절용품 등 1 톤 화물차 1대 적재 분량의 크기<br>
							</span>
							
							
             			</td>
             		</tr>
             		<tr>
             			<td></td>
             			<td></td>
             		</tr>
             	</table>
<!--              	<div class="col-lg-4"> -->
<!-- 					<img class="" alt="houseA" src="../img/houseA_i.png"> -->
<!-- 				</div> -->
					
<!-- 				<div class="col-lg-8"> -->
					
<!-- 				</div> -->
	         </div>          
		</div>
</section>

</body>
</html>