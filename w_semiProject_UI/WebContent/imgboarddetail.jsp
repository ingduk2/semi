<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


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
	.bgwhite{
		background-color: white;
		opacity: 0.6;
	}
	.reply{
		border-left: 1px solid #f0fff0;
		border-right: 1px solid #f0fff0;
	}
	.alert{
		text-align: left;
	}
	/*----------�̹��� ���콺 ���� ��Ÿ��---------*/
	.tooltip.top .tooltip-inner {
    	background-color:#f5fffa;
	}
	.tooltip.top .tooltip-arrow {
	    border-top-color: #f5fffa;
	}
	.tooltip-inner{
		color:green;
	}

</style>

<script> //image mouse over script
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
</script>


	<div>		
		<img src="img/boarddetail.png" width="300px">
		
<!-- 		<table width="50%" border="1px">							 -->
		<table style="border:1px ; width: 500px"> 
			<tr>	
				<th>����</th>	
				<td colspan="5" class="bgwhite"> 
					${bvo.boardtitle }
				</td>					
			</tr>
			<tr>	
				<th>�۾���</th>
				<td class="bgwhite">${bvo.memid}</td>	
				<th>�ۼ���</th>	
				<td class="bgwhite">${bvo.boarddate }</td>	
				<th>��ȸ��</th>	
				<td class="bgwhite">${bvo.boardhit}<!--hit--></td>	
			</tr>
			<tr>	
				<th colspan="6">${avo.animalfeature}</th>						
			</tr>
			
			<tr>
				<td colspan="6"><br>
				
					<!-- img/a.PNG�� �̹��� �ѷ��ִ� �� -->
					<a href="#" class="green-tooltip" data-toggle="tooltip" data-placement="top" title="�ڼ��� ������ ������ ���� �Ʒ� ��ư�� Ŭ�����ּ���!">
						<img src="upload/${avo.animalimg}" class="img-rounded" alt="NOT available" width="304" height="236">
					</a>
					
					<!--�ֱ⼳��start-->
					<div id="demo" class="collapse alert alert-success"><br>
						<!--�̸�, ǰ��, ����, ����, ũ��, ������, Ư¡, ����, ��¥-->
						  <ul class="list-group">
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-gift"></span>
						    	${avo.animalname}<!-- �̸��̸��־��ּ��� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	${avo.animalbreed}<!-- ǰ�� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	${avo.animalage}<!-- ���� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	${avo.animalsex}<!-- ���� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	${avo.animalsize}<!-- ũ�� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	${avo.animalfeature}<!-- Ư¡ -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	${avo.animalregion}<!-- ���� -->
						    </li>
						    <li class="list-group-item">
						    	<span class="glyphicon glyphicon-apple"></span>
						    	${avo.animaldate}<!-- ��¥ -->
						    </li>
						  </ul> 
					</div><p>
					<button type="button" class="btn btn-success btn-xs" data-toggle="collapse" data-target="#demo">
						<span class="glyphicon glyphicon-zoom-in"></span>&nbsp;ClickHere
					</button>
					<!--�ֱ⼳��End-->
				</td>
			</tr>
			
			<tr height="500px">	<!-- ���� ���� height="500px" ������� -->
				<td colspan="6" class="bgwhite" >
					${bvo.boardcontent}
				</td>						
			</tr>
			
			<!-- ��� �Է�  -->
			
			
			<tr>
			
				<th>Comments</th>
				<td colspan="6">
				<form method="post" action="comminsertimg">
			    	<div class="input-group col-xs-12">
			    		<input type="hidden" name="memid" value="${sessionScope['loginid']}"/>
			    		<input type="hidden" name="boardno" value="${bvo.boardno}"/>
			    		<input type="hidden" name="animalno" value="${avo.animalno}"/>
			        	<input type="text" name="commcontent" class="form-control input-sm " placeholder="Your comments">
			            	<span class="input-group-btn">
			                    <span class="btn btn-success btn-sm">&nbsp;
			                    	<input type="submit" value="ADD"/>
			                    	<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add
			                    </span>
			                </span>
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
						
			<%-- 			 <s:iterator value="list"> <!-- ���������� -->
			 <tr> <td width="30px"><s:property value="boardno"/></td><td><a href="boarddetail?boardno=${boardno}"><s:property value="boardtitle"/></a></td>
			 <td><s:property value="memid"/></td><td><s:property value="boarddate"/></td>
			 <td><s:property value="boardhit"/></td> </tr>
			 </s:iterator> --%>
						
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
		<button type="button" class="btn btn-success btn-sm">������������</button>
		<button type="button" class="btn btn-success btn-sm">���衡������</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('ib')">���񡡡��ϡ�</button>
	</div>		

	<!--  bottom -->
<%@ include file="bottom.jsp"%>