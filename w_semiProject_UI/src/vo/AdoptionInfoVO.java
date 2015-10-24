package vo;

public class AdoptionInfoVO { //입양신청정보
	private int adoptno, animalno, adoptscore;//입양신청번호, 입양대기동물번호, 신청자점수
	private String memid, adoptxp, adoptresult; // 신청자아이디, 동물키워본경험, 키운결과
	private String adoptanimal, adoptalone, adopthouse; // 현재키우는동물, 혼자사는가, 주거형태
	private String adoptincome, adoptempty, adoptmoveplan; // 수입현황, 집비는시간, 이사계획
	private String adoptvolunteer, adoptfeedback, adoptage; // 봉사경험, 입양후공유, 나이
	
	//봉사활동 db와 이름이 달라 volunteer ->  adoptvolunteer 수정 
	
	
	public int getAdoptno() {
		return adoptno;
	}
	public void setAdoptno(int adoptno) {
		this.adoptno = adoptno;
	}
	public int getAnimalno() {
		return animalno;
	}
	public void setAnimalno(int animalno) {
		this.animalno = animalno;
	}
	public int getAdoptscore() {
		return adoptscore;
	}
	public void setAdoptscore(int adoptscore) {
		this.adoptscore = adoptscore;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getAdoptxp() {
		return adoptxp;
	}
	public void setAdoptxp(String adoptxp) {
		this.adoptxp = adoptxp;
	}
	public String getAdoptresult() {
		return adoptresult;
	}
	public void setAdoptresult(String adoptresult) {
		this.adoptresult = adoptresult;
	}
	public String getAdoptanimal() {
		return adoptanimal;
	}
	public void setAdoptanimal(String adoptanimal) {
		this.adoptanimal = adoptanimal;
	}
	public String getAdoptalone() {
		return adoptalone;
	}
	public void setAdoptalone(String adoptalone) {
		this.adoptalone = adoptalone;
	}
	public String getAdopthouse() {
		return adopthouse;
	}
	public void setAdopthouse(String adopthouse) {
		this.adopthouse = adopthouse;
	}
	public String getAdoptincome() {
		return adoptincome;
	}
	public void setAdoptincome(String adoptincome) {
		this.adoptincome = adoptincome;
	}
	public String getAdoptempty() {
		return adoptempty;
	}
	public void setAdoptempty(String adoptempty) {
		this.adoptempty = adoptempty;
	}
	public String getAdoptmoveplan() {
		return adoptmoveplan;
	}
	public void setAdoptmoveplan(String adoptmoveplan) {
		this.adoptmoveplan = adoptmoveplan;
	}
	
	public String getAdoptvolunteer() {
		return adoptvolunteer;
	}
	public void setAdoptvolunteer(String adoptvolunteer) {
		this.adoptvolunteer = adoptvolunteer;
	}
	public String getAdoptfeedback() {
		return adoptfeedback;
	}
	public void setAdoptfeedback(String adoptfeedback) {
		this.adoptfeedback = adoptfeedback;
	}
	public String getAdoptage() {
		return adoptage;
	}
	public void setAdoptage(String adoptage) {
		this.adoptage = adoptage;
	}
	
}
