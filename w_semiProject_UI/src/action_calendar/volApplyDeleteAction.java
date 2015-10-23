package action_calendar;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.vapplyDao;
import vo.volFkVO;

public class volApplyDeleteAction implements Action, Preparable, ModelDriven<volFkVO>{

	//봉사테이블을 delete 하기 위해서는 2개의 FK값이 필요하다.
	//private int volunteerno;
	//private int memno;
	//2개의 값을 넘겨주기위해서 vo로 만듬. paging을 start와 end로 사용하는 것처럼.
	
	//비교를 html에서 해야 하는 것인가, action에서 할까 하다가 
	//action으로 결정함.
	
	private volFkVO vo;
	@Override
	public String execute() throws Exception {
		vapplyDao.getDao().applyCnt(vo);
		vapplyDao.getDao().deleteApply(vo);
		return SUCCESS;
	}

	@Override
	public volFkVO getModel() {
		// TODO Auto-generated method stub
		return vo;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		vo=new volFkVO();
	}
	
}
