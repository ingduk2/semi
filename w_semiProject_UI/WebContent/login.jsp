<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<!--  header -->
<%@ include file="top.jsp"%>


<style>
	#my_container {
	  -webkit-font-smoothing: antialiased;
	  font: normal 14px Roboto,arial,sans-serif;
	}
	.form-login {
	    background-color: #EDEDED;
	    padding-top: 10px;
	    padding-bottom: 20px;
	    padding-left: 20px;
	    padding-right: 20px;
	    border-radius: 15px;
	    border-color:#d2d2d2;
	    border-width: 5px;
	    box-shadow:0 1px 0 #cfcfcf;
	}
	
	h1 { 
	 border:0 solid #fff; 
	 border-bottom-width:1px;
	 padding-bottom:10px;
	 text-align: center;
	}
	
	.form-control {
	    border-radius: 10px;
	}
	
	.wrapper {
	    text-align: center;
	}
	.form-login{
		background-color: #90ee90;
	}
</style>


<div id="my_container">
	<!-- form 추가 by sky 1021 -->
	<form method="post" action="loginchk">
	        <div class="col-md-offset-5 col-md-3">
	            <div class="form-login">
		            <h1 class="text-center">Login<small>로그인페이지</small></h1>
		            
		            <!-- name 값 추가 by sky 1021 -->
		            <input type="text" id="loginemail" name="memid" class="form-control input-lg chat-input" placeholder="username" /></br>
		            
		            <!-- name 값 추가, type 값 text에서 password로 변경 by sky 1021 -->
		            <input type="password" id="loginpwd" name="mempwd" class="form-control input-lg chat-input" placeholder="password" /></br>
		            
		            <div class="wrapper">
			            <span class="group-btn">     
			            	<!-- 버튼 type-submit으로 변경 by sky 1021 -->
			                <input type="submit" class="btn btn-success btn-lg btn-block" value="login">
<!-- 			                <a href="#" class="btn btn-success btn-lg btn-block">login <i class="fa fa-sign-in"></i></a> -->
			            </span>
		            </div>
	            </div>
	        </div>
	 </form>
	 </div>
	 
	 
	 
	<!--  bottom -->
<%@ include file="bottom.jsp"%>