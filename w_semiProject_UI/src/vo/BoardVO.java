package vo;

public class BoardVO { //�Խ���
	private int boardcode, boardno, boardhit, animalno; //�Խ����ڵ�, �Խù���ȣ, ��ȸ�� ������Ϲ�ȣ
	private int boardref, boardseq, boardlvl; // ���(����), ���(��ۼ���), ��۰���(Ʈ���ܰ�)
	private String boardtitle, memid, boardcontent, boarddate; //����, ȸ�����̵�(�ۼ���), ����, �ۼ����� 
	private String boardip, boardnoname, boardnopwd; //�ۼ��� ip, ��ȸ���̸�, ��ȸ�����
	private String chooseType, inputVal; // �پƳ��� �����̿��� ����...
	private int start, end;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getChooseType() {
		return chooseType;
	}
	public void setChooseType(String chooseType) {
		this.chooseType = chooseType;
	}
	public String getInputVal() {
		return inputVal;
	}
	public void setInputVal(String inputVal) {
		this.inputVal = inputVal;
	}
	public int getBoardcode() {
		return boardcode;
	}
	public void setBoardcode(int boardcode) {
		this.boardcode = boardcode;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getBoardhit() {
		return boardhit;
	}
	public void setBoardhit(int boardhit) {
		this.boardhit = boardhit;
	}
	public int getAnimalno() {
		return animalno;
	}
	public void setAnimalno(int animalno) {
		this.animalno = animalno;
	}
	public int getBoardref() {
		return boardref;
	}
	public void setBoardref(int boardref) {
		this.boardref = boardref;
	}
	public int getBoardseq() {
		return boardseq;
	}
	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}
	public int getBoardlvl() {
		return boardlvl;
	}
	public void setBoardlvl(int boardlvl) {
		this.boardlvl = boardlvl;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public String getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(String boarddate) {
		this.boarddate = boarddate;
	}
	public String getBoardip() {
		return boardip;
	}
	public void setBoardip(String boardip) {
		this.boardip = boardip;
	}
	public String getBoardnoname() {
		return boardnoname;
	}
	public void setBoardnoname(String boardnoname) {
		this.boardnoname = boardnoname;
	}
	public String getBoardnopwd() {
		return boardnopwd;
	}
	public void setBoardnopwd(String boardnopwd) {
		this.boardnopwd = boardnopwd;
	}
	

}
