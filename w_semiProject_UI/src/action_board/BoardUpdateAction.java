package action_board;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.BoardDao;
import vo.BoardVO;

public class BoardUpdateAction implements Action, Preparable, ModelDriven<BoardVO>{
	private BoardVO vo;


	public BoardVO getVo() {
		return vo;
	}


	@Override
	public BoardVO getModel() {
		return vo;
	}


	@Override
	public void prepare() throws Exception {
		vo = new BoardVO();
		
	}


	@Override
	public String execute() throws Exception {
		BoardDao.getDao().boUpdate(vo);
		System.out.println(vo.getBoardno());
		return SUCCESS;
	}

}
