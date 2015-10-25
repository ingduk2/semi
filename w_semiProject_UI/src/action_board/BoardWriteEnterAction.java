package action_board;

import com.opensymphony.xwork2.Action;

public class BoardWriteEnterAction implements Action {

	private int boardcode;

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public int getBoardcode() {
		return boardcode;
	}

	public void setBoardcode(int boardcode) {
		this.boardcode = boardcode;
	}
}
