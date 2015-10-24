package action_adopt;

import vo.MemberVO;

import com.opensymphony.xwork2.Action;



import dao.MemberDao;

public class Adopt_id_age_Action implements Action{
	private String memid;
	private MemberVO mvo;

	public MemberVO getMvo() {
		return mvo;
	}
	
	public void setMemid(String memid) {
		this.memid = memid;
	}
	
	@Override
	public String execute() throws Exception {
		mvo=MemberDao.getDao().selectUserInfo(memid);
		return SUCCESS;
	}

}
