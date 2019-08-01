<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("utf-8"); %>  

<c:choose>   
	<c:when test="${sessionScope.mdto.email != null }"><c:set var="mem_email" value="${sessionScope.mdto.email }"/></c:when>
</c:choose>
    
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>RESERVATION - TEAM2 WAREHOUSE</title>
    <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	

	<!-- Page level plugin CSS-->
	<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">
	
    
    
    <style type="text/css">
   	#inputArea{
	   	background-color: rgba(108, 117, 125, 0.2);
   	}
   	
   	section{
		background-image: url(../img/reservation3.jpg);
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
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">예약하기</h2>
	                <p class="lead">예약을 원하는 날짜를 선택하세요.</p>
	            </div>
			</div>
             <div class="row p-5 mt-5 background raised-box rounded">
             	<div class="m-auto">
					<c:set var="hn" value="${fn:substring(param.house,0,1)}"/>
					<img class="" alt="house${hn}" src="../img/house${hn}.png">
				</div>	
				<div class="float-right m-auto col-lg-6">
				<form class="form-group" method="post" action="./reserveCheck.me">
					<ul class="list-group rounded mb-3">
						<li class="list-group-item text-center">
						  <div>
						 	 <b>공간명</b>
						    <h4 id="houseName" class="my-0">${param.house }</h4>
						    <input type="hidden" name="house" value="${param.house }">
						  </div>
						</li>
						<li class="list-group-item">
				          <div>
							<label for="email" class="mt-1"><b>E-mail</b></label>
								<input type="text" class="form-control" id="email" name="email" value="${mem_email }" readonly=""><br>
							<label for="res_day" class="mt-1"><b>예약일</b></label>
								<input type="text" class="form-control" id="res_day" name="res_day" value="${res_day}" readonly=""><br>
							<label for="start_day" class="mt-1 strong"><b>사용 시작일</b><small class="text-muted ml-2">오늘 날짜 이후로 선택 가능합니다.</small></label>
							    <input type="text" class="form-control calendar" id="start_day" name="start_day" readonly="readonly" placeholder="click!"><br>
							<label for="end_day" class="mt-1"><b>사용 종료일</b><small class="text-muted ml-2">보관 최소기간은 15일입니다.</small></label>
							    <input type="text" class="form-control" id="end_day" name="end_day" readonly="readonly"><br>
				          </div>
				        </li>
						<li class="list-group-item text-center">
						  <input type="submit" class="mx-auto col-md-5 btn btn-primary" value="최종 금액 계산">
						</li>
					</ul>
				</form>
				</div>
	         </div>          
		</div>
	</section>

<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

		<!-- Page level plugin JavaScript-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
		<script src="${contextPath}/vendor/pignose_calendar/pignose.calendar.full.min.js"></script>

<script type="text/javascript">
    
    $(function() {
    	
    	$('#start_day').val("");
    	$('#end_day').val("");
    	
    	var dateRange = [];
		var innerDateRange = [];
		
   		<c:forEach var="idto" items="${rList }">
   			innerDateRange.push("${idto.start_day}");
   			innerDateRange.push("${idto.end_day}");
   			dateRange.push(innerDateRange);
   			innerDateRange = [];
   		</c:forEach>
		<c:forEach var="rdto" items="${rList2 }">
			innerDateRange.push("${rdto.start_day}");
			innerDateRange.push("${rdto.end_day}");
			dateRange.push(innerDateRange);
			innerDateRange = [];
   		</c:forEach>
		
		console.log(dateRange);
	
		$('input.calendar').pignoseCalendar({
			format: 'YYYY-MM-DD', // date format string. (2017-02-02)
			lang: 'ko',
			multiple: true,
			minDate: moment().add(1, 'd').format("YYYY-MM-DD"),
			disabledRanges: dateRange,
			buttons: true,
			apply: function(date, context) {
				var start = date[0]._i;
				var end = date[1]._i;
				
				console.log('일 차이: ', moment.duration(moment(end).diff(moment(start))).asDays());

				
 				$('#start_day').val(start);
 				$('#end_day').val(end);
			}
		});
    }); // function() - 끝
    
/* 
		var start_day;
		var end_day;
		var selectedRange = [];



		//시작일
      	 $('#start_day').datepicker({
              //dateFormat: "yy-mm-dd",
              monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
              dayNamesMin:["일","월","화","수","목","금","토"],
              dateFormat: "yy-mm-dd",             // 날짜의 형식
              changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
              minDate: 1,  //오늘포함 이전  날짜 선택 불가         
              beforeShowDay: function (date) {
            	  var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
                  return [dateRange.indexOf(dateString) == -1];
      	      }, // 이미 예약된 날짜 disabled
              onClose: function( selectedDate ) {   
            	 start_day = selectedDate;
            	 console.log(start_day);
            	 
                 selectedDate = new Date(selectedDate);
            	 selectedDate.setDate(selectedDate.getDate()+15); // 입력받은 날짜에서 +15일
            	 
                 $("#end_day").datepicker( "option", "minDate", selectedDate); //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
           	     return $("#end_day").datepicker("show");
                 
             }
          });
        
          //종료일
          $('#end_day').datepicker({
               //dateFormat: "yy-mm-dd",
               monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
               dayNamesMin:["일","월","화","수","목","금","토"], 
               dateFormat: "yy-mm-dd",
               changeMonth: true,
               beforeShowDay: function (date) {
         	        var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
         	        return [dateRange.indexOf(dateString) == -1];
       	       }, // 이미 예약된 날짜 disabled
       	       onClose: function( selectedDate ) {   
           	 		end_day=selectedDate;
           	 		console.log(end_day);
           	 		
           	 		// 선택된 시작일과 종료일 범위의 배열 생성
	           	 	for (var d = new Date(start_day); d <= new Date(end_day); d.setDate(d.getDate() + 1)) {
	           	 		selectedRange.push($.datepicker.formatDate('yy-mm-dd', d));
			        }
           	 		
	           	 	console.log(selectedRange);
	           	 	dup_check();
                
           		}
          });// end_date - 끝 
          
          // 예약된 날짜 배열(dateRange), 선택된 날짜 배열(selectedRange) 중복값비교
          function dup_check(){
        	  for(i = 0; i < selectedRange.length ; i++) {
        			for(j = 0; j < dateRange.length; j++) {
        				if(selectedRange[i] == dateRange[j]) {
       					 	$("#start_day").val("");
       						$("#end_day").val("");
        					alert("선택하신 날짜는 예약이 불가능합니다. 다시 선택 해 주세요.");
        					selectedRange = [];
        					return;
        				}
        			}
        		}
          }*/
    	
    
    
    	
</script>

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    </body>
</html>
