package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.AnimalVO;
import vo.PaginVO;

public class AnimalDao {
	private static AnimalDao dao;

	public static AnimalDao getDao() {
		if(dao==null)dao=new AnimalDao();
		return dao;
	}
	
	public void insertAnimal(AnimalVO avo){
		SqlSession ss=FactoryService.getFactory().openSession(true);
		ss.insert("animal.insertanimal",avo);
		ss.close();
		
	}
	
	public List<AnimalVO> getList(PaginVO pvo){
		SqlSession ss=FactoryService.getFactory().openSession();
		List<AnimalVO> list=ss.selectList("animal.listanimal",pvo);
		ss.close();
		return list;
	}
	
	public int getTotalCount(){
		SqlSession ss=FactoryService.getFactory().openSession();
		int cnt=ss.selectOne("animal.gettotalcnt");
		ss.close();
		return cnt;
	}
	
	public AnimalVO getDetail(int animalno){
		SqlSession ss=FactoryService.getFactory().openSession();
		AnimalVO avo=ss.selectOne("animal.getdetail",animalno);
		ss.close();
		return avo;
	}
}
