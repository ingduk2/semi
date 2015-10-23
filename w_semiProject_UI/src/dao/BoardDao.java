package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.AdoptionInfoVO;
import vo.BoardVO;
import vo.PaginVO;

public class BoardDao {
 private static BoardDao dao;
 	public synchronized static BoardDao getDao(){
 		if(dao==null)
 			dao= new BoardDao();
 		return dao;
 	}
 	
 	//�Խ��� �Է�
 	public void insertAll(BoardVO vo){
		SqlSession ss = FactoryService.getFactory().openSession(true);
		ss.insert("board.insertat", vo);
		ss.close();
	}
 	
   // ���� ����Ʈ ��ȸ
 	public List<BoardVO> getBoard(BoardVO vo){ 
 		SqlSession ss = FactoryService.getFactory().openSession();
 		List<BoardVO> list = ss.selectList("board.board", vo);
 		ss.close();
 		return list;
 	}
 	
 	public List<BoardVO> getPage(PaginVO pvo){
 		SqlSession ss=FactoryService.getFactory().openSession();
 		List<BoardVO> list=ss.selectList("board.list",pvo);
 		ss.close();
 		return list;
 	}
 	
 	public BoardVO getBoDetail(int boardno){   //�Խ��� �󼼺���
 		SqlSession ss = FactoryService.getFactory().openSession();
 		BoardVO list = ss.selectOne("board.detail",boardno);
 		ss.close();
 		return list;
 	}
 
 	public void addHit(int boardno){  // ��ȸ��
 		SqlSession ss = FactoryService.getFactory().openSession(true);
 		ss.update("board.hit", boardno);
 		ss.close();
 	}
 	
 	public void boDelete(int boardno){ //�Խ��ǻ���
 		SqlSession ss = FactoryService.getFactory().openSession(true);
 		ss.delete("board.bodelete",boardno);
 		ss.close();
 	}
 	
 	
 	public void boUpdate(BoardVO vo){
 		SqlSession ss = FactoryService.getFactory().openSession(true);
 		ss.update("board.boupdate", vo);
 		ss.close();
 	}
 	
 	
 	
 	
 	public void adoInsert(AdoptionInfoVO advo){
 		SqlSession ss = FactoryService.getFactory().openSession(true);
 		ss.insert("board.adopInsert", advo);
 		ss.close();
 	}
 	
 	public int getTotalCount(){
 		SqlSession ss=FactoryService.getFactory().openSession();
 		int cnt=ss.selectOne("board.totalcnt");
 		ss.close();
 		return cnt;
 	}
 	
}
