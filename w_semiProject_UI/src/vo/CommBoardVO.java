package vo;

public class CommBoardVO {//��۰Խ���
	private int commno, boardno; //��۹�ȣ �����۹�ȣ
	private String commcontent, memid, commip, commdate;
					// ��۳���, ����ۼ���(���̵�), �ۼ���IP, �ۼ���
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
