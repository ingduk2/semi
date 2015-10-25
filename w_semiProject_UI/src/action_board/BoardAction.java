package action_board;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.BoardDao;
import service.Paging;
import vo.BoardVO;
import vo.PaginVO;

public class BoardAction implements Action, Preparable, ModelDriven<BoardVO>{
	List<BoardVO> list;
	BoardVO vo;
	private String pagingCode;
	private int nowPage;
	
	
	public BoardAction() {
		nowPage=1;
	}
	public List<BoardVO> getList() {
		return list;
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
		
		System.out.println("-choose--"+vo.getChooseType());
		System.out.println();
		
		int total=0;
		String url=null;
		String params="";
		//problem count -> add where boardcode 
		if(vo.getChooseType()!=null){//yes search - exist choose type
			total=BoardDao.getDao().getSearchCount(vo);
			url="board";
			params="&boardcode="+vo.getBoardcode()+
					"&chooseType="+vo.getChooseType()+
					"&inputVal="+vo.getInputVal();
		}else{// no search
			//total= BoardDao.getDao().getTotalCount();
			total=BoardDao.getDao().getCodeCount(vo);
			url="board";
			params="&boardcode="+vo.getBoardcode();
		}
		int numPerPage = 10;
		int numPerBlock= 5;
		//int total= BoardDao.getDao().getTotalCount();
		System.out.println("Total : "+total);
		
		Paging page= new Paging(total, nowPage, numPerPage, numPerBlock, url, params);
		
		//페이징을 할 때 마다 start와 end값을 넘겨야 한다.
		pagingCode=page.getPagingCode();
		System.out.println(pagingCode);
		System.out.println("-----------------------------");
		int start=(nowPage-1)* numPerPage +1;
		int end= start + numPerPage -1;
		System.out.println("Start : "+start);
		System.out.println("End : "+end);
		 
		//페이지 영역값을  Dao에게 전달 후 list를 반
		
		//이렇게 하면 검색을 페이징 할 수 없다. 검색 기능안에 페이징을 집어넣어서 불러와야하는디..되나
		//start, end, choose
		vo.setStart(start);
		vo.setEnd(end);
		//list=BoardDao.getDao().getPage(new PaginVO(start, end));
		list = BoardDao.getDao().getBoard(vo); //검색 가능.
		System.out.println(list.size());
		return SUCCESS;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getPagingCode() {
		return pagingCode;
	}

	
}
