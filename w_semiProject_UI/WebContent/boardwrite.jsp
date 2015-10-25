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
	<form action="insertat"  method="post"> <!-- 게시판 입력 실행 -->
		<input type="text" name="memid" value="${sessionScope['loginid']}"/>
		<input type="text" name="boardcode" value="${boardcode}"/>	
		<h1>게시글작성<small>게시글작성을위한form임</small></h1>
		<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
		
		<table width="500px">	
			<tr> <th colspan="2">글쓰기</th> </tr>			
			<tr>	
				<th>title</th>	
				<td>
					<input class="form-control input-sm" placeholder="제목을 입력하세요"
					name="boardtitle" id="boardtitle">
				</td>	
			</tr>
			
			<tr>	
				<th colspan="2">Content</th>		
			</tr>
			
			<tr>	
				<td colspan="2"  height="500px">
					<textarea class="form-control" rows="10" id="comment" placeholder="내용을 입력하세요"
					name="boardcontent"></textarea>
				</td>		
			</tr>
		</table>				

		
		<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm" >　글 작 성　</button>
		<button type="button" class="btn btn-success btn-sm">　취　　소　</button>
		
		</form>
	</div>




		<!--  bottom -->
<%@ include file="bottom.jsp"%>