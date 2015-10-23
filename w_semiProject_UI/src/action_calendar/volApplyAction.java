package action_calendar;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.vapplyDao;
import vo.z_VapplyVO;
import vo.VapplyVO;
import vo.volFkVO;

public class volApplyAction implements Action, Preparable, ModelDriven<VapplyVO>{

	
	private VapplyVO vo;
	private volFkVO fvo;
	@Override
	public String execute() throws Exception {
		//vapplyno는 seq로 해결.
		//memno는 세션으로 아이디 끌고다니면서 넘겨줌.
		//일단 임의의 값을 넣자.
		//volunteerno는 넘겨쥼.
		//date는 그냥 하면됨.
		
		System.out.println("apply action");
	
		System.out.println(vo.getMemid());
		System.out.println(vo.getVolunteerno());
		//volfkvo 셋팅.
		fvo.setMemid(vo.getMemid());
		fvo.setVolunteerno(vo.getVolunteerno());
		
		//이 회원이 이 봉사를 가지고 있는지 확인하기 위한 액션.
		//memno와 volno로 vapply테이블에서 count를 검색.
		//만약 0개라면 신청으로 보내주고
		//만약 1개이상이라면 삭제로 보내준다.
		int cnt=vapplyDao.getDao().applyCnt(fvo);
		if(cnt==0){
			vapplyDao.getDao().applyInsert(vo);
		}else{
			vapplyDao.getDao().deleteApply(fvo);
		}
		
		
		
		return SUCCESS;
	}


	@Override
	public VapplyVO getModel() {
		// TODO Auto-generated method stub
		return vo;
	}


	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		vo=new VapplyVO();
		fvo=new volFkVO();
	}
	
}
