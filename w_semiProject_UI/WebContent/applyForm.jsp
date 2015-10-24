<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!--  header -->
<%@ include file="top.jsp"%>
<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 45px;
	}
	.form-control{
		text-align: right;
	}
</style>

<script>
$(document).ready(function(){
	$("#adoptexp2").click(function(){
		document.getElementById("experience").selectedIndex=0;
	});   //end inexperience click event
	
	$("#move2").click(function(){
		document.getElementById("months").value=0;
	});
	
});


  $(function(){
	 $score=0;
     $num1=0; $num2=0; $num3=0; 
     $num4=0; $num5=0; $num6=0; 
     $num7=0; $num8=0; $num9=0;
	  
     // 경험
	 $('#input').click(function(){
	 
		 
		 if($('#adoptexp1').is(':checked')){	
  		 $('#adoptexp').val($('#adoptexp1').val());	
  		   $num1=1;	       
			}else{
				$('#adoptexp').val($('#adoptexp2').val());
				$num1=0;
			};
			
			//현동물	
	  		  if($('#experience').val()==1){
	  			  $('#adoptresult').val("현재함께살고있다");
	  			  $num2=2
	  		  }else if($('#experience').val()==2){
	  			  $('#adoptresult').val("무지개다리");
	  			  $num2=1
	  	      }else if($('#experience').val()==3){
	  			  $('#adoptresult').val("유기");
	  			  $num2=0
	  	      }else if($('#experience').val()==4){
	  			  $('#adoptresult').val("파양");
	  			  $num2=-1
	  	       };
	  
	
       //독거?
	    if($('#alone1').is(':checked')){
	    	$('#adoptalone').val($('#alone1').val());
	    	$num3=-1
	    } else{
	    	$('#adoptalone').val($('#alone2').val());
	    	$num3=1
	    };
	    
	    
	   
	    //주거환경?
	 	if($('#house').val()==1){
	 		$('#adopthouse').val("단독주택");
	 		num9=2;
	 	}else if($('#house').val()==2){
	 		$('#adopthouse').val("전원주택");
	 		num9=1;
	 	}else if($('#house').val()==3){
	 		$('#adopthouse').val("아파트");
	 		num9=0;
	 	}else if($('#house').val()==4){
	 		$('#adopthouse').val("다세대주택");
	 		num9=-1;
	 	};
	 	
	 	
	 	// 수입
	 	if($('#inco').val()==100){
	 		$('#adoptincome').val($('#inco').val());
	 		$num4=1				
	 	}else if($('#inco').val()==200){
	 		$('#adoptincome').val($('#inco').val());
	 		$num4=2
	 	}else if($('#inco').val()==300){
	 		$('#adoptincome').val($('#inco').val());
	 		$num4=3
	 	};
		
		//집 비는 시간
		if($('#hour').val()==1){
			$('#adoptempty').val($('#hour').val());
			$num5=2;
		}else if($('#hour').val()==4){
			$('#adoptempty').val($('#hour').val());
			$num5=1;
		}else if($('#hour').val()==7){
			$('#adoptempty').val($('#hour').val());
			$num5=-1;
		}else if($('#hour').val()==10){
			$('#adoptempty').val($('#hour').val());
			$num5=-2;
		};
		
// 		// 이사계획
// 		if($('#move1').is(':checked')){	
			
// 		    }else{
// 			$('#adoptmoveplan').val($('#move2').val());
// 			$num6=1;
// 		  }
		
		//이사계획 몇개월?
		 if($('#months')==6){
				$num6=0;				
				$('#adoptmoveplan').val($('#months').val());	
			}else if($('#months')==12){
				$num6=0;
				$('#adoptmoveplan').val($('#months').val());	
			}else if($('#months')==18){
				$num6=-1;
				$('#adoptmoveplan').val($('#months').val());	
			}else if($('#months')==24){
				$num6=-1;
				$('#adoptmoveplan').val($('#months').val());	
			}else{
				$num6=0;
				$('#adoptmoveplan').val(0);
			};

		
		
		if($('#volunt1').is(':checked')){
			$('#adoptvolunteer').val('yes');
			$num7=1;
		}else{
			$('#adoptvolunteer').val('nope');
			$num7=0;
		};
		

		if($('#feed1').is(':checked')){
			$('#adoptfeedback').val($('#feed1').val());
			$num8=1;
		}else{
			$('#adoptfeedback').val($('#feed2').val());
			$num8=-1;
		};	
		
			$score=$num1 + $num2 + $num3 + $num4 + $num5 + $num6 + $num7 + $num8 + $num9 ;
			alert($score);   점수확인
			$('#adoptscore').val($score)
			
			
	 });
	
	
// 	 $('#input').on("click", function(){
// 		 if($('.optradio6').val()=='nope' && $('.optradio7').val()=='nope'){
// 			 alert("동의하지 않으면 등록하실수 없습니다.");
// 			 $('.optradio6').val("");
// 			 $('.optradio7').val("");
// 		 }
// 	 });

     
     
		
	 $('#join1').click(function(){
		 confirm("동의하셨습니다.") 
	 });
	
	 $('#join2').click(function(){
		 alert("동의하지 않으면 신청 할 수 없습니다.")
		 location="applyForm"
	 });
 	  
	$('#agr1').click(function(){
			 confirm("동의하셨습니다.")		 
		  });
	$('#agr2').click(function(){
		alert("동의하지 않으면 신청 할 수 없습니다.");
			 location="applyForm"
		  });

  });      
  
  
  //-------------------------------------------------------
  
	function checksubmit() {
		if(document.checkall.optradio1.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio1.focus()
			return false
		}
		if(document.checkall.optradio2.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio2.focus()
			return false
		}
		if(document.checkall.homeshape.value==""){
			alert("Please fill the all forms")
			document.checkall.homeshape.focus()
			return false
		}
		if(document.checkall.income.value==""){
			alert("Please fill the all forms")
			document.checkall.income.focus()
			return false
		}
		if(document.checkall.stayhour.value==""){
			alert("Please fill the all forms")
			document.checkall.stayhour.focus()
			return false
		}
		if(document.checkall.optradio3.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio3.focus()
			return false
		}
		if(document.checkall.optradio4.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio4.focus()
			return false
		}
		if(document.checkall.optradio5.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio5.focus()
			return false
		}
		if(document.checkall.optradio6.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio6.focus()
			return false
		}
		if(document.checkall.optradio7.value==""){
			alert("Please fill the all forms")
			document.checkall.optradio7.focus()
			return false
		}
		return true
	}; 
</script>
<script src="js/board_.js"></script>
<form action="apply" method="post" name="checkall" onsubmit="return checksubmit()">	

	<div>
		<h1>입양신청서<small>Please Adopt, Don't BUY</small></h1>
		
		
			<div id="fontstyle">		
				<table>
					
					<tr> 
						<th>1</th>　　
						<td align="left">　동물을 키워본 경험이 있으십니까?</td>  
					</tr>
					<tr>              
						<th></th>
						<td align="left">	　　　
							<label class="radio-inline">
					     		<input type="radio"  name="optradio1" id="adoptexp1" value="yes"   
					     		data-toggle="collapse" data-target="#collapseOne" >yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio"  name="optradio1" id="adoptexp2" value="nope" 
					      		data-toggle="collapse" data-target="#collapseOne" >nope
					   		</label>
					   		<div id="collapseOne" class="panel-collapse collapse">
            					<div class="panel-body">
                					<p>가장 최근에 함께하였던 동물은 어떻게 되었습니까?</p>
                					<div class="col-sm-6">
				      					<select class="form-control"  id="experience">
									        <option>-- 선택 --</option>
									        <option value="1">현재 함께 살고있다.</option>
									        <option value="2">무지개다리</option>
									        <option value="3">유기</option>
									        <option value="4">파양</option>
									    </select>
									</div>
					            </div>
					        </div>
					   		
					   		
					   		
						</td>  
					</tr>
				
					
					<tr>
						<th>2</th>　　
						<td align="left">　혼자 거주중 이십니까?</td>  
					</tr>
					<tr> 
						<th></th>
						<td align="left">	　　　
							<label class="radio-inline">
					     		<input type="radio" name="optradio2" id="alone1" value="yes">yes
			
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio2" id="alone2" value="nope" >nope					      	
					   		</label>
						</td>  
					</tr>
					
				
					<tr> 
						<th>3</th>
						<td align="left">　주거형태</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">
							<div class="col-sm-4">
	      						<select class="form-control"  id="house" name="homeshape">
							        <option>-- 선택 --</option>
							        <option value="1">단독주택</option>
							        <option value="2">전원주택</option>
							        <option value="3">아파트</option>
							        <option value="4">다세대주택</option>
							    </select>
							</div>
						</td>  
					</tr>
	
					
					
					<tr> 
						<th>4</th>
						<td align="left">　월수입</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">
							<div class="col-sm-4">
								<input type="number" class="form-control input-xs" placeholder="수입" name="income" 
								min="100" max="300" step="100" id="inco" value="100"/>
							</div>
						</td>  
					</tr>
					
					
					<tr> 
						<th>5</th>
						<td align="left">　하룻동안 집에 사람이 없는 시간입니까?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">
							<div class="col-sm-4">
								<input type="number" class="form-control input-xs" placeholder="hour" name="stayhour"
								min="1" max="10" step="3" id="hour" value="1" />
							</div> <p style="vertical-align: bottom;">시간</p>   <!--  왜 안될까요.. 왜 밑으로 안갈까여.. -->
						</td>  
					</tr>
					
					
					
					<tr> 
						<th>6</th>
						<td align="left">　향후 이사 계획이 있으십니까?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">　　
							<label class="radio-inline">
					     		<input type="radio" name="optradio3"  id="move1"  value="yes"  data-toggle="collapse" data-target="#collapseTwo">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio3" id="move2" value="nope" data-toggle="collapse" data-target="#collapseTwo">nope
			     	   		</label>
			     	   		<div id="collapseTwo" class="panel-collapse collapse">
            					<div class="panel-body">
                					<p>얼마 후 이사 계획을 계획하고 계십니까?</p>
									<div class="col-sm-6">
										<input type="number" class="form-control input-xs" id="months" placeholder="개월"
										min="0" max="24" step="6" value=0/>
									</div> <p style="vertical-align: bottom;">개월 후</p> 	
					            </div>
			     	   		</div>
						</td>  
					</tr>
					
					

					<tr> 
						<th>7</th>
						<td align="left">　유기동물을 위한 봉사활동에 참여하신 경험이 있으십니까?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">　　
							<label class="radio-inline">
					     		<input type="radio" name="optradio4" id="volunt1" value="yes">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio4" id="volunt2" value="nope">nope
					   		</label>
						</td>  
					</tr>
					
					<tr> 
						<th>8</th>
						<td align="left">　입양 후 아이의 모습을 주기적으로 전해주실수 있으십니까?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">　　
							<label class="radio-inline">
					     		<input type="radio" name="optradio5" id="feed1" value="yes" >yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio5" id="feed2" value="nope">nope
					   		</label>
						</td>  
					</tr>
					
					
			
					<tr> 
						<th>9</th>
						<td align="left">　동물등록제에 참여하시겠습니까?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">　　
							<label class="radio-inline">
					     		<input type="radio" name="optradio6" id="join1" value="yes">yes
						    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio6" id="join2" value="nope">nope
					   		</label>
						</td>  
					</tr>
					
					
					<tr> 
						<th>10</th>
						<td align="left">　입양 후 중성화수술을 하시겠습니까?</td>  
					</tr>
					<tr> 
						<th></th> 
						<td align="left">　　
							<label class="radio-inline">
					     		<input type="radio" name="optradio7" id="agr1" value="yes">yes
					    	</label>
					   		<label class="radio-inline">
					      		<input type="radio" name="optradio7" id="agr2" value="nope">nope
					   		</label>
						</td>  
					</tr>
				</table>
		
			<table><tr height="30px"><!-- 높이 조절용 칸 떼우기 --><td></td></tr></table>
			<button type="button" class="btn btn-success btn-sm" onclick="goUrl('board')">　취　　소　</button>
			<button type="submit" class="btn btn-success btn-sm" id="input" onclick="ch()">　입양신청　</button>
			</div>
	</div>
<input type="hidden" name="adoptexp" id="adoptexp">
<input type="hidden" name="adoptresult" id="adoptresult">
<input type="hidden" name="adoptanimal" id="adoptanimal" value="123"> <!-- 임시로 -->
<input type="hidden" name="adoptalone" id="adoptalone">
<input type="hidden" name="adopthouse" id="adopthouse">
<input type="hidden" name="adoptincome" id="adoptincome">
<input type="hidden" name="adoptempty" id="adoptempty">
<input type="hidden" name="adoptmoveplan" id="adoptmoveplan">
<input type="hidden" name="adoptvolunteer" id="adoptvolunteer">
<input type="hidden" name="adoptfeedback" id="adoptfeedback">
<input type="hidden" name="adoptage" id="adoptage" value="20">
<input type="hidden" name="adoptscore" id="adoptscore">
<input type="hidden" name="memid" id="memid" value="뭐임">	
<input type="hidden" name="adoptvolunteer" id="adoptvolunteer">

</form>
	

	<!--  bottom -->
<%@ include file="bottom.jsp"%>



