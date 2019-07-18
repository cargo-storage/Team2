<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>MODIFY - TEAM2 WAREHOUSE</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<!--Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	
	<!-- Bootstrap CSS / Color Scheme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath }/css/default.css" id="theme-color">
	<!-- font-awesome CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
	<link href="${contextPath }/css/font.css" rel="stylesheet">
	
	<!-- jquery.js -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<style  type="text/css">
				
		.pwdCheck{
			position: absolute;
		    top: 237px;
		    right: 15px;
		    height: calc(1.5em + .75rem + 2px);
		    padding: .375rem .75rem;
		    border: 1px solid #00c853;
		    border-radius: 3px;
		    background-color: #00c853;
		    color: white;
		}
		
		.pwdCheck:HOVER{
			background-color: #00a243;
		}

		.post {
			height: calc(1.5em + .75rem + 2px);
			padding: .375rem .75rem;
			font-weight: 400;
			line-height: 1.5;
			color: #495057;
			background-color: #fff;
			background-clip: padding-box;
			border: 1px solid #ced4da;
			border-radius: .25rem;
			transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
		}
		
		.post_btn{
			height: calc(1.5em + .75rem + 2px);
			padding: .375rem .75rem;
		}
		
		.post1 {
			width: 100%;
		}
		
		.btn_submit{
			background-color: #00c853;
		    color: white;
		    width: 100%;
		}
		
		.btn_submit:HOVER{
			background-color: #00a243;
			color: white;
		}

		.help-block {
			color: red;
			font-size: 12px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			//비밀번호 갱신 숨김
			$("#check").hide();
			
			//기존 비밀번호 체크
			$("#currentPwd").blur(function(){
				var currentPwd = $(this).val();
				if(currentPwd ==''){
					$("#currentPwd").text("필수 입력 사항입니다.");
				}else{
					$.ajax({
						type: "post",
						async: false,
						url: "${contextPath}/me/pwdCheck.me",
						data: {currentPwd : currentPwd},
						success: function(data){
							if(data == 0){
								$("#currentPwdErr").text("비밀번호가 틀립니다.");
							}else{
								$("#currentPwdErr").text('');
							}
						},
						error: function(){
							alert("서버 내부 에러가 발생했습니다.");
						}
					});
				}
			});
			
			//비밀번호 체크
			$("#newPwd").blur(function(){
				var newPwd = $(this).val();
				if(newPwd ==''){
					$("#newPwdErr").text("필수 입력 사항입니다.");
				}else{
					var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}/;
					if(!reg.test(newPwd)){
						$("#newPwdErr").text("비밀번호 형식이 맞지 않습니다.");
					}else{		
						$("#newPwdErr").text('');
						if($("#pwd2").val() != newPwd){
							$("#pwd2Err").text("비밀번호 확인이 맞지 않습니다.");
						}else{$("#pwd2Err").text('');}
					}
				}
			});
			
			//비밀번호 확인
			$("#pwd2").blur(function(){
				var pwd2 = $("#pwd2").val();
				if(pwd2 ==''){
					$("#pwd2Err").text("필수 입력 사항입니다.");
				}else{
					if($("#newPwd").val() != pwd2){
						$("#pwd2Err").text("비밀번호 확인이 맞지 않습니다.");
					}else{$("#pwd2Err").text(''); }
				}
			});
			
			//이름 확인
			$("#name").blur(function(){
				var name = $(this).val();
				if(name ==''){
					$("#nameErr").text("필수 입력 사항입니다.");
				}else{
					var reg = /^[가-힣]{2,5}$/;
					if(!reg.test(name)){
						$("#nameErr").text("정확한 이름을 입력하세요.");
					}else{ $("#nameErr").text(''); }
				}
			});
			
			//휴대폰 확인
			$("#phone").blur(function(){
				var phone = $(this).val();
				if(phone ==''){
					$("#phoneErr").text("필수 입력 사항입니다.");
				}else{ 
					var reg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
					if(!reg.test(phone)){
						$("#phoneErr").text("양식에 맞는 휴대폰 번호를 입력하세요");
					}else{ $("#phoneErr").text(''); }
				}
			});
		});
		
		function pwdCheck() {
			var currentPwd = $("#currentPwd").val();
			if(currentPwd==''){
				alert("기존 비밀번호를 입력해주세요.");
			}
			else if($("#currentPwdErr").text() !=''){
				alert("기존 비밀번호가 다릅니다.");
			}else{
				$("#check").show();
			}
		}
			
		function modify(){
			var result = 1;
			var currentPwd = $("#currentPwd");
			var newPwd = $("#newPwd");
			var name = $("#name");
			var phone = $("#phone");
			var postCode = $("#postCode");
			var detailAddr = $("#detailAddr");
			
			if(currentPwd.val()==''){
				$("#currentPwdErr").text("필수 입력 사항입니다.");
				result = 0;
			}
			if(newPwd.val()=='') {
				$("#newPwd").val(currentPwd.val());
			} 
			if(detailAddr.val()==''){
				$("#addrErr").text("필수 입력 사항입니다.");
				result = 0;
			}
			else{
				$("#addrErr").text('');
			}
			
			if(result==0){
				alert("필수 사항을 기입해주세요.");
				return false;
			}
			
			if($("#currentPwdErr").text()!=''||$("#pwdErr").text()!=''||$("#pwd2Err").text()!=''
					||$("#nameErr").text()!=''||$("#phoneErr").text()!=''
					||$("#addrErr").text()!=''||$("#emailErr").text()!=''){
				alert("오류 사항을 확인 후 다시 입력해주세요.");
				return false;
			} 
			
		}
	</script>
</head>
<body>
	<div class="container">
		<div class="row p-5 background raised-box rounded">
			<div class="col-sm-9 col-lg-6 m-auto">
			<div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
				<span class="text-muted text-uppercase">MODIFY MEMBER</span>
				<h2 class="display-4">회원 정보 수정</h2>
				<c:if test="${empty requestScope.modifyCheck}">
					<p class="lead">안전한 수정을 위해<br>비밀번호를 입력하세요!</p>
				</c:if>
	      	</div>
	      	<c:choose>
	      		<c:when test="${requestScope.modifyCheck ne	1}">
	      		<div class="m-auto">
		      		<form action="${contextPath }/me/modifyCheck.me" method="post">
		      			<div class="form-group ml-6">
			      			<label for="checkPwd">비밀번호</label>
			      			<div class="row">
				      			<input type="password" class="form-control col-8 mr-3" id="checkPwd" name="checkPwd" placeholder="비밀번호를 입력해 주세요">
				      			<input type="submit" class="btn btn-primary btn-block btn-lg col-2" value="확인" style="height: calc(1.5em + .75rem + 2px); line-height: 0.6">
		      				</div>
		      			</div>
		      			<input type="hidden" name="email" value="${sessionScope.mdto.email }">
		      		</form>
	      		</div>
	      		</c:when>
	      		<c:otherwise>
		      		<form action="${contextPath }/me/modifyMember.me?page=next" method="post" onsubmit="return modify()">
						<div class="form-group">
							<label for="email">이메일</label>
							<input type="email" class="form-control" id="email" name="email" value="${sessionScope.mdto.email }" readonly>
							<span id="emailErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="currentPwd">기존 비밀번호</label> 
							<input type="password" class="form-control" id="currentPwd" placeholder="비밀번호를 입력해 주세요">
							<input type="button" class="pwdCheck" value="비밀번호 변경" onclick="pwdCheck()">
							<span id="currentPwdErr" class="help-block"></span>
						</div>
						<div id="check">
							<div class="form-group">
								<label for="newPwd">새로운 비밀번호</label>
								<input type="password" class="form-control" id="newPwd" name="pwd" placeholder="새로운 비밀번호를 입력해주세요">
								<span id="newPwdErr" class="help-block"></span>
							</div>
							<div class="form-group">
								<label for="pwd2">비밀번호 확인</label>
								<input type="password" class="form-control" id="pwd2" placeholder="비밀번호를 다시한번 입력 해 주세요">
								<span id="pwd2Err" class="help-block"></span>
							</div>
						</div>	
						<div class="form-group">
							<label for="name">성명</label>
							<input type="text" class="form-control" id="name" name="name" value="${sessionScope.mdto.name }">
							<span id="nameErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="phone">휴대폰 번호<span class="help-block">(010-1234-1234 형식)</span></label>
							<input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.mdto.phone }">
							<span id="phoneErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="detailAddr">집 주소</label>
							<div style="width:100%; margin-bottom: 5px;">
								<input type="text" id="postCode" name="postCode" class="post" value="${sessionScope.mdto.postCode }" readonly>
								<input type="button" onclick="execPostcode()" class="post_btn" value="우편번호 찾기">
							</div>
							<div style="width:100%; margin-bottom: 5px;">
								<input type="text" id="roadAddr" name="roadAddr" class="post post1" value="${sessionScope.mdto.roadAddr }" readonly>
							</div>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddr" name="detailAddr" class="post post1" value="${sessionScope.mdto.detailAddr }">
							<span id="addrErr" class="help-block clear"></span>	
						</div>
						<br>
						<br>
						<input type="hidden" name="admin" value="${sessionScope.mdto.admin }">
						<input type="hidden" name="reg_date" value="${sessionScope.mdto.reg_date }">
						<div class="form-group text-center">
							<button class="btn btn_submit">
								회원 정보 수정 <i class="fa fa-check spaceLeft"></i>
							</button>&nbsp;&nbsp;
						</div>
					</form>
	      		</c:otherwise>
	      	</c:choose>
			</div>
		</div>
	</div>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execPostcode() {
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
</script>
</body>
</html>