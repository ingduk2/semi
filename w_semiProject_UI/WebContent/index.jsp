<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>

<img src="img/mainimg.png" width="500px">


			<s:if test="#session.loginid==null">
				<li><a href="join">회원가입</a></li>
				<li><a href="login">로그인</a></li>
			</s:if>
			<s:else>
				<li><a href="mypage">${sessionScope["loginid"]}님</a></li>
				<li><a href="logout">로그아웃</a></li>
			</s:else>	

<%@ include file="bottom.jsp"%>