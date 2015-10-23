<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="s" uri="/struts-tags" %>
    <%@ page trimDirectiveWhitespaces="true" %>
${seq}<%-- <% String seq= request.getParameter("seq");
<s:iterator var="v" value="data" status="i">
 ${v }<s:if test="sizev-1 != #i.index">,</s:if>
</s:iterator>
//파라미터 값을 받아서 분석한 후 해당 테이블에 저장
//dao 불러서 db에 인서트 하는데,
//이렇게 해도 되고,
//struts.xml 에 action 만들어서 매핑해서 인서트 해도되
String msg=seq;
System.out.println("------"+msg);
%><%=msg%> 순수 아작스만 받을 떄--%>