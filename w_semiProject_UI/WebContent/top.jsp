<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�װ�ʹ���....-_"-</title>
	<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/board.js"></script>
<!-- Css -->
<link rel="stylesheet" type="text/css" href="css/default.css"/>

<style>

</style>

</head>
<body>
		<div id="bg">
			<div id="header">
				<table height="230px">
					<tr> 
						<td align="left"><img src="img/logo.png"></td>
						<td align="right" style="vertical-align: top;"><img src="img/loginlogoutjoin.png"></td> 
					</tr>
				
					<tr> 
						<td colspan="2" style="vertical-align: top;"> <!-- ��� ��ġ�� ĭ����� --> 
							 <ul class="nav nav-tabs">
							    	<li><a href="index">MainPage</a></li>
								    <li><a href="boardnoticelist">��������</a></li>
								    <li><a href="">�����Ű�</a></li>
								    <li><a href="ib">�߰ߺ���</a></li>
								    <li><a href="">��ȣ����</a></li>
								    <li><a href="">�Ծ���</a></li>
								    <li><a href="cal">����Ȱ��</a></li>
								    <li><a href="bfreelist">Ŀ�´�Ƽ</a></li>
								    <li><a href="">���ǻ���</a></li>
								    <li><a href="chart">��Ʈ</a><li>
<!-- 								    <li><a href="mypage">MyPage</a></li> -->
									<!-- session üũ �߰� �� ��ũ ���� by sky 151024  -->
									<s:if test="#session.loginid==null">
								    	<li><a href="login">MyPage</a></li>
								    </s:if>
								    <s:else>
								    	<li><a href="mypage?memid=${sessionScope['loginid']}">MyPage</a></li>
								    </s:else>
	  						</ul>
						</td>  
					</tr>
				</table>
			</div>
		</div>
</body>
</html>