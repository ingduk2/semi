<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!--  header -->
<%@ include file="top.jsp"%>

<style>
/* .container1{ */
/* 	text-align: center;	 */
/* } */
/* #container1{ */
/* 	text-align: center;	 */
/* } */
/* div{ */
/* 	border: 1px solid;	 */
/* 	align: center; */
/* 	text-align: center;	 */
/* } */
div{
	border: 1px solid red;
}
</style>

<h2>
	<img src="img/imgboardtitle.png" width="300px">
</h2>

	
<!-- <div id="container1" style="background-color: blue; border:1px solid red"> -->
	<div class="col-md-offset-2 col-md-8 center">
			
			 <c:if test="${size!=0}">
			 <c:set var="doneLoop" value="false"/>
		 	<c:forEach var="i" begin="0" end="11" step="4"> 
		 	<div>
		 	
		 	<c:if test="${not doneLoop }">
			<div class="col-md-3">
				<a href="imgdetail?animalno=${list[i].animalno}" class="thumbnail">
					<img src="upload/${list[i].animalimg}" style="width: 150px; height: 150px">
					<p>${list[i].animalno}<br>${list[i].animalspecies}<br>${list[i].animalbreed}<br>
						${list[i].animalname}<br>${list[i].animalage}<br>${list[i].animalsex}<br>
						${list[i].animalregion}<br>${list[i].animaldate}<br>
					</p> 
				</a>
			</div>
			<c:if test="${i==(size-1) }">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
			
			<c:if test="${not doneLoop }">
			<div class="col-md-3">
				<a href="#" class="thumbnail">
					<img src="upload/${list[i+1].animalimg}"  style="width: 150px; height: 150px">
					<p>${list[i+1].animalno}<br>${list[i+1].animalspecies}<br>${list[i+1].animalbreed}<br>
						${list[i+1].animalname}<br>${list[i+1].animalage}<br>${list[i+1].animalsex}<br>
						${list[i+1].animalregion}<br>${list[i+1].animaldate}<br>
					</p>  
				</a>
			</div>
			<c:if test="${i+1==(size-1) }">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
			
			<c:if test="${not doneLoop }">
			<div class="col-md-3">
				<a href="#" class="thumbnail">
					<img src="upload/${list[i+2].animalimg}"  style="width: 150px; height: 150px">
					<p>${list[i+2].animalno}<br>${list[i+2].animalspecies}<br>${list[i+2].animalbreed}<br>
						${list[i+2].animalname}<br>${list[i+2].animalage}<br>${list[i+2].animalsex}<br>
						${list[i+2].animalregion}<br>${list[i+2].animaldate}<br>
					</p> 
				</a>
			</div>
			<c:if test="${i+2==(size-1) }">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
			
			<c:if test="${not doneLoop }">
			<div class="col-md-3">
				<a href="#" class="thumbnail">
					<img src="upload/${list[i+3].animalimg}"  style="width: 150px; height: 150px">
					<p>${list[i+3].animalno}<br>${list[i+3].animalspecies}<br>${list[i+3].animalbreed}<br>
						${list[i+3].animalname}<br>${list[i+3].animalage}<br>${list[i+3].animalsex}<br>
						${list[i+3].animalregion}<br>${list[i+3].animaldate}<br>
					</p> 
				</a>
			</div>
			<c:if test="${i+3==(size-1) }">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
			</div>
			
			
			
			</c:forEach>
			
			
			</c:if>
	</div><p>
	<div>
	<input type="button" value="click" onclick="goUrl('animalboardwrite')"/><p>
	<s:property value="pagingCode" escape="false"/>
	</div>
	
<!-- </div> -->
 

<!--  bottom -->
<%@ include file="bottom.jsp"%>