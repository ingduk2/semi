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

</style>


	<div>
	<form action="insertat"  method="post"> <!-- �Խ��� �Է� ���� -->
		<input type="text" name="memid" value="${sessionScope['loginid']}"/>
		<input type="text" name="boardcode" value="${boardcode}"/>	
		<h1>�Խñ��ۼ�<small>�Խñ��ۼ�������form��</small></h1>
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		
		<table width="500px">	
			<tr> <th colspan="2">�۾���</th> </tr>			
			<tr>	
				<th>title</th>	
				<td>
					<input class="form-control input-sm" placeholder="������ �Է��ϼ���"
					name="boardtitle" id="boardtitle">
				</td>	
			</tr>
			
			<tr>	
				<th colspan="2">Content</th>		
			</tr>
			
			<tr>	
				<td colspan="2"  height="500px">
					<textarea class="form-control" rows="10" id="comment" placeholder="������ �Է��ϼ���"
					name="boardcontent"></textarea>
				</td>		
			</tr>
		</table>				

		
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm" >���� �� ����</button>
		<button type="button" class="btn btn-success btn-sm">���롡���ҡ�</button>
		
		</form>
	</div>




		<!--  bottom -->
<%@ include file="bottom.jsp"%>