package action_img;

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
	//由ъ뒪�듃 遺�遺� �옉�꽦.
	private List<AnimalVO> list;
	

	private int size;
	
	public imgListAction() {
		nowPage=1;
	}
	
	@Override
	public String execute() throws Exception {
		int numPerPage = 12; //嫄대뱾硫� �븞�맖.
		int numPerBlock= 5;  //�븘�옒�뿉 紐뉙럹�씠吏� �쓣�썙以꾩� �젙�빐以�
		//int total=BoardDao.getDao().getTotalCount();
		int total=AnimalDao.getDao().getTotalCount();
		//img寃뚯떆�뙋�쓽 total 援ы븯�뒗 dao�� query �븘�슂.
		
		
	
		//System.out.println("Total : "+total);
		
		//�럹�씠吏뺣맂 �닽�옄瑜� �닃���쓣 �븣 �떎�떆 �룎�븘�삱 struts2�쓽 <action name=????>
		String url="ib";
		Paging page= new Paging(total, nowPage, numPerPage, numPerBlock, url, "");
		
		//�럹�씠吏뺤쓣 �븷 �븣 留덈떎 start�� end媛믪쓣 �꽆寃⑥빞 �븳�떎.
		pagingCode=page.getPagingCode();
		System.out.println(pagingCode);
		System.out.println("-----------------------------");
		int start=(nowPage-1)* numPerPage +1;
		int end= start + numPerPage -1;
		System.out.println("Start : "+start);
		System.out.println("End : "+end);
		
		//�럹�씠吏� �쁺�뿭媛믪쓣  Dao�뿉寃� �쟾�떖 �썑 list瑜� 諛�
		
		//�럹�씠吏� �맂 12媛쒖쓽 由ъ뒪�듃留� �뱾怨좎샂.
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
