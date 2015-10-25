package action_board;

import vo.BoardVO;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.BoardDao;

public class BoardInsertAction implements Action, Preparable, 
ModelDriven<BoardVO>, ServletRequestAware {
	private BoardVO vo;
	private HttpServletRequest boardip;

	public BoardVO getVo() {
		return vo;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest boardip) {
		this.boardip=boardip;
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
		System.out.println(vo.getMemid());
		vo.setBoardip(boardip.getRemoteAddr());
		
		vo.setAnimalno(0); // 일반 게시판 용도 animalno 세팅
		
		BoardDao.getDao().insertAll(vo); 
		
		return SUCCESS;
	}
}
