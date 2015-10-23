package action_calendar;

import com.opensymphony.xwork2.Action;

import dao.vapplyDao;
import dao.volunteerDao;

public class volDeleteAction implements Action{

	private int volunteerno;
	private String volunteertitle;
	
	public void setVolunteertitle(String volunteertitle) {
		this.volunteertitle = volunteertitle;
	}

	public void setVolunteerno(int volunteerno) {
		this.volunteerno = volunteerno;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("------제목-------");
		System.out.println(volunteertitle);
		System.out.println(volunteerno);
		//외래키 제약조건 때문에 vapply테이블의 참조하는녀석들을 먼저 지워야 한다.
		vapplyDao.getDao().deleteFk(volunteerno); 
		volunteerDao.getDao().deleteVol(volunteerno);
		return SUCCESS;
	}
	
}
