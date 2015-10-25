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
		System.out.println("���� : " +advo.getAdoptexp());	
		System.out.println("��� :" +advo.getAdoptresult());
		System.out.println("ȥ��? :" +advo.getAdoptalone());
		System.out.println("���� : "+advo.getAdoptanimal());
		System.out.println("�ְ� : "+advo.getAdopthouse());
		System.out.println("���� :"+advo.getAdoptage());
		System.out.println("��½ð� : " +advo.getAdoptempty());
		System.out.println("�ǵ�� :"+advo.getAdoptfeedback());
		System.out.println("���� : " +advo.getAdoptincome());
		System.out.println("�̻��ȹ : "+advo.getAdoptmoveplan());
		
		System.out.println("����: "+advo.getAdoptscore());
		System.out.println("���̵� : "+advo.getMemid());
		System.out.println("������ȣ: "+advo.getAnimalno());
		
		
		AdoptDao.getDao().adoInsert(advo);
		return SUCCESS;
	}

}
