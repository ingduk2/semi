<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("euc-kr");

	String pwd = request.getParameter("mempwd");
	String pwdchk = request.getParameter("pwdchk");
	String msg = "";
	
	if (pwd.equals(pwdchk)) {
		msg = "<p style='color:blue'> ��ġ </p>";
	}
	else {
		msg = "<p style='color:red'> ����ġ </p>";
	}
%>
<%=msg%>