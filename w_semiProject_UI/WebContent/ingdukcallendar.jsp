<%@page import="dao.vapplyDao"%>
<%@page import="dao.volunteerDao"%>
<%@page import="vo.VolunteerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<link rel='stylesheet'
 href='http://fullcalendar.io/js/fullcalendar-2.3.1/lib/cupertino/jquery-ui.min.css' />
<link
 href='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.css'
 rel='stylesheet' />
<link
 href='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.print.css'
 rel='stylesheet' media='print' />
<script
 src='http://fullcalendar.io/js/fullcalendar-2.3.1/lib/moment.min.js'></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
 src='http://fullcalendar.io/js/fullcalendar-2.3.1/fullcalendar.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.1/lang-all.js'></script>



<style>
.fc-event{
	border : 1px solid green;
	background-color: green;
}

.apply{
	border : 1px solid red;
	background-color: red;
}
</style>

<script>
//var seq[];
function admin(){
	alert('asdfasdfasdf');
	var currentLangCode = 'ko';
	//var seq=0;
	  $('#calendar').fullCalendar('destroy');
	  $('#calendar').fullCalendar({
	   
	   //lang: currentLangCode,
	   dragable:false,  //드래그앤 드랍 옵션
	            timeFormat: 'hh:mm', //시간 포멧
	           // lang: 'ko',  //언어타입
	            header: {
	     left: 'prev,next today',
	     center: 'title',
	     right: 'month,agendaWeek,agendaDay'
	      },
	      // 클릭이벤트 - 삭제 
	            eventClick : function(calEvent,jsEvent,view){ 
	              var r=confirm("Delete " + 
	                calEvent.title+":"+calEvent._id);
	              if (r===true)
	                {
	                   
	                    //관리자 ajax로 페이지나 action 매핑된거 연결해서 dao 불러서 delete보내기
	                    
	                    //사용자가 클릭하면 
	                    // 클릭이벤트 - 삭제 
	                   //관리자 ajax로 페이지나 action 매핑된거 연결해서 dao 불러서 delete보내기
	                    
	                    //사용자가 클릭하면 
	                    /*
	                    클릭하면 이 회원의 디비에 접속해서
			봉사컬럼이 null인지 비교하고
			null이면 신청하시겠습니까
			아니면 삭제하시겠습니까		

			신청하시겠습니까
			-> 회원테이블에 봉사컬럼에 +
			->update
		
			삭제하시겠습니까
			->회원테이블 봉사컬럼을 다시
			-> null이나 0으로 바꿔줌
	                    */
     				
	                    var log=$('#volunteer').val();
	                    alert(log);
	                    if(log=="admin"){
	                    	 alert("관리");
	                    	 $('#calendar').fullCalendar('removeEvents', 
	       	                      calEvent._id);
	                    	 
	                    	 $.ajax({
	 	                        url: "delete",
	 	                        type: "GET",
	 	                        data: { //파라미터로 q
	 	                            volunteertitle: calEvent.title,
	 	                            volunteerno : calEvent.title.split(".")[0]
	 	                            //키값을 여기서는 어떻게 해야할까 시바러ㅏㅁ넝ㄹㅁ놀마ㅗ라ㅓㅗ람노람노라몽ㄹ]
	 	                    
	 	                        },
	 	                        dataType: "html",
	 	                        success: function() {
	 	                            //alert("delete: " + q);
	 	                            //var v=q.split(".");
	 	                            //alert("seqseqseq : "+v[0]);
	 	                            alert("삭제 성공");
	 	                        },
	 	                        error: function(a, b) {
	 	                            alert("Request: " + JSON.stringify(a));
	 	                        }
	 	                    });
	                    }else{
	                    	          	
	                    	 $.ajax({
	                    		
	 	                        url: "applyservice", //action 으로 연결.
	 	                        type: "GET",
	 	                        data: { //파라미터로 q
	 	                        	//나중에 memno sessionscope로 el로 아래서 받아서 같이보내야함
	 	                        	//memno : $('#volunteer').val(),
	 	                        	memid : log,
	 	                            volunteerno : calEvent.title.split(".")[0]
	                    	  
	                    	  /* volunteertitle : title,
	    	                  volunteerstart : start.format(),
	    	                  volunteerend : end.format() */
	 	                        },
	 	                        dataType: "html",
	 	                        success: function() {
	 	                        	//$('div p:contains("Test")').css('background','pink');
	 	                          //$('div span:contains('+calEvent.title+')').css('background','red');
	 	                         $('div span:contains('+calEvent.title+')').addClass('apply');
	 	                          alert("성공..");
	 	                        },
	 	                        error: function(a, b) {
	 	                            alert("Request: " + JSON.stringify(a));
	 	                        }
	 	                    });
	                    }
	                   
	                    ////////////////////////
	                }
	             },
	   defaultView: 'month',//기본 뷰 - 옵션   //첫 페이지 기본 뷰 옵션
	   editable: false,                                             //에디터 가능 옵션
	   selectable: true,
	   selectHelper: true,
	   // 캘린더 셀렉트 된 값을 컬럼에 표시...
	   
	   
	   select: function(start, end, event) {
	    	
		   var log=$('#volunteer').val();
           alert(log);
           if(log=="admin"){
	    var title = prompt('Event Title:'); //값 입력.
	    var seq=0;
	    //1
		alert("selected from: " + start.format() + ", to: " + end.format());
	    
	    //alert(calEvent._id);
	     // 셀렉트된 결과를 서버로 전송
	     //인서트에 사용. 
	          $.ajax({
	              url: "ainsert", //"testAjax.jsp", 
	              type: "GET",
	              data: { //파라미터로 q
	            	  
	                  volunteertitle : title,
	                  volunteerstart : start.format(),
	                  volunteerend : end.format()
	                 //title start end 
	              },
	              dataType: "html",
	              success: function() { //데이터 받는 부분.response
	                  //alert("title " );
	                  //alert("pk-: "+pk);
	                  alert("insert");
	              },
	              error: function(a, b) {
	                  alert("Request: " + JSON.stringify(a));
	              }
	          });
	     
	          $.ajax({
		             url: "getseq",
		             type: "GET",
		             data: { //파라미터로 q
		                 
		                //title start end 
		             },
		             dataType: "html",
		             success: function(q) {
		                 alert("Data-:"+ q);
		                 alert("pk-:"+q);
		                 seq=q;
		                 alert(seq);
		                 
		                 var eventData;
		         	    if (title) {
		         	     eventData = {
		         	      title: seq+"."+title,
		         	      start: start,
		         	      end: end
		         	     };
		         	     alert("데이터 읽어오는데야?"); //2
		         	     $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
		         	    		//seq++;
		         	    }
		             },
		             error: function(a, b) {
		                 alert("Request: " + JSON.stringify(a));
		             }
		         });    
	   
	    $('#calendar').fullCalendar('unselect');
	    
	    
	   }
           },
	   editable: true,
	   eventLimit: true,
	   //load 하는 부분 ! , db에서 읽어오면 된다.
	   events: [
	           
	      
	            <%// select * from cal where day1=2015-05 쿼리에 의해서
	           // 아래의 리스트값이 해당 월을 기준으로 바뀐다.
	           //db에서 뽑아온다. 
	           //사용자가 달력 db를 load하는것
	         
	           
	           //첫 번째 컬럼이 최대 seq를 가지고 있음.
	            List<VolunteerVO> list=volunteerDao.getDao().selectAll();
	            
	            //이것을 여기 자바로 처리할지, list부분에서 처리해서 넘겨줄지 고민해보자.
	       for (VolunteerVO e: list) {
	       System.out.println("......."+e.getVolunteerstart().split(" ")[0]);%>
	      {
	       title: '<%=e.getVolunteerno()+"."+e.getVolunteertitle()%>', //이름을 정한다. vo.name
	       start: '<%=e.getVolunteerstart().split(" ")[0]%>', //날짜를 정한다. vo.date
	       end: '<%=e.getVolunteerend().split(" ")[0]%>'
	      
	      },
	      <%}%>
	      
	     ]
	   
	  })
}


 $(function(){
  admin();
  
 });
</script>
 
 <div id='calendar'>
 <input type="hidden" id="volunteer" value="${sessionScope['loginid']}"/> <!-- $sessinscope["inputid"] -->
 <%-- <input type="hidden" name="no" value="${param.no }"> --%>
 </div>
 
 
 <%@ include file="bottom.jsp" %>

