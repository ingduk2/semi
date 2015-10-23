package action_board;

import com.opensymphony.xwork2.Action;

import vo.CommBoardVO;

public class CommentInsertAction implements Action{

	private CommBoardVO cbvo;
	//content
	//memid
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}

}
