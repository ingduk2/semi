package action_calendar;

import com.opensymphony.xwork2.Action;

import dao.volunteerDao;
import vo.VolunteerVO;
import vo.z_VolunteerVO;

public class volListOne implements Action{

	private VolunteerVO vo;
	private int volunteerno;
	private String vol;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(volunteerno);
		vo=volunteerDao.getDao().selectOne(volunteerno);
		StringBuffer str=new StringBuffer();
		str.append(vo.getVolunteerno()).append(vo.getVolunteertitle())
		.append(vo.getVolunteerstart()).append(vo.getVolunteerend());
		vol=str.toString();
		System.out.println(vol);
		return SUCCESS;
	}
	public void setVolunteerno(int volunteerno) {
		this.volunteerno = volunteerno;
	}
	
	
	
	
}
