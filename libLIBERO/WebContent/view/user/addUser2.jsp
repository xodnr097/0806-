<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/common/cdn.jsp"></jsp:include>
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

   
<script type="text/javascript">
//카카오 주소 API 사용
    function daumjuso() {
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

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//                     if(extraAddr !== ''){
//                         extraAddr = ' (' + extraAddr + ')';
//                     }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postCode").value = data.zonecode;
                document.getElementById("address").value = data.zonecode+addr+extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("postCode").focus();
            }
        }).open();
    }

	$(function (){
		$("#userId").focus();
		$("input[name=userId]").on("keyup", function(){
			var userId = $("input[name=userId]").val();
			alert(userId);
			
			
				$.ajax({	url :'/libero/user/json/duplicationCheck?userId='+userId,
							method : 'GET',
							dataType : 'text',
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
									  },
						    success : function(result , status){
							console.log(result);
							var check = result;
							alert(check);
							if(check){
								$("#userId").attr("class","form-control-invalid")
							}else{
								$("#userId").attr("class","form-control-valid")
							}
						}
					});
		});
		
		$("#emailcheck").on("click",function(){
			$.ajax(
					{	url : "/libero/user/json/emailSend?userId="+$("#userId").val(),
						method : "GET" ,
						dataType : "json" ,
						headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
									}
						,success : function vcode(JSONData , status) {
							var json = JSONData.verifCode
						//알림 하나 띄우고 인증코드 입력 열기
						$("#verifDiv").show()
 						$("#inputVerification").val(json);
						alert("1"+  $("#inputVerification").val(json).val())
						swal("메일이 발송 되었습니다!", "작성하신 이메일을 확인해 주세요", "success");
						
						//Debug...
						}
						
					});//$.ajax 끝
					
					
					
					
					});//$("#emailcheck").on끝
					
					
					$("#verifBtn").on("click",function(){
						alert( $("inputVerification").val())
						alert($("#verification").val())
						if( $("#inputVerification").val() != $("#verification").val()){
							swal("인증번호가 다릅니다 다시 확인해 주세요!","헤헤 바보 :p","error")
						}else{
							swal("인증 되었습니다!","\\YAY/","success")
						}
					})
		});
		//$(function)끝
	//////////////////////////////////인증 번호 확인
		
	 //////////////////////////////////가입 버튼
	</script>

</head>
<body>


<div class="container">

<div class="card">

    <h5 class="card-header brown lighten-1 white-text text-center py-4">
        <strong>회원가입</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center" style="color: #bcaaa4;" action="#!">
                   <!-- ID -->
                   <br><br>
            <div class="md-form mt-0">
                <input type="email" id="userId" class="form-control">
                <label for="userId">아이디</label>
                <button id="emailcheck" class="btn btn-cyan brown lighten-1" type="button">이메일 인증</button>
            </div>
               <input type="hidden" id="inputVerification" name ="inputVerification">
               
            <div class="md-form mt-0"id="verifDiv" style="display : none">
                <input type="text" class="form-control" id="verification" name="verification">
                <label for="verification">인증 번호</label>  
                <button type="button" id="verifBtn" class="btn btn-cyan brown lighten-1">확인</button> 
            </div>
              
                    <!-- Password -->
            <div class="md-form mt-0">
                <input type="password" id="password" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                <label for="password">비밀번호</label>
            </div>
            
         
            <!-- Phone number -->
           <div class="form-group row">         	
	            <div class="col-sm-2">
	            <label for="phone1" class="form-control">연락처</label>
	                <input type="text" id="phone1" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock" maxlength="4">
	            </div>
	            <div class="col-sm-3">
	                <input type="text" id="phone2" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock" maxlength="4">
	            </div>
	             <div class="col-sm-3">
	                <input type="text" id="phone3" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock" maxlength="4">
	             </div>
		   </div>
            <!-- Address -->
                    	
	            <div class="md-form col">
	                <input type="text" id="postCode" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock">
	                <label for="adress">주소</label>
	                <small id="adress" class="form-text text-muted mb-4"> 
	                </small>
	            </div>
	            <div class="md-form col">
	                <input type="text" id="address" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock" maxlength="4">
	            </div>
	             <div class="md-form col">
	                <input type="text" id="extraAddress" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock" maxlength="4">
	             </div>
	             <input type="hidden" name="address">
	             <div class="md-form col">
	             	<button class="btn btn-cyan brown lighten-1" onClick="daumjuso()">우편번호 찾기</button>
	             
	             </div>
		  
           	 	<button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Sign in</button>

            <!-- Social register -->
          

        </form>
        <!-- Form -->

    </div>

</div>

</div>


</body>
</html>