package action_adopt;

import action_board.BoardAction;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.AdoptDao;
import dao.BoardDao;
import vo.AdoptionInfoVO;
import vo.MemberVO;

public class AdoptInsertAction implements Action, Preparable, ModelDriven<AdoptionInfoVO>{
	private AdoptionInfoVO advo;
	private MemberVO mvo;
	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}


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
		System.out.println("경험 : " +advo.getAdoptexp());	
		System.out.println("결과 :" +advo.getAdoptresult());
		System.out.println("혼자? :" +advo.getAdoptalone());
		System.out.println("동물 : "+advo.getAdoptanimal());
		System.out.println("주거 : "+advo.getAdopthouse());
		System.out.println("나이 :"+advo.getAdoptage());
		System.out.println("비는시간 : " +advo.getAdoptempty());
		System.out.println("피드백 :"+advo.getAdoptfeedback());
		System.out.println("수입 : " +advo.getAdoptincome());
		System.out.println("이사계획 : "+advo.getAdoptmoveplan());
		
		System.out.println("점수: "+advo.getAdoptscore());
		System.out.println("아이디 : "+advo.getMemid());
		System.out.println("동물번호: "+advo.getAnimalno());
		
		
		AdoptDao.getDao().adoInsert(advo);
		return SUCCESS;
	}

}
