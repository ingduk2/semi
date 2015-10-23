package action_join;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.MemberDao;
import vo.MemberVO;

public class IdCheckAction implements Action, Preparable, ModelDriven<MemberVO>{

	private MemberVO vo;
	private String result;

	public String getResult() {
		return result;
	}

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
		
		int idcheck = MemberDao.getDao().idCheck(vo);
		
		if (idcheck == 1) {
			result = "exist";
		}
		else {
			result = "possible";
		}
		
		return SUCCESS;
	}
}
