package dao;

import org.apache.ibatis.session.SqlSession;

import service.FactoryService;
import vo.MemberVO;

public class MemberDao {

	private static MemberDao dao;
	
	public static synchronized MemberDao getDao() {
		if (dao == null) dao = new MemberDao();
		
		return dao;
	}
	
	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占싱듸옙 占쌩븝옙 체크
	public int idCheck(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int idchk = ss.selectOne("member.idchk", vo);
		ss.close();
		
		return idchk;
	}
	
	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙 占싱몌옙占쏙옙 占쌩븝옙 체크
	public int emailCheck(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int emailchk = ss.selectOne("member.emailchk", vo);
		ss.close();
		
		return emailchk;
	}
	
	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙 DB insert
	public void insertMember(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession(true); // auto commit
		
		ss.insert("member.insertmember", vo);
		ss.close();
	}
	
	// 占싸깍옙占쏙옙 占쏙옙 占쏙옙占싱듸옙, 占쏙옙橘占싫� 占쏙옙치 占쏙옙占쏙옙 체크
	public boolean logincheck(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		// 占쏙옙占싱듸옙 占쏙옙占쏙옙 占쏙옙占쏙옙 체크
		int idchk = ss.selectOne("member.idchk", vo);
		
		// 占쏙옙占싱듸옙 占쏙옙占쏙옙 占쏙옙 占쏙옙
		if (idchk == 1) {
			// 占쏙옙占싱듸옙 占쌔댐옙占싹댐옙 占쏙옙橘占싫ｏ옙占쏙옙占� 체크
			int pwdchk = ss.selectOne("member.pwdchk", vo);
			
			// 占쏙옙橘占싫� 占쏙옙占쏙옙 占쏙옙
			if (pwdchk == 1) {
				ss.close();
				return true;
			}
			// 占쏙옙橘占싫� 틀占쏙옙 占쏙옙
			else {
				ss.close();
				return false;
			}
		}
		// 占쏙옙占싱듸옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙
		else {
			ss.close();
			return false;
		}
	}
	
	// 회占쏙옙 占쏙옙占싱듸옙占� 占쌔댐옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	public MemberVO selectUserInfo(String memid) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		MemberVO res = ss.selectOne("member.selectuserinfo", memid);
		ss.close();
		
		return res;
	}
	
	// 회원 정보 수정
	public void updateUserInfo(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession(true); // auto commit
				
		ss.update("member.updateuserinfo", vo);
		ss.close();
	}
			
	// 회원 탈퇴
	public void withdrawUser(String memid) {
		SqlSession ss = FactoryService.getFactory().openSession(true); // auto commit
				
		ss.delete("member.withdrawuser", memid);
		ss.close();
	}
}