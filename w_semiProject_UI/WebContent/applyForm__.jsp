<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!--  header -->
<%@ include file="top.jsp"%>

<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 45px;
	}
	.form-control{
		text-align: right;
	}
</style>



	<div>
		<img src="img/applytitle.png" width="300px">
		
			<div id="fontstyle">		
				<table>
					
					<tr> 
						<th>1</th>����
						<td align="left">�������� Ű���� ������ �����ʴϱ�?</td>  
					</tr>
					<tr>              
						<th></th>
						<td align="left">	������
							<label class="radio-inline">
					     		<input type="radio" name="optradio1">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio1">nope
					   		</label>
						</td>  
					</tr>
					
					<tr> 
						<th>1-1</th>����
						<td align="left">��Ű���� ������ �����ôٸ�, ���� �ֱٿ� �Բ��Ͽ��� ������ ��� �Ǿ����ϱ�?����</td>  
					</tr>
					<tr>              
						<th></th>
						<td align="right">
							<div class="col-sm-5">
	      						<select class="form-control"  id="">
							        <option>-- ���� --</option>
							        <option>���� �Բ� ����ִ�.</option>
							        <option>�������ٸ�</option>
							        <option>����</option>
							        <option>�ľ�</option>
							    </select>
							</div>
						</td>  
					</tr>
					
					
					<tr> 
						<th>2</th>����
						<td align="left">��ȥ�� ������ �̽ʴϱ�?</td>  
					</tr>
					<tr> 
						<th></th>
						<td align="left">	������
							<label class="radio-inline">
					     		<input type="radio" name="optradio2">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio2">nope
					   		</label>
						</td>  
					</tr>
					
					
					<tr> 
						<th>3</th>
						<td align="left">���ְ�����</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">
							<div class="col-sm-4">
	      						<select class="form-control"  id="">
							        <option>-- ���� --</option>
							        <option>�ܵ�����</option>
							        <option>��������</option>
							        <option>����Ʈ</option>
							        <option>�ټ�������</option>
							    </select>
							</div>
						</td>  
					</tr>
					
					
					
					<tr> 
						<th>4</th>
						<td align="left">��������</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">
							<div class="col-sm-4">
								<input type="number" class="form-control input-xs" placeholder="����" step="100" />
							</div>
						</td>  
					</tr>
					
					
					<tr> 
						<th>5</th>
						<td align="left">���Ϸ��� ���� ����� ���� �ð��Դϱ�?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">
							<div class="col-sm-4">
								<input type="number" class="form-control input-xs" placeholder="hour"/>
							</div> <p style="vertical-align: bottom;">�ð�</p>   <!--  �� �ȵɱ��.. �� ������ �Ȱ��.. -->
						</td>  
					</tr>
					
					
					
					<tr> 
						<th>6</th>
						<td align="left">������ �̻� ��ȹ�� �����ʴϱ�?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">����
							<label class="radio-inline">
					     		<input type="radio" name="optradio3">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio3">nope
					   		</label>
						</td>  
					</tr>
					
					<tr> 
						<th>6-1</th>
						<td align="left">���̻� ��ȹ�� �����ôٸ�, �� �� �̻� ��ȹ�� ��ȹ�ϰ� ��ʴϱ�?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">����
							<div class="col-sm-4">
								<input type="number" class="form-control input-xs" placeholder="����"/>
							</div> <p style="vertical-align: bottom;">���� ��</p> 					
						</td>  
					</tr>
					
					
					<tr> 
						<th>7</th>
						<td align="left">�����⵿���� ���� ����Ȱ���� �����Ͻ� ������ �����ʴϱ�?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">����
							<label class="radio-inline">
					     		<input type="radio" name="optradio4">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio4">nope
					   		</label>
						</td>  
					</tr>
					
					<tr> 
						<th>8</th>
						<td align="left">���Ծ� �� ������ ����� �ֱ������� �����ֽǼ� �����ʴϱ�?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">����
							<label class="radio-inline">
					     		<input type="radio" name="optradio5">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio5">nope
					   		</label>
						</td>  
					</tr>
					
					<tr> 
						<th>9</th>
						<td align="left">������������� �����Ͻðڽ��ϱ�?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">����
							<label class="radio-inline">
					     		<input type="radio" name="optradio6">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio6">nope
					   		</label>
						</td>  
					</tr>
					
					
					<tr> 
						<th>10</th>
						<td align="left">���Ծ� �� �߼�ȭ������ �Ͻðڽ��ϱ�?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">����
							<label class="radio-inline">
					     		<input type="radio" name="optradio7">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio7">nope
					   		</label>
						</td>  
					</tr>
				</table>
				
			<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			<button type="button" class="btn btn-success btn-sm">���롡���ҡ�</button>
			<button type="button" class="btn btn-success btn-sm">���Ծ��û��</button>
			</div>
	</div>

	<!--  bottom -->
<%@ include file="bottom.jsp"%>
