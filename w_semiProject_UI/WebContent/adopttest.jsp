<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>adopttest</title>
<script>
$(document).ready(function(){ 
	if($('#memid').val() === " "){	
	 	alert("�α��� �� ��û�� �ּ���.")
    	location="login";
	}else{
   	alert("ȸ���Դϴ�.")
    };
});
</script>
</head>
<body>
<form action="applyForm" method="get" >
	<input type="hidden" name="memid" id="memid" value="${sessionScope['loginid']}">">
	<input type="hidden" name="memage" id="memage" value="${memage} }">
	<input type="submit"  name="sub" id="sub" value="�Ծ��û">
</form>
</body>
</html>