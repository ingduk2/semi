package action_board;

import com.opensymphony.xwork2.Action;

import dao.BoardDao;

public class BoardDeleteAction implements Action {	
private int boardno;
	
public void setBoardno(int boardno) {
	this.boardno = boardno;
}

@Override
	public String execute() throws Exception {
	
		BoardDao.getDao().deleteCommintarget(boardno);
		BoardDao.getDao().boDelete(boardno);
		return SUCCESS;
	}
}
