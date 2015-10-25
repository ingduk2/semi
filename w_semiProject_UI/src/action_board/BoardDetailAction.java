package action_board;

import java.util.List;

import com.opensymphony.xwork2.Action;

import dao.BoardDao;
import vo.BoardVO;
import vo.CommBoardVO;

public class BoardDetailAction implements Action{
	private int boardno;
	private BoardVO vo;
	private List<CommBoardVO> list;
		
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public List<CommBoardVO> getList() {
		return list;
	}

	public BoardVO getVo() {
		return vo;
	}

	@Override
	public String execute() throws Exception {
		System.out.println(boardno);
		 BoardDao.getDao().addHit(boardno);
		 vo=BoardDao.getDao().getBoDetail(boardno);
		 
		 list=BoardDao.getDao().commList(boardno);
		 
    	 return SUCCESS;
	}
	
}
