package dao;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.z_VapplyVO;
import vo.VapplyVO;
import vo.volFkVO;

public class vapplyDao {
	private static vapplyDao dao;
	public static synchronized vapplyDao getDao(){
		if(dao==null)dao=new vapplyDao();
		return dao;
	}
	
	public void applyInsert(VapplyVO vo){
		SqlSession ss=FactoryService.getFactory().openSession(true);
		ss.insert("vapply.applyinsert",vo);
		ss.close();
	}
	
	public void deleteFk(int volunteerno){
		SqlSession ss=FactoryService.getFactory().openSession(true);
		ss.delete("deletefk",volunteerno);
		ss.close();
	}
	
	public void deleteApply(volFkVO vo){
		SqlSession ss=FactoryService.getFactory().openSession(true);
		ss.delete("deleteapply",vo);
		ss.close();
	}
	
	public int applyCnt(volFkVO vo){
		SqlSession ss=FactoryService.getFactory().openSession();
		int cnt=ss.selectOne("vapply.applycnt",vo);
		ss.close();
		return cnt;
	}
}
