<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!--  header -->
	<%@ include file="top.jsp"%>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- 생년월일 달력으로 받기 위함 by sky -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
	
<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
	}
	#formtable{
		height: 400px
	}
	/* CSS used here will be applied after bootstrap.css */
	/* bootstrap Navigation Overriding */
	.navbar {
		background: #FFFFFF;
	}
	.navbar .navbar-center {
		display: inline-block;
		float: none;
		vertical-align: top;
		text-align: center;
	}
	#page_footer {
		height: 60px;
/* 		background: #f5f5f5; */
	}
	.footer_text {
		margin: 20px 0;
/* 		color: #777; */
	}
</style>

<script>
function execDaumPostcode() {   //주소 가져오는 api
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('roadAddress').value = fullRoadAddr;
					document.getElementById('jibunAddress').value = data.jibunAddress;

					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						//예상되는 도로명 주소에 조합형 주소를 추가한다.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr + ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';

					} else {
						document.getElementById('guide').innerHTML = '';
					}
				}
			}).open();
} // 다음에서의 라이브러리를 가져오기 위함.



//생년월일 달력으로 받기 위함 by sky
	$(function() {
		$( "#datepicker" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
		// 날짜 형식 yyyy-mm-dd로 변경
		$( "#datepicker" ).datepicker({
			dateFormat: "yy-mm-dd"
		});
		// 날짜 형식 getter
		var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
		// 날짜 형식 setter
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		
		// 년도 기간 변경 // 2015를 현재 년도로 가져올 수 있는 방법은????????
		$( "#datepicker" ).datepicker({
			yearRange: "1915:2015"
		});
		// 년도 기간 getter
		var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
		// 년도 기간 setter // 2015를 현재 년도로 가져올 수 있는 방법은????????
		$( "#datepicker" ).datepicker( "option", "yearRange", "1915:2015" );
	});   //생년월일 가져오는 function

	// 이거 비밀 번호인데 이런 방식으로 해도 되는지에 대해 생각해봐야 할 듯??????????????????
	// 비밀번호 똑같이 입력했는지 확인해서 뿌려줌
	$(function() {
		$('#pwdchk').keyup(function() {		
			$val_pwdchk = $(this).val();
			$val_pwd = $('#pwd').val();
			
			if ($val_pwdchk.length > 0) {
				$('#chkres').load('joinpwdchk?mempwd='+$val_pwd+'&pwdchk='+$val_pwdchk);
			}
		});
	});
	
	// 아이디 중복 체크
	$(function() {
		$('#idchk').click(function() {
			$.ajax({
				url: "idchk",
				type: "GET",
				data: {
					memid: $('#memid').val()
				},
				dataType: "html",
				
				success: function(res) {
					if (res == "exist") {
						$('#idchkres').html(res).css('color', 'red');
					}
					else {
						$('#idchkres').html(res).css('color', 'blue');
					}
				},
				error: function(a, b) {
					alert("Request: " + JSON.stringify(a));
				}
			});
		});
	});
	
	// 이메일 주소 중복 체크
	$(function() {
		$('#emailchk').click(function() {
			$.ajax({
				url: "emailchk",
				type: "GET",
				data: {
					mememail: $('#mememail').val()
				},
				dataType: "html",
				
// 				success: function(res) {
// 					if (res == "이미 존재하는 메일 주소 입니다.") {
// 						$('#emailchkres').html(res).css('color', 'red');
// 					}
// 					else {
// 						$('#emailchkres').html(res).css('color', 'blue');
// 					}
// 				},
				success: function(res) {
					if (res == "exist") {
						$('#emailchkres').html(res).css('color', 'red');
					}
					else {
						$('#emailchkres').html(res).css('color', 'blue');
					}
				},
				error: function(a, b) {
					alert("Request: " + JSON.stringify(a));
				}
			});
		});
	});
	
</script>

</head>
<body>

<form method="post" action="insertMember">
	<div>
		<img src="img/jointitle.png" width="200px">
<!-- 		<h1>회원가입 <small>일반회원가입</small> </h1> -->
		
		<table id="formtable">
		<!-- <tr> <th></th> <td></td> </tr> -->
			<tr>
				<th>아이디</th>
				<td>
					<!-- min, maxlength 줌 by sky 1021 -->
					<input type="text" class="form-control input-sm" placeholder="아이디" id="memid" name="memid" minlength="1" maxlength="20" />
					<!-- 중복 체크 결과용 div 추가 by sky 1021 -->
					<div id="idchkres"></div>
				</td> 
				<td>
					<!-- id 값 추가 by sky 1021 -->
					<button type="button" class="btn btn-default btn-sm" id="idchk"> 중복체크 </button>
				</td> 
			</tr>
			
			<tr>
				<th>비밀번호</th>   
				<td> 
					<!-- id 값 추가 by sky 1021 -->
					<input type="password" class="form-control input-sm" placeholder="비밀번호(8자리 이상)" id="pwd" name="mempwd" minlength="8" maxlength=20">
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>비밀번호 재확인</th>  
				<td>
					<!-- id, name 값 추가, placeholder 값 변경 by sky 1021 -->
					<input type="password" class="form-control input-sm" placeholder="비밀번호 재확인" id="pwdchk" name="pwdchk" />
				</td> 
				<!-- id 값 추가 by sky 1021 -->
				<td id="chkres"></td> 
			</tr>
			
			<tr> 
				<th>이름</th>
				<td>
					<input class="form-control input-sm" placeholder="이름" name="memname">
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>생년월일</th>   
				<td>
					<input class="form-control input-sm" type="text" placeholder="생년월일 (클릭)" id="datepicker" name="membirth" readonly="readonly"  />
				</td> 
				<td></td> 
			</tr>
			
			<!-- 이메일 받는 부분 추가 by sky 1021 -->
			<tr> 
				<th>이메일</th>
				<td>
					<input type="email" class="form-control input-sm" placeholder="이메일 주소 (abc@abc.com)" 
					name="mememail" id="mememail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
					<!-- 중복 체크 결과용 div 추가 by sky 1021 -->
					<div id="emailchkres"></div>
				</td> 
				<td>
					<!-- id 값 추가 by sky 1021 -->
					<button type="button" class="btn btn-default btn-sm" id="emailchk"> 중복체크 </button>
				</td> 
			</tr>
			
			<tr> 
				<th>전화번호</th>   
				<td>
					<!-- <div class="col-sm-3"> 사이즈 변경  by sky 1021 -->
					<div class="col-sm-4">
						<!-- name 값 추가 by sky 1021 -->
						<select class="form-control input-sm" id="sel1" name="memtelf">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
					</div>
					<!-- <div class="col-sm-7"> 사이즈 변경 by sky 1021 -->
					<div class="col-sm-8">
						<!-- 폼 안에 글 설정, name 값 추가, pattern 설정_숫자만 7~8자리 받을 수 있게 by sky 1021 -->
						<input class="form-control input-sm" placeholder=" - 없이 작성해주세요" name="memtelb" pattern="[0-9]{7,8}">
						<!-- <font size="1">-없이 작성해주세요</font> -->
					</div>
				</td> 
				<td>
				<!-- 요기요기 -->
				</td>
			</tr>
			<tr> 
				<th>주소</th>   
				<td>
					<!-- name 값 mempost로 변경 by sky 1021 -->
					<input id="post" name="mempost" class="form-control input-sm" type="text" placeholder="우편번호(검색)" readonly="readonly"/>
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">우편번호</button>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<!-- name 값 변경, placeholder 값 변경 by sky 1021 -->
					<input class="form-control input-sm" type="text" id="roadAddress" name="memdoroaddr" placeholder="도로명 주소" readonly="readonly"/>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<!-- name 값 변경, placeholder 값 변경 by sky 1021 -->
					<input class="form-control input-sm" type="text" id="jibunAddress" name="memjibunaddr" placeholder="지번 주소" readonly="readonly"/>
					<span id="guide" style="color:#999"></span>
				</td> 
			</tr>
		</table> 

		<table><tr height="30px"><td></td></tr></table>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('index')">　취　　소　</button>
<!-- 		<button type="button" class="btn btn-success btn-sm">　가　　입　</button> -->
		<button type="submit" class="btn btn-success btn-sm">　가　　입　</button>
	
	</div>
</form>

	<!--  bottom -->
<%@ include file="bottom.jsp"%>