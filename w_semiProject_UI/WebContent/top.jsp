<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>D조</title>
	<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/board.js"></script>
<!-- Css -->
<link rel="stylesheet" type="text/css" href="css/default.css"/>

<style>
	/* bootstrap Navigation Overriding */
	.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
		color:white;
		font-weight: bold;
		cursor:default;
		background-color: #90ee90;
		border:1px solid #ddd;
		border-bottom-color: transparent;
	}
	a{
		color:#228b22;
		text-decoration: none;
	}
	a:hover{
		text-decoration: none;
	}
	.loginout{
		color: silver;
		font: bold;
		font-family: "arial";
		text-decoration: none;
	}
	.nav-tabs>li>a:hover{
		border-color: white;
	}
	.nav>li>a:focus, .nav>li>a:hover{
		text-decoration: none;
		background-color: #98fb98;
		color: white;
		font-weight: bold;
	}
</style>

</head>
<body>
		<div id="bg">
			<div id="header">
				<table height="230px">
					<tr> 
						<td align="left"><img src="img/logo.png"></td>
						<td align="right" style="vertical-align: top;">
							<s:if test="#session.loginid==null">
								<a class="loginout" href="login"><!--로그인--><img src="img/login_top_btn.png"></a>&nbsp;&nbsp;<font color="#b5b2b2">|</font>&nbsp;
							</s:if>
							<s:else>
								<a class="loginout" href="mypage?memid=${sessionScope['loginid']}">${sessionScope["loginid"]}님</a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;	
								<a class="loginout" href="logout"><!--로그아웃--><img src="img/logout_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
							</s:else>	
								<a class="loginout" href="join"><!--회원가입-->  <img src="img/joinus_top_btn.png"></a>&nbsp;<font color="#b5b2b2">|</font>&nbsp;
								<a class="loginout" href="#"><!--연락--></a><img src="img/contactus_top_btn.png"></a>&nbsp;&nbsp;
						</td> 
					</tr>
					
					<tr> 
						<td colspan="2" style="vertical-align: top;"> <!-- 헤더 위치용 칸떼우기 --> 
							 <ul class="nav nav-tabs">
							 		<!-- 
							 			boardcode 구분
							 			1 - 공지사항
							 			2 - 커뮤니티(자유게시판)
							 			3 - 문의사항(질문게시판)
							 			4 - 실종신고 이미지 게시판
							 			5 - 발견보고 이미지 게시판
							 			6 - 보호동물 이미지 게시판
							 			7 - 입양대기 이미지 게시판
							 		 -->
							    	<li><a href="index">MainPage</a></li>
								    <li><a href="blist?boardcode=1">공지사항</a></li>
								    <li><a href="#">실종신고</a></li>
								    <li><a href="ib?boardcode=5">발견보고</a></li>
								    <li><a href="#">보호동물</a></li>
								    <li><a href="#">입양대기</a></li>
								    <li><a href="cal">봉사활동</a></li>
								    <li><a href="blist?boardcode=2">커뮤니티</a></li>
								    <li><a href="blist?boardcode=3">문의사항</a></li>
								    <li><a href="chart">차트</a><li>
<!-- 								    <li><a href="mypage">MyPage</a></li> -->
									<!-- session 체크 추가 및 링크 변경 by sky 151024  -->
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