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
		if(vo.getChooseType()!=null){//yes search - exist choose type
			total=BoardDao.getDao().getSearchCount(vo);
			url="boardlist";
			params="&chooseType="+vo.getChooseType()+"&inputVal="+vo.getInputVal();
		}else{// no search
			total= BoardDao.getDao().getTotalCount();
			url="boardlist";
		}
		int numPerPage = 10;
		int numPerBlock= 5;
		//int total= BoardDao.getDao().getTotalCount();
		System.out.println("Total : "+total);
		
		Paging page= new Paging(total, nowPage, numPerPage, numPerBlock, url, params);
		
		//�럹�씠吏뺤쓣 �븷 �븣 留덈떎 start�� end媛믪쓣 �꽆寃⑥빞 �븳�떎.
		pagingCode=page.getPagingCode();
		System.out.println(pagingCode);
		System.out.println("-----------------------------");
		int start=(nowPage-1)* numPerPage +1;
		int end= start + numPerPage -1;
		System.out.println("Start : "+start);
		System.out.println("End : "+end);
		 
		//�럹�씠吏� �쁺�뿭媛믪쓣  Dao�뿉寃� �쟾�떖 �썑 list瑜� 諛�
		
		//�씠�젃寃� �븯硫� 寃��깋�쓣 �럹�씠吏� �븷 �닔 �뾾�떎. 寃��깋 湲곕뒫�븞�뿉 �럹�씠吏뺤쓣 吏묒뼱�꽔�뼱�꽌 遺덈윭���빞�븯�뒗�뵒..�릺�굹
		//start, end, choose
		vo.setStart(start);
		vo.setEnd(end);
		//list=BoardDao.getDao().getPage(new PaginVO(start, end));
		list = BoardDao.getDao().getBoard(vo); //寃��깋 媛��뒫.
		return SUCCESS;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getPagingCode() {
		return pagingCode;
	}

	
}
