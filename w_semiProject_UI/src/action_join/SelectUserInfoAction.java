package action_join;

import com.opensymphony.xwork2.Action;

import dao.MemberDao;
import vo.MemberVO;

public class SelectUserInfoAction implements Action {

	private String memid;
	private MemberVO result;
		
	@Override
	public String execute() throws Exception {
		
		result = MemberDao.getDao().selectUserInfo(memid);
		
		return SUCCESS;
	}
	
	public void setMemid(String memid) {
		this.memid = memid;
	}

	public MemberVO getResult() {
		return result;
	}
}