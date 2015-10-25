package action_adopt;

import java.text.SimpleDateFormat;
import java.util.Date;

import vo.MemberVO;

import com.opensymphony.xwork2.Action;





import dao.MemberDao;

public class Adopt_id_age_Action implements Action{
	private MemberVO mvo;
	private SimpleDateFormat fd;
	private String memid;
	private  int memage;
	
	public int getMemage() {
		return memage;
	}


	public void setMemage(int memage) {
		this.memage = memage;
	}


	
	public String getMemid() {
		return memid;
	}


	public void setMemid(String memid) {
		this.memid = memid;
	}


	public MemberVO getMvo() {
		
		return mvo;
	}
	
	
	@Override
	public String execute() throws Exception {		
		mvo=MemberDao.getDao().selectUserInfo(memid);
		fd= new SimpleDateFormat("yyyy");
		String brith=mvo.getMembirth().substring(0,4);
		int date1=Integer.parseInt(fd.format(new Date()));
		int date2=Integer.parseInt(brith);
		memage = date1 - date2 +1;
		mvo.setMemage(memage);
		System.out.println("나이 :" + memage);
		System.out.println("아이디 : " +memid);
		return SUCCESS;
	}

}
