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
			
			
			<!-- 댓글 입력  -->
			<tr>
				<th>Comments</th>
				<td colspan="6">
				<form method="post" action="bcomm">
			    	<div class="input-group col-xs-12">
			    		<input type="hidden" name="memid" value="${sessionScope['loginid']}"/>
			    		<input type="hidden" name="boardno" value="${vo.boardno }"/>
			    		
			    		<s:if test="#session.loginid==null">
			    		<input type="text" name="commcontent" class="form-control input-sm " placeholder="로그인을 해야 댓글을 작성할 수 있습니다." readonly="readonly" >
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
			
			<!--  댓글 출력 -->
			<tr>
				<th><span class="glyphicon glyphicon-user"></span></th>
				<td colspan="6">
					<table width="100%">
						<tr> <th style="border-left: 1px solid #f0fff0;">ID</th> <th  class="reply">Comment</th> <th>Date</th> </tr>
						<!-- 댓글 부분 이곳에서 반복처리하면 됩니다. 시작 -->
						<s:iterator value="list">
						<tr> 
							<td><s:property value="memid"/></td>
							<td class="reply">
								<s:property value="commcontent"/>
								<!-- Comment내용이나오겠지,아마도! -->
							</td>
							<td><s:property value="commdate"/></td> 
						</tr>
						</s:iterator>
						<!-- 끝 -->
					</table>					
				</td>
			</tr>
			
			
			
			
		</table>							
		
		<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
		
		<s:url id="goreply" action="">
		</s:url>
		<s:url id="goupdate" action="bupdateinfo">
			<s:param name="boardno" value="vo.boardno"></s:param>
		</s:url>
		<s:url id="godelete" action="bdelete">
			<s:param name="boardno" value="vo.boardno"></s:param>
		</s:url>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('bupdateinfo?boardno=${vo.boardno}')" >　수　　정　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('bdelete?boardno=${vo.boardno}')">　삭　　제　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('blist?boardcode=${vo.boardcode}')">　목　　록　</button>
	</div>		

<input type="hidden" id="boardno" name="boardno" value="${vo.boardno}">








	<!--  bottom -->
<%@ include file="bottom.jsp"%>