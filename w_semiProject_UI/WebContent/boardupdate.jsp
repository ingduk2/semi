<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <script scr="js/board.js"></script>   
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

	<form action="bupdate" method="post">
	<div>
		
		<h1>�Խñۼ���<small>�Խñۼ���������form��</small></h1>

		
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>

		<table width="500px">	
			<tr> <th colspan="2">�Խñ� ����</th> </tr>			
			<tr>	
				<th>title</th>	
				<td>
					<input class="form-control input-sm" placeholder="������ �Է��ϼ���" 
					name="boardtitle" id="boardtitle" value="${vo.boardtitle }">
				</td>	
			</tr>
			
			<tr>	
				<th colspan="2">Content</th>		
			</tr>
			
			<tr>	
				<td colspan="2"  height="500px">
					<textarea class="form-control" rows="10" id="comment" placeholder="������ �Է��ϼ���"
					name="boardcontent">${vo.boardcontent }</textarea>
				</td>		
			</tr>
		</table>				

		
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm" >�������Ϸᡡ</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('blist?boardcode=${vo.boardcode}')">��������ҡ�</button>		
	</div>
	<input type="hidden" name="boardno" value="${vo.boardno}">
	<input type="hidden" name="boardcode" value="${vo.boardcode}">
	</form>


		<!--  bottom -->
<%@ include file="bottom.jsp"%>