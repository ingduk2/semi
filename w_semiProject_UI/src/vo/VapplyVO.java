package vo;

public class VapplyVO {//봉사신청
	private int  vapplyno, volunteerno; // 봉사신청번호, 봉사번호
	private String memid, vapplydate; // 회원아이디, 봉사신청날짜
	public int getVapplyno() {
		return vapplyno;
	}
	public void setVapplyno(int vapplyno) {
		this.vapplyno = vapplyno;
	}
	public int getVolunteerno() {
		return volunteerno;
	}
	public void setVolunteerno(int volunteerno) {
		this.volunteerno = volunteerno;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getVapplydate() {
		return vapplydate;
	}
	public void setVapplydate(String vapplydate) {
		this.vapplydate = vapplydate;
	}

}
