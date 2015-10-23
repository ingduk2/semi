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
		<h1>게시글 상세보기 <small>게시글상세보기페이지입니다.</small></h1>
		<table width="55%">							
			<tr>	
				<th>제목</th>	
				<td colspan="5" class="bgwhite"> 
					<!-- 이안에 제목을 넣어주세요 -->
					<s:property value="vo.boardtitle"/> 
				</td>					
			</tr>
			<tr>	
				<th>글쓴이</th>
				<td class="bgwhite"><!-- 아이디혹은 닉네임 -->
				<s:property value="vo.memid"/></td>	
				<th>작성일</th>	
				<td class="bgwhite"><!-- sysdate -->
				<s:property value="vo.boarddate"/></td>	
				<th>조회수</th>	
				<td class="bgwhite"><!-- hit여기서 계산합니다. -->
				<s:property value="vo.boardhit"/></td>	
			</tr>
			<tr>	
				<th colspan="6">내용</th>						
			</tr>
			<tr height="200px">	
				<td colspan="6" class="bgwhite" ><!-- 내용들어갈 곳입니다. -->
				<s:property value="vo.boardcontent"/></td>						
			</tr>
		</table>							
		
		<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('boardup')" >　수   정　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('boarddelete')">　삭　　제　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('board')">　목　　록　</button>
	</div>		

<input type="hidden" id="boardno" name="boardno" value="${vo.boardno}">








	<!--  bottom -->
<%@ include file="bottom.jsp"%>