<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:choose>   
	<c:when test="${sessionScope.mdto.name !=null }"><c:set var="mem_name" value="${sessionScope.mdto.name }"/></c:when>
</c:choose>
 

<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>예약 연장</title>

        <!--Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <!-- Bootstrap CSS / Color Scheme -->
        <link rel="stylesheet" href="../css/default.css" id="theme-color">
        
        <!-- font-awesome CSS -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		
		<!-- Page level plugin CSS-->
		<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">
		
		<style type="text/css">
			.table tr>td:not(.confirm){
				text-align: center;
			}
			.red{
				color: #ff3333;
			}
			.confirm{
				text-align: right;
			}
			
			section{
				background-image: url(../img/reservation.jpg);
				background-size: cover;
			}
			.background{
				background-color: rgba( 255, 255, 255, 0.9);
			}
			
		</style>
 
</head>

<body class="bg-light">
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">EXTENSION</span>
	                <h2 class="display-4">예약 연장</h2>
	                <p class="lead">예약 연장 및 추가 결제 정보를 확인하세요</p>
	            </div>
			</div>
						
			<form action="" method="post">
			<div class="my-3 p-3 background rounded shadow-sm">
			
			    <p class="lead pb-2 mb-0"><b>예약자 정보</b></p>
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="name" value="${map.name}" readonly="readonly"></td>
			    		
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">E-mail</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="email" value="${map.email}" readonly="readonly"></td>
			    		
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">휴대전화</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="phone" value="${map.phone}" readonly="readonly"></td>
			    	</tr>
			    </table>
		  </div>
		  
		  <div class="my-3 p-3 background rounded shadow-sm">
			    <p class="lead pb-2 mb-0"><b>추가 결제 정보</b></p>
			    <div class="row">
			    	<div class="col-lg-5 mx-auto">
				    	<div class="mb-3 calendar" id="calendar" ></div>
				    </div>
				    <div class="col-lg-7 mx-auto">
				    <table class="table">
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">사용하실 공간</p></td>
				    		<td><input type="text" class="form-control-plaintext" name="house" value="${map.house}" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">예약일</p></td>
				    		<td><input type="text" class="form-control" name="res_day" value="" readOnly></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">사용 시작일</p></td>
				    		<td><input type="text" class="form-control" name="start_day" value="${map.start_day}" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">사용 종료일<br><small class="text-muted">(공간 반납일)</small></p></td>
				    		<td><input type="text" class="form-control" name="end_day" value="${map.end_day}" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">총 사용 기간</p></td>
				    		<td><input type="text" class="form-control"  name="totalDay" value="" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td class=""><p class="red font-weight-bold pt-2 m-0">최종 금액</p></td>
				    		<td><input type="text" class="form-control" name="payment" value="0" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td colspan="2" class="confirm" >
		   						<strong class="red mr-2">내용을 모두 확인 하셨으면 결제하기 버튼을 눌러주세요.</strong>
		   						<input type="submit" class="btn btn-primary" value="결제하기">
		   						<a href="javascript: history.back()" class="btn btn-secondary">돌아가기</a>
		   					</td>
				    	</tr>
				    </table>
				    </div>
			    </div>
		  </div>		
		  </form>				
	
	        </div>          
	</section>



<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript-->
		<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
		<script src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Page level plugin JavaScript-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
		<script src="${contextPath}/vendor/pignose_calendar/pignose.calendar.full.min.js"></script>
	
		<!-- scripts for this page-->
<%--         <script src="${contextPath}/js/reservation_extension.js"></script> --%>
        <script type="text/javascript">
        var start_day = '${map.start_day}';
        var end_day = '${map.end_day}';
        var disable = ${diableRanges};
        $(document).ready(function() {
        	$('#calendar').pignoseCalendar({
            	lang: 'ko',
            	multiple: true,
            	minDate: moment(start_day)-1,
            	maxDate: disable,
        		init: function(context){
       	          $(this).pignoseCalendar('set', start_day+'~'+end_day);
        	       },
               	select: function(date, context) {
             
                    var $this = $(this);
                    var $element = context.element;
                    var $calendar = context.calendar;
                    
                    console.log(date[0], date[1]);
                    var end = date[0]._i
                    if(moment(end_day)>moment(end)){
                    alert("예약일을 줄일 수 없습니다!");
                    $('#calendar').pignoseCalendar('set', start_day+'~'+end_day);
                    }else{
                    $('#calendar').pignoseCalendar('set', start_day+'~'+end);
                    }
               }
            	});//end of pignoseCalendar

        });//end of onload
        </script>
    </body>
</html>
