package action_img;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.AnimalDao;
import dao.BoardDao;
import service.FileService;
import vo.AnimalVO;
import vo.BoardVO;
import vo.MemberVO;


//Action�쓣 �젙�쓽�븯�뒗 3踰덉㎏ 諛⑸쾿
//1. �슦由ш� 留뚮벉
//2. �젣怨듯븯�뒗 action
//3. �쇅遺� �봽濡쒗띁�떚 actionsupport

public class UploadAction extends ActionSupport implements Preparable, ModelDriven<AnimalVO>
,ServletRequestAware{
	private AnimalVO avo;
	private BoardVO bvo;
	private HttpServletRequest boardip;
	private String memid;
	private String boardtitle;
	private String boardcontent;
	private int boardcode; //5
	//�뙆�씪 �뾽濡쒕뱶 愿��젴硫ㅻ쾭瑜� 異붽�
	private File upload;
	//�씠 2媛쒕뒗 form�뿉 �뾾吏�留� 媛숈씠 �꽆�뼱�삤寃� �맂�떎.!!
	//spring�� �븳以꾩씠吏�留� �떎�젣濡쒕뒗 apache fileupload瑜� �넻�빐�꽌 file 留먭퀬 �떎瑜� 2媛�吏� 寃껋씠 媛숈씠 �꽆�뼱�삤寃� �맂�떎.
	private String uploadFileName,uploadContentType;
	
	
	
	public UploadAction() {
		bvo=new BoardVO();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest req=
				ServletActionContext.getRequest();
		System.out.println(req.getContextPath());
		System.out.println(req.getRealPath("/upload"));
		
		System.out.println("-----------------");
		System.out.println(avo.getAnimalname());
		System.out.println("FilePath: "+upload.getPath());
		System.out.println("FileName: "+upload.getName());
		System.out.println("uploadFileName :"+uploadFileName);
		System.out.println("uploadContentType :"+uploadContentType);
		
		//�썝�옒 �봽濡쒗띁�떚利덈뒗 �깮�꽦�븯怨� �떎 �빐以섏빞�븳�떎. load�븯怨�
		//洹몃윴�뜲 ActionSupport�쓽 gettext瑜� �븯硫� �븣�븘�꽌 李얠븘以�
		//getText()濡� properties�뙆�씪�쓽 �궎瑜� 遺덈윭�궦�떎.
		//extends ActionSupport瑜� �긽�냽 諛쏆� �씠�쑀 以묒뿉 �븯�굹.
		//�뙆�씪紐낆씠 媛숈쑝硫� 洹몃깷 �궎媛믪쓣 �꽔�뼱二쇰㈃ �옄�룞�쑝濡� properties�쓽 value媛믪쓣 媛��졇�삤寃� �맂�떎.
		//洹몃━怨� 寃쎈줈瑜� window�뒗 \ 1媛쒓� 遺숆쾶�릺�뒗�뜲 �씠寃껋쓣 2媛쒕줈 諛붽씀�뼱 二쇰뜕媛�, �븘�땲硫� /濡� 諛붽씀�뼱二쇰㈃ �젣��濡� 李얠븘 �삱 �닔 �엳寃� �맂�떎. 
		//file.path=/Users/ingduk2/kosta108/html5/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/1007_struts2/upload
		
		//String basePath=getText("file.path","action.UploadAction.properties");
		String basePath=getText("file.path");
		System.out.println("------: " +basePath);
		
		
		//�뙆�씪�쓣 蹂듭궗�븯�뒗 �옉�뾽�씠 �븘�슂�븯�떎.
		FileService service=new FileService();
		String path= service.saveFile(upload, basePath, uploadFileName);
		
//		animalno 
//		animalspecies 
//		animalbreed 
//		animalname 
//		animalage 
//		animalsex 
//		animalsize 
//		animalweight 
//		animalfeature 
//		animalregion 
//		animaldate 
//		animalimg 
	
		//vo�뿉 �뙆�씪 �씠由꾩쓣 ���옣
		avo.setAnimalimg(uploadFileName);
		AnimalDao.getDao().insertAnimal(avo);
		
		bvo.setMemid(memid);
		bvo.setBoardtitle(boardtitle);
		bvo.setBoardcontent(boardcontent);
		bvo.setBoardcode(boardcode);
		bvo.setBoardip(boardip.getRemoteAddr());
		int animal_seq=AnimalDao.getDao().getSeq();
		bvo.setAnimalno(animal_seq);
		bvo.setBoardnoname("1");
		bvo.setBoardnopwd("1");
		BoardDao.getDao().insertAll(bvo);
		
		return SUCCESS;
	}
	//upload 瑜� �쐞�븳 �꽭�꽣媛� �븘�슂. �븞洹몃윭硫� nullpointerexception
	//jsp�뿉�꽌 �뙆�씪�뾽濡쒕뱶瑜� 罹≪뒓�솕濡� 泥섎━�븯吏��븡�뒗寃껋쨷 �븯�굹媛� struts2
	//fileupload�뒗 �븘�뙆移� 寃껋씠�떎. �씠寃껋� �꽌踰꾩뿉 蹂대㈃ temp�뤃�뜑媛� �엳怨� 嫄곌린�뿉
	//�엫�떆濡� ���옣�씠 �맂�떎. 
	//洹몃옒�꽌�궡媛� 留뚮뱺 �뾽濡쒕뱶 �뤃�뜑濡� 媛��졇���빞�븳�떎.
	
	//�뼱�뼸寃� 媛��졇���빞 �븷源�?
	//1.�씪�떒 �씫�뼱���꽌 
	//2.�슦由ш� �썝�븯�뒗 怨녹뿉 �뾽濡쒕뱶 �빐�빞�븳�떎. 
	

	public void setUpload(File upload) {
		this.upload = upload;
	}
	
	public void setMemid(String memid) {
		this.memid = memid;
	}

	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}

	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}

	public void setBoardcode(int boardcode) {
		this.boardcode = boardcode;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	@Override
	public AnimalVO getModel() {
		// TODO Auto-generated method stub
		return avo;
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		avo=new AnimalVO();
	}
	@Override
	public void setServletRequest(HttpServletRequest boardip) {
		// TODO Auto-generated method stub
		this.boardip=boardip;
		
	}
}