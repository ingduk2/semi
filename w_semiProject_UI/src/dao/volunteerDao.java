package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.VolunteerVO;
import vo.z_VolunteerVO;

public class volunteerDao {
	private static volunteerDao dao;

	public static synchronized volunteerDao getDao() {
		if(dao==null)dao=new volunteerDao();
		return dao;
	}
	
	public void insertVol(VolunteerVO vo){
		SqlSession ss=FactoryService.getFactory().openSession(true);
		ss.insert("volunteer.insertvol", vo);
		ss.close();
	}
	
	public void deleteVol(int volunteerno){
		SqlSession ss= FactoryService.getFactory().openSession(true);
		ss.delete("volunteer.deletevol",volunteerno);
		ss.close();
	}
	
	public List<VolunteerVO> selectAll(){
		SqlSession ss=FactoryService.getFactory().openSession();
		List<VolunteerVO> list=ss.selectList("volunteer.selectAll");
		ss.close();
		return list;
	}
	
	public VolunteerVO selectOne(int volunteerno){
		SqlSession ss=FactoryService.getFactory().openSession();
		VolunteerVO vo=ss.selectOne("volunteer.selectOne",volunteerno);
		ss.close();
		return vo;
	}
	
	public int getSeq(){
		SqlSession ss=FactoryService.getFactory().openSession();
		int seq=ss.selectOne("volunteer.getseq");
		ss.close();
		return seq;
	}
}
