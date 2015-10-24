function goUrl(url){
if("board"==url){
confirm("목록으로 이동하시겠습니까?")	
	location=url;}	
else if("boardup"==url){
	confirm("수정하시겠습니까?")	
	location=url+"?boardno="+$('#boardno').val();}
else if("boarddelete"==url){
	confirm("삭제하시겠습니까?")	
	location=url+"?boardno="+$('#boardno').val();}	
else{
	location=url;
}
}
