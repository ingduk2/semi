package action_board;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.BoardDao;
import vo.AdoptionInfoVO;

public class AdoptInsertAction implements Action, Preparable, ModelDriven<AdoptionInfoVO>{
	private AdoptionInfoVO advo;
	
	
	@Override
	public AdoptionInfoVO getModel() {
		
		return advo;
	}

	@Override
	public void prepare() throws Exception {
		advo= new AdoptionInfoVO();
		
	}

	@Override
	public String execute() throws Exception {
		BoardDao.getDao().adoInsert(advo);
		return SUCCESS;
	}

}
