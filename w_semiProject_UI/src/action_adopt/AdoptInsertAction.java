package action_adopt;

import action_board.BoardAction;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.AdoptDao;
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
		System.out.println(advo.getAdoptexp());	
		System.out.println(advo.getAdoptresult());
		System.out.println(advo.getAdoptalone());
		System.out.println(advo.getAdoptanimal());
		System.out.println(advo.getAdopthouse());
		System.out.println(advo.getAdoptage());
		System.out.println(advo.getAdoptempty());
		System.out.println(advo.getAdoptfeedback());
		System.out.println(advo.getAdoptincome());
		System.out.println(advo.getAdoptmoveplan());
		
		System.out.println(advo.getAdoptscore());
		System.out.println(advo.getMemid());
		System.out.println(advo.getAnimalno());
		
		
		AdoptDao.getDao().adoInsert(advo);
		return SUCCESS;
	}

}
