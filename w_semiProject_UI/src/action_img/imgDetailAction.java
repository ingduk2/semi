package action_img;

import com.opensymphony.xwork2.Action;

import dao.AnimalDao;
import vo.AnimalVO;

public class imgDetailAction implements Action{

	private AnimalVO avo;
	private int animalno;
	
	
	
	
	public AnimalVO getAvo() {
		return avo;
	}






	public void setAnimalno(int animalno) {
		this.animalno = animalno;
	}






	@Override
	public String execute() throws Exception {
		
		System.out.println(animalno);
		avo=AnimalDao.getDao().getDetail(animalno);
		return SUCCESS;
	}

}
