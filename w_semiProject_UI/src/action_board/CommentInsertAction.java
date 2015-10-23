package action_board;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.BoardDao;
import vo.CommBoardVO;

public class CommentInsertAction implements Action, Preparable, ModelDriven<CommBoardVO>
, ServletRequestAware{

	private CommBoardVO cbvo;
	private HttpServletRequest commip;
	private int animalno;
	//content
	//memid
	@Override
	public String execute() throws Exception {
		cbvo.setCommip(commip.getRemoteAddr());
		
		System.out.println("comminsert--"+cbvo.getBoardno());
		System.out.println("comminsert--"+cbvo.getMemid());
		System.out.println("comminsert--"+animalno);
		BoardDao.getDao().commInsert(cbvo);
		
		
		return SUCCESS;
	}
	public int getAnimalno() {
		return animalno;
	}
	public void setAnimalno(int animalno) {
		this.animalno = animalno;
	}
	@Override
	public CommBoardVO getModel() {
		// TODO Auto-generated method stub
		return cbvo;
	}
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		cbvo=new CommBoardVO();
	}
	@Override
	public void setServletRequest(HttpServletRequest commip) {
		// TODO Auto-generated method stub
		this.commip=commip;
	}

}
