package service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileService {
//사용자가 지정한 저장 폴더가 없을 경우 새롭게 만들어주는 메서드
	public void makeBasePath(String path){
		File dir=new File(path);
		if(!dir.exists()){
			dir.mkdirs(); //예 ) /fileupload/data/ 
		}
	}
	
	//파일을 저장한는 메서드
	public String saveFile(File file, String basePath
			,String fileName) throws Exception{
		if(file==null){
			return null;
		}
		makeBasePath(basePath);
		String serverFullPath=
				basePath+System.getProperty("file.separator") //운영체제마다 경로표기법이 틀리다. 이것을 지원받기위해 separator를 가져옴.
				+fileName;
		FileInputStream fis=new FileInputStream(file); //이 파일로부터 
		FileOutputStream fos=new FileOutputStream(serverFullPath); //serverFullpath =prop의 패스+구분자+file이
		BufferedInputStream bis=new BufferedInputStream(fis);
		BufferedOutputStream bos=new BufferedOutputStream(fos);
		int readSize=0;
		while((readSize=bis.read())!=-1){
			bos.write(readSize);
		}
		bis.close();
		bos.close();
		fos.close();
		fis.close();
		
		return serverFullPath;
		
		
	}
}
