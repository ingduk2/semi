package vo;

public class AdoptionInfoVO { //�Ծ��û����
	private int adoptno, animalno, adoptscore;//�Ծ��û��ȣ, �Ծ��⵿����ȣ, ��û������
	private String memid, adoptxp, adoptresult; // ��û�ھ��̵�, ����Ű��������, Ű����
	private String adoptanimal, adoptalone, adopthouse; // ����Ű��µ���, ȥ�ڻ�°�, �ְ�����
	private String adoptincome, adoptempty, adoptmoveplan; // ������Ȳ, ����½ð�, �̻��ȹ
	private String adoptvolunteer, adoptfeedback, adoptage; // �������, �Ծ��İ���, ����
	
	//����Ȱ�� db�� �̸��� �޶� volunteer ->  adoptvolunteer ���� 
	
	
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
