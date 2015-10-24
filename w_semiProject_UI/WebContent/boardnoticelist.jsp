<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="s" uri="/struts-tags" %>


<!-- header -->
<%@ include file="top.jsp"%>


	<div id="bg">
		<img src="img/boardTitle.png" width="200px">
		
		<table>
		
			<thead style="font-weight:bold; color:black;">
				<tr id="title"> 
					<td colspan="2" width="300px">����</td>
					<td width="180px">�ۼ���</td>
					<td width="100px">�ۼ���</td>
					<td>��ȸ</td>
				</tr>
			</thead>
			
			<tbody id="tbodycss">
				<s:iterator value="list">
					<tr>
						<td width="30px"><s:property value="boardno"/></td>
						<td><a href="boardnoticedetail?boardno=${boardno}"><s:property value="boardtitle"/></a></td>
						<td><s:property value="memid"/></td>
						<td><s:property value="boarddate"/></td>
						<td><s:property value="boardhit"/></td>
					</tr>
				</s:iterator>
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="3"></td>
					<td colspan="2">
						<button type="button" class="btn btn-default btn-xs">
							<a href="boardnoticewrite">�۾���</a>
						</button>
					</td>
				</tr>
			</tfoot>
			
		</table>

		<!-- ����¡, �˻�, �۾��� ��ư -->
		<table>
		
			<thead> 
				<tr>
					<!-- ����¡ �۾� �κ� -->
					<td colspan="5"><s:property value="pagingCode" escape="false"/></td>
				</tr>

				<form action="" method="post">
					<tr>  
						<!-- <td></td> -->	
						<td>
							&nbsp;
							<!-- ���̳������� �˻� ��� -->
							<select class="form-control input-sm" id="chooseType" name="chooseType">
								<option value="1">����</option>
								<option value="2">�ۼ���</option>
								<option value="3">����</option>
							</select>
							&nbsp;
						</td>

						<td>
							&nbsp;
							<input class="form-control input-sm" type="text" id="inputVal" name="inputVal"/>
							&nbsp;
						</td>

						<td>
							<!-- �˻���ư, �Ķ���� �� ���� -->
							&nbsp;
							<input type="submit" class="btn btn-default btn-sm" value="�˻�">
							&nbsp;
						</td>
						<!-- <td></td> -->
					</tr>
				</form>
			</thead>
			
		</table>
	</div>


<!-- bottom -->
<%@ include file="bottom.jsp"%>