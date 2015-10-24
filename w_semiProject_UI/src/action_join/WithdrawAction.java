package action_join;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;

import dao.MemberDao;

public class WithdrawAction implements Action, SessionAware {

	private String memid;
	private Map<String, Object> session;
	
	public void setMemid(String memid) {
		this.memid = memid;
	}

	@Override
	public String execute() throws Exception {
		
		MemberDao.getDao().withdrawUser(memid);
		
		// 탈퇴 시 해당 아이디 세션에서 제외
		session.remove("loginid");
		
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
