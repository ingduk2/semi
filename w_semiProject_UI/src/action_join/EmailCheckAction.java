package action_join;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.MemberDao;
import vo.MemberVO;

public class EmailCheckAction implements Action, Preparable, ModelDriven<MemberVO> {

	private MemberVO vo;
	private String result;
	
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
		
		int emailcheck = MemberDao.getDao().emailCheck(vo);
		
		if (emailcheck == 1) {
			result = "�̹� �����ϴ� ���� �ּ� �Դϴ�.";
		}
		else {
			result = "��� ������ ���� �ּ� �Դϴ�.";
		}
		
		return SUCCESS;
	}

	public String getResult() {
		return result;
	}
}
