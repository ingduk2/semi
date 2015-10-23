package action_join;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.MemberDao;
import vo.MemberVO;

public class SelectUserInfoAction implements Action, Preparable, ModelDriven<MemberVO>{

	private MemberVO vo;
	private MemberVO result;

	@Override
	public MemberVO getModel() {
		return vo;
	}

	@Override
	public void prepare() throws Exception {
		vo = new MemberVO();
	}

	@Override
	public String execute() throws Exception {
		
		result = MemberDao.getDao().selectUserInfo(vo.getMemid());
		
		return SUCCESS;
	}

	public MemberVO getResult() {
		return result;
	}
}
