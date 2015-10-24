package dao;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.AdoptionInfoVO;


public class AdoptDao {
 private static AdoptDao dao;
 	public synchronized static AdoptDao getDao(){
 		if(dao==null)
 			dao= new AdoptDao();
 		return dao;
 	}
 
 	
 	public void adoInsert(AdoptionInfoVO advo){
 		SqlSession ss = FactoryService.getFactory().openSession(true);
 		ss.insert("adoptioninfo.adoptInsert", advo);
 		ss.close();
 	}
 	
}
