package action_join;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.MemberDao;
import vo.MemberVO;

public class InsertMemberAction implements Action, Preparable, ModelDriven<MemberVO> {

	private MemberVO vo;

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
		
		// 2���� ������ ���� ��ȭ��ȣ�� �ϳ��� ���ļ� �־��ִ� �۾�
		StringBuffer tel = new StringBuffer();
		tel.append(vo.getMemtelf()).append("-");
		
		int len = vo.getMemtelb().length();
		
		if (len == 7) {
			tel.append(vo.getMemtelb().substring(0, 3)).append("-");
			tel.append(vo.getMemtelb().substring(3, 7));
		}
		if (len == 8) {
			tel.append(vo.getMemtelb().substring(0, 4)).append("-");
			tel.append(vo.getMemtelb().substring(4, 8));
		}
		
		vo.setMemtel(tel.toString());
		// 2���� ������ ���� ��ȭ��ȣ�� �ϳ��� ���ļ� �־��ִ� �۾�
		
		MemberDao.getDao().insertMember(vo);
		
		return SUCCESS;
	}
}
