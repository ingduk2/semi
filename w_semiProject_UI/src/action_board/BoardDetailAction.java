package action_board;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.BoardDao;
import vo.BoardVO;

public class BoardDetailAction implements Action{
	private int boardno;
	private BoardVO vo;
		
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public BoardVO getVo() {
		return vo;
	}

	@Override
	public String execute() throws Exception {
		 BoardDao.getDao().addHit(boardno);
		 vo=BoardDao.getDao().getBoDetail(boardno);
    	 return SUCCESS;
	}
	
}
