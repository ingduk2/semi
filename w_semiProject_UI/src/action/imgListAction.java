package action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import dao.AnimalDao;
import service.Paging;
import vo.AnimalVO;
import vo.PaginVO;

public class imgListAction extends ActionSupport{
	private String pagingCode;
	private int nowPage;
	//private List<BoardVO> list;
	//리스트 부분 작성.
	private List<AnimalVO> list;
	

	private int size;
	
	public imgListAction() {
		nowPage=1;
	}
	
	@Override
	public String execute() throws Exception {
		int numPerPage = 12; //건들면 안됨.
		int numPerBlock= 5;  //아래에 몇페이지 띄워줄지 정해줌
		//int total=BoardDao.getDao().getTotalCount();
		int total=AnimalDao.getDao().getTotalCount();
		//img게시판의 total 구하는 dao와 query 필요.
		
		
	
		//System.out.println("Total : "+total);
		
		//페이징된 숫자를 눌렀을 때 다시 돌아올 struts2의 <action name=????>
		String url="ib";
		Paging page= new Paging(total, nowPage, numPerPage, numPerBlock, url);
		
		//페이징을 할 때 마다 start와 end값을 넘겨야 한다.
		pagingCode=page.getPagingCode();
		System.out.println(pagingCode);
		System.out.println("-----------------------------");
		int start=(nowPage-1)* numPerPage +1;
		int end= start + numPerPage -1;
		System.out.println("Start : "+start);
		System.out.println("End : "+end);
		
		//페이지 영역값을  Dao에게 전달 후 list를 반
		
		//페이징 된 12개의 리스트만 들고옴.
		//list=BoardDao.getDao().getList(new PaginVO(start, end));
		list=AnimalDao.getDao().getList(new PaginVO(start, end));
		
		System.out.println(list.size());
		size=list.size();
		
		return SUCCESS;
	}

	public List<AnimalVO> getList() {
		return list;
	}
	
	public int getSize() {
		return size;
	}

	public String getPagingCode() {
		return pagingCode;
	}

	public void setPagingCode(String pagingCode) {
		this.pagingCode = pagingCode;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	
	
}
