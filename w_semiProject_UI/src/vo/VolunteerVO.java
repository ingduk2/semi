package vo;

public class VolunteerVO { //봉사활동
private int volunteerno; //봉사번호
private String volunteertitle, volunteerstart, volunteerend;
				// 봉사이름, 시작날짜, 종료날짜
public int getVolunteerno() {
	return volunteerno;
}
public void setVolunteerno(int volunteerno) {
	this.volunteerno = volunteerno;
}
public String getVolunteertitle() {
	return volunteertitle;
}
public void setVolunteertitle(String volunteertitle) {
	this.volunteertitle = volunteertitle;
}
public String getVolunteerstart() {
	return volunteerstart;
}
public void setVolunteerstart(String volunteerstart) {
	this.volunteerstart = volunteerstart;
}
public String getVolunteerend() {
	return volunteerend;
}
public void setVolunteerend(String volunteerend) {
	this.volunteerend = volunteerend;
}
}
