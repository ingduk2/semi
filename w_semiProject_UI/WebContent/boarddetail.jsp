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
			
			
			<!-- ��� �Է�  -->
			<tr>
				<th>Comments</th>
				<td colspan="6">
				<form method="post" action="bcomm">
			    	<div class="input-group col-xs-12">
			    		<input type="hidden" name="memid" value="${sessionScope['loginid']}"/>
			    		<input type="hidden" name="boardno" value="${vo.boardno }"/>
			    		
			    		<s:if test="#session.loginid==null">
			    		<input type="text" name="commcontent" class="form-control input-sm " placeholder="�α����� �ؾ� ����� �ۼ��� �� �ֽ��ϴ�." readonly="readonly" >
			            	<span class="input-group-btn">
			                    <button type="button" value="" class="btn btn-success btn-sm">&nbsp;
			                    	<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add
			                    </button>
			                </span>			    		
			    		</s:if>
			    		
			    		<s:else>
			        	<input type="text" name="commcontent" class="form-control input-sm " placeholder="Your comments" >
			            	<span class="input-group-btn">
			                    <button type="submit" value="" class="btn btn-success btn-sm">&nbsp;
			                    	<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add
			                    </button>
			                </span>
			            </s:else>
			            
			        </div>		
			        </form>			
				</td>
			</tr>
			
			<!--  ��� ��� -->
			<tr>
				<th><span class="glyphicon glyphicon-user"></span></th>
				<td colspan="6">
					<table width="100%">
						<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comment</th> <th>Date</th> </tr>
						<!-- ��� �κ� �̰����� �ݺ�ó���ϸ� �˴ϴ�. ���� -->
						<s:iterator value="list">
						<tr> 
							<td><s:property value="memid"/></td>
							<td class="reply">
								<s:property value="commcontent"/>
								<!-- Comment�����̳�������,�Ƹ���! -->
							</td>
							<td><s:property value="commdate"/></td> 
						</tr>
						</s:iterator>
						<!-- �� -->
					</table>					
				</td>
			</tr>
			
			
			
			
		</table>							
		
		<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
		
		<s:url id="goreply" action="">
		</s:url>
		<s:url id="goupdate" action="bupdateinfo">
			<s:param name="boardno" value="vo.boardno"></s:param>
		</s:url>
		<s:url id="godelete" action="bdelete">
			<s:param name="boardno" value="vo.boardno"></s:param>
		</s:url>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('bupdateinfo?boardno=${vo.boardno}')" >������������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('bdelete?boardno=${vo.boardno}')">���衡������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('blist?boardcode=${vo.boardcode}')">���񡡡��ϡ�</button>
	</div>		

<input type="hidden" id="boardno" name="boardno" value="${vo.boardno}">








	<!--  bottom -->
<%@ include file="bottom.jsp"%>