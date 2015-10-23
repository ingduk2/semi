<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!--  header -->
<%@ include file="top.jsp"%>
<script src="js/board.js"></script>
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
	.bgwhite{
		background-color: white;
		opacity: 0.6;
	}

</style>



	<div>		
		<h1>�Խñ� �󼼺��� <small>�Խñۻ󼼺����������Դϴ�.</small></h1>
		<table width="55%">							
			<tr>	
				<th>����</th>	
				<td colspan="5" class="bgwhite"> 
					<!-- �̾ȿ� ������ �־��ּ��� -->
					<s:property value="vo.boardtitle"/> 
				</td>					
			</tr>
			<tr>	
				<th>�۾���</th>
				<td class="bgwhite"><!-- ���̵�Ȥ�� �г��� -->
				<s:property value="vo.memid"/></td>	
				<th>�ۼ���</th>	
				<td class="bgwhite"><!-- sysdate -->
				<s:property value="vo.boarddate"/></td>	
				<th>��ȸ��</th>	
				<td class="bgwhite"><!-- hit���⼭ ����մϴ�. -->
				<s:property value="vo.boardhit"/></td>	
			</tr>
			<tr>	
				<th colspan="6">����</th>						
			</tr>
			<tr height="200px">	
				<td colspan="6" class="bgwhite" ><!-- ����� ���Դϴ�. -->
				<s:property value="vo.boardcontent"/></td>						
			</tr>
		</table>							
		
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('boardup')" >����   ����</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('boarddelete')">���衡������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('board')">���񡡡��ϡ�</button>
	</div>		

<input type="hidden" id="boardno" name="boardno" value="${vo.boardno}">








	<!--  bottom -->
<%@ include file="bottom.jsp"%>