<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>

<img src="img/mainimg.png" width="500px">


			<s:if test="#session.loginid==null">
				<li><a href="join">ȸ������</a></li>
				<li><a href="login">�α���</a></li>
			</s:if>
			<s:else>
				<li><a href="mypage">${sessionScope["loginid"]}��</a></li>
				<li><a href="logout">�α׾ƿ�</a></li>
			</s:else>	

<%@ include file="bottom.jsp"%>