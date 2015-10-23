package vo;

public class CommBoardVO {//댓글게시판
	private int commno, boardno; //댓글번호 원본글번호
	private String commcontent, memid, commip, commdate;
					// 댓글내용, 댓글작성자(아이디), 작성자IP, 작성일
	public int getCommno() {
		return commno;
	}
	public void setCommno(int commno) {
		this.commno = commno;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getCommcontent() {
		return commcontent;
	}
	public void setCommcontent(String commcontent) {
		this.commcontent = commcontent;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getCommip() {
		return commip;
	}
	public void setCommip(String commip) {
		this.commip = commip;
	}
	public String getCommdate() {
		return commdate;
	}
	public void setCommdate(String commdate) {
		this.commdate = commdate;
	}
	
	
	
}
