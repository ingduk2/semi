package vo;

public class MemberVO {//회원정보
	private String memid, memname, mememail, mempwd; // 아이디, 이름, 이메일, 비번
	private String membirth, memtel, mempost, memjibunaddr, memdoroaddr;
					//생년월일, 전화번호, 우편번호, 지번주소, 도로 주소
	private String memtelf, memtelb; // 전호번호 조합에 사용. f-앞 / b-뒤
	private int memage; //나이계산용으로 만듬
	
	public int getMemage() {
		return memage;
	}
	public void setMemage(int memage) {
		this.memage = memage;
	}
	public String getMemtelf() {
		return memtelf;
	}
	public void setMemtelf(String memtelf) {
		this.memtelf = memtelf;
	}
	public String getMemtelb() {
		return memtelb;
	}
	public void setMemtelb(String memtelb) {
		this.memtelb = memtelb;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String mememail) {
		this.mememail = mememail;
	}
	public String getMempwd() {
		return mempwd;
	}
	public void setMempwd(String mempwd) {
		this.mempwd = mempwd;
	}
	public String getMembirth() {
		return membirth;
	}
	public void setMembirth(String membirth) {
		this.membirth = membirth;
	}
	public String getMemtel() {
		return memtel;
	}
	public void setMemtel(String memtel) {
		this.memtel = memtel;
	}
	public String getMempost() {
		return mempost;
	}
	public void setMempost(String mempost) {
		this.mempost = mempost;
	}
	public String getMemjibunaddr() {
		return memjibunaddr;
	}
	public void setMemjibunaddr(String memjibunaddr) {
		this.memjibunaddr = memjibunaddr;
	}
	public String getMemdoroaddr() {
		return memdoroaddr;
	}
	public void setMemdoroaddr(String memdoroaddr) {
		this.memdoroaddr = memdoroaddr;
	}
}