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
	
	// ȸ�� ���� �� ���̵� �ߺ� üũ
	public int idCheck(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int idchk = ss.selectOne("member.idchk", vo);
		ss.close();
		
		return idchk;
	}
	
	// ȸ�� ���� �� �̸��� �ߺ� üũ
	public int emailCheck(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int emailchk = ss.selectOne("member.emailchk", vo);
		ss.close();
		
		return emailchk;
	}
	
	// ȸ�� ���� �� DB insert
	public void insertMember(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession(true); // auto commit
		
		ss.insert("member.insertmember", vo);
		ss.close();
	}
	
	// �α��� �� ���̵�, ��й�ȣ ��ġ ���� üũ
	public boolean logincheck(MemberVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		// ���̵� ���� ���� üũ
		int idchk = ss.selectOne("member.idchk", vo);
		
		// ���̵� ���� �� ��
		if (idchk == 1) {
			// ���̵� �ش��ϴ� ��й�ȣ���� üũ
			int pwdchk = ss.selectOne("member.pwdchk", vo);
			
			// ��й�ȣ ���� ��
			if (pwdchk == 1) {
				ss.close();
				return true;
			}
			// ��й�ȣ Ʋ�� ��
			else {
				ss.close();
				return false;
			}
		}
		// ���̵� ���� ���� ��
		else {
			ss.close();
			return false;
		}
	}
	
	// ȸ�� ���̵�� �ش� ������ ���� ����
	public MemberVO selectUserInfo(String memid) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		MemberVO res = ss.selectOne("member.selectuserinfo", memid);
		ss.close();
		
		return res;
	}
}
