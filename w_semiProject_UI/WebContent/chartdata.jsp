<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="s" uri="/struts-tags" %> 
<s:iterator var="v" value="data" status="i">
 ${v }<s:if test="sizev-1 != #i.index">,</s:if>
</s:iterator>