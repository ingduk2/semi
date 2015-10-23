<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


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
		background: #f5f5f5;
	}
	.footer_text {
		margin: 20px 0;
		color: #777;
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
		
		// �⵵ �Ⱓ ����
		$( "#datepicker" ).datepicker({
			yearRange: "1915:2015"
		});
		// �⵵ �Ⱓ getter
		var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
		// �⵵ �Ⱓ setter
		$( "#datepicker" ).datepicker( "option", "yearRange", "1915:2015" );
	});   //������� �������� function

</script>



<div>
		<img src="img/mypagetitle.png" width="240px">
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		
		
		<table id="formtable">
		<!-- <tr> <th></th> <td></td> </tr> -->
			<tr>
				<th>���̵�(ID)</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="ID" name="memid" readonly="readonly"/>
				</td> 
				<td></td> 
			</tr>
			
			<tr>
				<th>��й�ȣ</th>   
				<td> 
					<input type="password" class="form-control input-sm" placeholder="��й�ȣ(8�ڸ� �̻�)" name="mempwd" minlength="8" maxlength=20">
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>��й�ȣ ��Ȯ��</th>  
				<td>
					<input type="password" class="form-control input-sm" placeholder="�����Ȯ��">
				</td> 
				<td>KeeyUp</td> 
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
			
			<tr> 
				<th>�г���</th>   
				<td>
					<input type="text" class="form-control input-sm" placeholder="�г��� (���� 20��, �ѱ� 10�� ����)" name="memnick" minlength="1" maxlength="20" />
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm"> �ߺ�üũ	</button>
				</td> 
			</tr>
			
			<tr> 
				<th>��ȭ��ȣ</th>   
				<td>
					<div class="col-sm-3">
						<select class="form-control input-sm" id="sel1">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
					</div>
					<div class="col-sm-7">
						<input class="form-control input-sm">
						<font size="1">-���� �ۼ����ּ���</font>
					</div>
				</td> 
				<td>
				<!-- ����� -->
				</td>
			</tr>
			<tr> 
				<th>�ּ�</th>   
				<td>
					<input id="post" name="post" class="form-control input-sm" type="text" placeholder="�����ȣ(�˻�)" readonly="readonly"/>
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">�����ȣ</button>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<input class="form-control input-sm" type="text" id="roadAddress" name="roadAddress" placeholder="���θ�" readonly="readonly"/>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<input class="form-control input-sm" type="text" id="jibunAddress" name="jibunAddress" placeholder="����" readonly="readonly"/>
					<span id="guide" style="color:#999"></span>
				</td> 
			</tr>
		</table> 

		<table><tr height="30px"><td></td></tr></table>
		<button type="button" class="btn btn-success btn-sm">������������</button>
		<button type="button" class="btn btn-success btn-sm">���롡���ҡ�</button>
		<button type="button" class="btn btn-success btn-sm">��Ż������</button>
<!-- 		<button type="submit" class="btn btn-success btn-sm">���������ԡ�</button> -->
	
	</div>




	<!--  bottom -->
<%@ include file="bottom.jsp"%>