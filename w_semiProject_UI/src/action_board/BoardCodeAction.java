package action_board;

import com.opensymphony.xwork2.Action;

public class BoardCodeAction implements Action{

	private int boardcode;
	
	public int getBoardcode() {
		return boardcode;
	}

	public void setBoardcode(int boardcode) {
		this.boardcode = boardcode;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(boardcode);
		return SUCCESS;
	}

}
