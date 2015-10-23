package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.z_chartVO;

public class chartDao {
	private static chartDao dao;

	public static chartDao getDao() {
		if(dao==null)dao=new chartDao();
		return dao;
	}
	
	public List<z_chartVO> selectChart(){
		SqlSession ss=FactoryService.getFactory().openSession();
		List<z_chartVO> list=ss.selectList("chart.selectall");
		ss.close();
		return list;
			
		
	}
}
