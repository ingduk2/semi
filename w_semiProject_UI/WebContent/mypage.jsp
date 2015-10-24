<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!--  header -->
	<%@ include file="top.jsp"%>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
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
				
				success: function(res) {
					if (res == "�̹� �����ϴ� ���� �ּ� �Դϴ�.") {
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



<!-- form �߰� by sky 1022 -->
<div>
<form method="post" action="updateMember">

		<img src="img/mypagetitle.png" width="240px">
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		
		<table id="formtable">
		<!-- <tr> <th></th> <td></td> </tr> -->
			<tr>
				<th>���̵�</th>
				<td width="300px">
					<input type="text" class="form-control input-sm" value="${result.memid}" name="memid" readonly="readonly"/>
				</td>
				<td></td> 
			</tr>
			
			<tr>
				<th>��й�ȣ</th>   
				<td> 
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ(8�ڸ� �̻�)" value="${result.mempwd}" id="pwd" name="mempwd" minlength="8" maxlength=20">
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>��й�ȣ ��Ȯ��</th>  
				<td>
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ ��Ȯ��" id="pwdchk" name="pwdchk" />
				</td> 
				<!-- id �� �߰� by sky 1022 -->
				<td id="chkres"></td> 
			</tr>
			
			<tr> 
				<th>�̸�</th>
				<td>
					<!-- readonly �ɼ� �߰� by sky 1022 -->
					<input class="form-control input-sm" value="${result.memname}" name="memname" readonly="readonly">
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>�������</th>   
				<td>
					<input class="form-control input-sm" type="text" value="${result.membirth}" name="membirth" readonly="readonly" />
				</td> 
				<td></td> 
			</tr>
			
			<!-- �̸��� �޴� �κ� �߰� by sky 1022 -->
			<tr> 
				<th>�̸���</th>
				<td>
					<input type="email" class="form-control input-sm" value="${result.mememail}" placeholder="�̸��� �ּ� (abc@abc.com)"
					name="mememail" id="mememail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
					<!-- �ߺ� üũ ����� div �߰� by sky 1021 -->
					<div id="emailchkres"></div>
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm" id="emailchk"> �ߺ�üũ </button>
				</td> 
			</tr>
			
			<tr> 
				<th>��ȭ��ȣ</th>   
				<td>
					<input type="text" class="form-control input-sm" name="memtel" value="${result.memtel}" 
					 pattern="^0[0-9]{2}-[0-9]{3,4}-[0-9]{4}$" placeholder="��ȭ��ȣ (###-####-####)" />
				</td> 
				<td>
				<!-- ����� -->
				</td>
			</tr>
			<tr> 
				<th>�ּ�</th>   
				<td>
					<input id="post" name="mempost" class="form-control input-sm" type="text" value="${result.mempost}" readonly="readonly"/>
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">�����ȣ</button>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<input class="form-control input-sm" type="text" id="roadAddress" name="memdoroaddr" value="${result.memdoroaddr}" readonly="readonly"/>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<input class="form-control input-sm" type="text" id="jibunAddress" name="memjibunaddr" value="${result.memjibunaddr}" readonly="readonly"/>
					<span id="guide" style="color:#999"></span>
				</td> 
			</tr>
		</table> 

		<table><tr height="30px"><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm">������������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('withdraw?memid=${sessionScope['loginid']}')">��Ż������</button>
		
		</form>
		
		
<!-- 		<form action="withdraw"> -->
<!-- 		<button type="button" class="btn btn-success btn-sm">���롡���ҡ�</button> -->
<!-- 		<button type="button" class="btn btn-success btn-sm">��Ż������</button> -->
<%-- 		<input type="hidden" name="memid" value="${sessionScope['loginid']}"> --%>
<!-- 		</form> -->

</div>
	<!--  bottom -->
<%@ include file="bottom.jsp"%>