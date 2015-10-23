package action_calendar;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.volunteerDao;
import vo.VolunteerVO;
import vo.z_VolunteerVO;

public class volInsertAction implements Action, Preparable, ModelDriven<VolunteerVO>{
	private VolunteerVO vo;
	
	@Override
	public String execute() throws Exception {
		volunteerDao.getDao().insertVol(vo);
		return SUCCESS;
	}

	@Override
	public VolunteerVO getModel() {
		// TODO Auto-generated method stub
		return vo;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		vo= new VolunteerVO();
	}
	
}
