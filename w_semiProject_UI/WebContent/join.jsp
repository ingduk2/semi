<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!--  header -->
	<%@ include file="top.jsp"%>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- ������� �޷����� �ޱ� ���� by sky -->
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
function execDaumPostcode() {   //�ּ� �������� api
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

					// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
					// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
					var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
					var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

					// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
					// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
					if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
					document.getElementById('post').value = data.zonecode; //5�ڸ� �������ȣ ���
					document.getElementById('roadAddress').value = fullRoadAddr;
					document.getElementById('jibunAddress').value = data.jibunAddress;

					// ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
					if (data.autoRoadAddress) {
						//����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : '
								+ expRoadAddr + ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById('guide').innerHTML = '(���� ���� �ּ� : '
								+ expJibunAddr + ')';

					} else {
						document.getElementById('guide').innerHTML = '';
					}
				}
			}).open();
} // ���������� ���̺귯���� �������� ����.



//������� �޷����� �ޱ� ���� by sky
	$(function() {
		$( "#datepicker" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
		// ��¥ ���� yyyy-mm-dd�� ����
		$( "#datepicker" ).datepicker({
			dateFormat: "yy-mm-dd"
		});
		// ��¥ ���� getter
		var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
		// ��¥ ���� setter
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		
		// �⵵ �Ⱓ ���� // 2015�� ���� �⵵�� ������ �� �ִ� �����????????
		$( "#datepicker" ).datepicker({
			yearRange: "1915:2015"
		});
		// �⵵ �Ⱓ getter
		var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
		// �⵵ �Ⱓ setter // 2015�� ���� �⵵�� ������ �� �ִ� �����????????
		$( "#datepicker" ).datepicker( "option", "yearRange", "1915:2015" );
	});   //������� �������� function

	// �̰� ��� ��ȣ�ε� �̷� ������� �ص� �Ǵ����� ���� �����غ��� �� ��??????????????????
	// ��й�ȣ �Ȱ��� �Է��ߴ��� Ȯ���ؼ� �ѷ���
	$(function() {
		$('#pwdchk').keyup(function() {		
			$val_pwdchk = $(this).val();
			$val_pwd = $('#pwd').val();
			
			if ($val_pwdchk.length > 0) {
				$('#chkres').load('joinpwdchk?mempwd='+$val_pwd+'&pwdchk='+$val_pwdchk);
			}
		});
	});
	
	// ���̵� �ߺ� üũ
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
	
	// �̸��� �ּ� �ߺ� üũ
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
// 					if (res == "�̹� �����ϴ� ���� �ּ� �Դϴ�.") {
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
<!-- 		<h1>ȸ������ <small>�Ϲ�ȸ������</small> </h1> -->
		
		<table id="formtable">
		<!-- <tr> <th></th> <td></td> </tr> -->
			<tr>
				<th>���̵�</th>
				<td>
					<!-- min, maxlength �� by sky 1021 -->
					<input type="text" class="form-control input-sm" placeholder="���̵�" id="memid" name="memid" minlength="1" maxlength="20" />
					<!-- �ߺ� üũ ����� div �߰� by sky 1021 -->
					<div id="idchkres"></div>
				</td> 
				<td>
					<!-- id �� �߰� by sky 1021 -->
					<button type="button" class="btn btn-default btn-sm" id="idchk"> �ߺ�üũ </button>
				</td> 
			</tr>
			
			<tr>
				<th>��й�ȣ</th>   
				<td> 
					<!-- id �� �߰� by sky 1021 -->
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ(8�ڸ� �̻�)" id="pwd" name="mempwd" minlength="8" maxlength=20">
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>��й�ȣ ��Ȯ��</th>  
				<td>
					<!-- id, name �� �߰�, placeholder �� ���� by sky 1021 -->
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ ��Ȯ��" id="pwdchk" name="pwdchk" />
				</td> 
				<!-- id �� �߰� by sky 1021 -->
				<td id="chkres"></td> 
			</tr>
			
			<tr> 
				<th>�̸�</th>
				<td>
					<input class="form-control input-sm" placeholder="�̸�" name="memname">
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>�������</th>   
				<td>
					<input class="form-control input-sm" type="text" placeholder="������� (Ŭ��)" id="datepicker" name="membirth" readonly="readonly"  />
				</td> 
				<td></td> 
			</tr>
			
			<!-- �̸��� �޴� �κ� �߰� by sky 1021 -->
			<tr> 
				<th>�̸���</th>
				<td>
					<input type="email" class="form-control input-sm" placeholder="�̸��� �ּ� (abc@abc.com)" 
					name="mememail" id="mememail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
					<!-- �ߺ� üũ ����� div �߰� by sky 1021 -->
					<div id="emailchkres"></div>
				</td> 
				<td>
					<!-- id �� �߰� by sky 1021 -->
					<button type="button" class="btn btn-default btn-sm" id="emailchk"> �ߺ�üũ </button>
				</td> 
			</tr>
			
			<tr> 
				<th>��ȭ��ȣ</th>   
				<td>
					<!-- <div class="col-sm-3"> ������ ����  by sky 1021 -->
					<div class="col-sm-4">
						<!-- name �� �߰� by sky 1021 -->
						<select class="form-control input-sm" id="sel1" name="memtelf">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
					</div>
					<!-- <div class="col-sm-7"> ������ ���� by sky 1021 -->
					<div class="col-sm-8">
						<!-- �� �ȿ� �� ����, name �� �߰�, pattern ����_���ڸ� 7~8�ڸ� ���� �� �ְ� by sky 1021 -->
						<input class="form-control input-sm" placeholder=" - ���� �ۼ����ּ���" name="memtelb" pattern="[0-9]{7,8}">
						<!-- <font size="1">-���� �ۼ����ּ���</font> -->
					</div>
				</td> 
				<td>
				<!-- ����� -->
				</td>
			</tr>
			<tr> 
				<th>�ּ�</th>   
				<td>
					<!-- name �� mempost�� ���� by sky 1021 -->
					<input id="post" name="mempost" class="form-control input-sm" type="text" placeholder="�����ȣ(�˻�)" readonly="readonly"/>
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">�����ȣ</button>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<!-- name �� ����, placeholder �� ���� by sky 1021 -->
					<input class="form-control input-sm" type="text" id="roadAddress" name="memdoroaddr" placeholder="���θ� �ּ�" readonly="readonly"/>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<!-- name �� ����, placeholder �� ���� by sky 1021 -->
					<input class="form-control input-sm" type="text" id="jibunAddress" name="memjibunaddr" placeholder="���� �ּ�" readonly="readonly"/>
					<span id="guide" style="color:#999"></span>
				</td> 
			</tr>
		</table> 

		<table><tr height="30px"><td></td></tr></table>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('index')">���롡���ҡ�</button>
<!-- 		<button type="button" class="btn btn-success btn-sm">���������ԡ�</button> -->
		<button type="submit" class="btn btn-success btn-sm">���������ԡ�</button>
	
	</div>
</form>

	<!--  bottom -->
<%@ include file="bottom.jsp"%>