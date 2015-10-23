package action_img;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.AnimalDao;
import service.FileService;
import vo.AnimalVO;
import vo.BoardVO;
import vo.MemberVO;


//Action을 정의하는 3번째 방법
//1. 우리가 만듬
//2. 제공하는 action
//3. 외부 프로퍼티 actionsupport

public class UploadAction extends ActionSupport implements Preparable, ModelDriven<AnimalVO>{
	private AnimalVO avo;
	//파일 업로드 관련멤버를 추가
	private File upload;
	//이 2개는 form에 없지만 같이 넘어오게 된다.!!
	//spring은 한줄이지만 실제로는 apache fileupload를 통해서 file 말고 다른 2가지 것이 같이 넘어오게 된다.
	private String uploadFileName,uploadContentType;
	
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
		
		//원래 프로퍼티즈는 생성하고 다 해줘야한다. load하고
		//그런데 ActionSupport의 gettext를 하면 알아서 찾아줌
		//getText()로 properties파일의 키를 불러낸다.
		//extends ActionSupport를 상속 받은 이유 중에 하나.
		//파일명이 같으면 그냥 키값을 넣어주면 자동으로 properties의 value값을 가져오게 된다.
		//그리고 경로를 window는 \ 1개가 붙게되는데 이것을 2개로 바꾸어 주던가, 아니면 /로 바꾸어주면 제대로 찾아 올 수 있게 된다. 
		//file.path=/Users/ingduk2/kosta108/html5/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/1007_struts2/upload
		
		//String basePath=getText("file.path","action.UploadAction.properties");
		String basePath=getText("file.path");
		System.out.println("------: " +basePath);
		
		
		//파일을 복사하는 작업이 필요하다.
		FileService service=new FileService();
		String path= service.saveFile(upload, basePath, uploadFileName);
		
		
		//vo에 파일 이름을 저장
		avo.setAnimalimg(uploadFileName);
		AnimalDao.getDao().insertAnimal(avo);
		return SUCCESS;
	}
	//upload 를 위한 세터가 필요. 안그러면 nullpointerexception
	//jsp에서 파일업로드를 캡슐화로 처리하지않는것중 하나가 struts2
	//fileupload는 아파치 것이다. 이것은 서버에 보면 temp폴더가 있고 거기에
	//임시로 저장이 된다. 
	//그래서내가 만든 업로드 폴더로 가져와야한다.
	
	//어떻게 가져와야 할까?
	//1.일단 읽어와서 
	//2.우리가 원하는 곳에 업로드 해야한다. 
	

	public void setUpload(File upload) {
		this.upload = upload;
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
}