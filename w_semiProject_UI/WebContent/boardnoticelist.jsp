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
					<td colspan="2" width="300px">제목</td>
					<td width="180px">작성자</td>
					<td width="100px">작성일</td>
					<td>조회</td>
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
							<a href="boardnoticewrite">글쓰기</a>
						</button>
					</td>
				</tr>
			</tfoot>
			
		</table>

		<!-- 페이징, 검색, 글쓰기 버튼 -->
		<table>
		
			<thead> 
				<tr>
					<!-- 페이징 작업 부분 -->
					<td colspan="5"><s:property value="pagingCode" escape="false"/></td>
				</tr>

				<form action="" method="post">
					<tr>  
						<!-- <td></td> -->	
						<td>
							&nbsp;
							<!-- 다이나믹쿼리 검색 기능 -->
							<select class="form-control input-sm" id="chooseType" name="chooseType">
								<option value="1">제목</option>
								<option value="2">작성자</option>
								<option value="3">내용</option>
							</select>
							&nbsp;
						</td>

						<td>
							&nbsp;
							<input class="form-control input-sm" type="text" id="inputVal" name="inputVal"/>
							&nbsp;
						</td>

						<td>
							<!-- 검색버튼, 파라미터 값 전달 -->
							&nbsp;
							<input type="submit" class="btn btn-default btn-sm" value="검색">
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