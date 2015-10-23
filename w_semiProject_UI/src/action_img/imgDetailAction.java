package action_img;

import java.util.List;

import com.opensymphony.xwork2.Action;

import dao.AnimalDao;
import dao.BoardDao;
import vo.AnimalVO;
import vo.BoardVO;
import vo.CommBoardVO;

public class imgDetailAction implements Action{

	private AnimalVO avo;
	private BoardVO bvo;
	private List<CommBoardVO> list;
	private int animalno;	
	
	public AnimalVO getAvo() {
		return avo;
	}
	
	
	public BoardVO getBvo() {
		return bvo;
	}


	public void setAnimalno(int animalno) {
		this.animalno = animalno;
	}

	@Override
	public String execute() throws Exception {
		
		System.out.println("---"+animalno);
		AnimalDao.getDao().hit(animalno);
		avo=AnimalDao.getDao().getDetail(animalno);
		bvo=AnimalDao.getDao().getDetailB(animalno);
		System.out.println("imgdetail--"+bvo.getBoardno());
		
		list=BoardDao.getDao().commList(bvo.getBoardno());
		System.out.println("list.size--"+list.size());
		return SUCCESS;
	}


	public List<CommBoardVO> getList() {
		return list;
	}

}
