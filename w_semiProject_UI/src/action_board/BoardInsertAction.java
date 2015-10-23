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
	//private String memid;
	
//	public void setMemid(String memid) {
//		this.memid = memid;
//	}



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
		vo.setBoardcode(100);
		vo.setAnimalno(1);
		//vo.setMemid();
		vo.setBoardpwd("asdads");
//		vo.setBoardcontent("ads");
//		vo.setBoarddate("Dfsa");
//		vo.setBoardhit(0);
//		vo.setBoardlvl(1);
//		vo.setBoardno(1);
		vo.setBoardnoname("dgsga");
//		vo.setBoardref(1);
//		vo.setBoardseq(1);
//		vo.setBoardtitle("sfd");
		
		BoardDao.getDao().insertAll(vo); 
		return SUCCESS;
	}
	

}
