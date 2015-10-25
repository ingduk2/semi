package action_board;

import com.opensymphony.xwork2.Action;

import dao.BoardDao;
import vo.BoardVO;

public class BoardDeleteAction implements Action {	
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
	
		vo = BoardDao.getDao().getBoDetail(boardno);
		BoardDao.getDao().deleteCommintarget(boardno);
		BoardDao.getDao().boDelete(boardno);
		return SUCCESS;
	}
}
