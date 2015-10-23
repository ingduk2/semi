package action_calendar;

import java.util.List;

import com.opensymphony.xwork2.Action;

import dao.volunteerDao;
import vo.VolunteerVO;
import vo.z_VolunteerVO;

public class volList implements Action{
	private List<VolunteerVO> list;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		list=volunteerDao.getDao().selectAll();
		System.out.println(list.size());
		return SUCCESS;
	}

	public List<VolunteerVO> getList() {
		return list;
	}
	
	
}
