package action_join;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.MemberDao;
import vo.MemberVO;

public class UpdateMemberAction implements Action, Preparable, ModelDriven<MemberVO> {

	private MemberVO vo;
	private String memid;

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
		
		memid = vo.getMemid();
		MemberDao.getDao().updateUserInfo(vo);
		
		return SUCCESS;
	}

	public String getMemid() {
		return memid;
	}
}
