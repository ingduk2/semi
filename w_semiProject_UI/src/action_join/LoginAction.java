package action_join;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import dao.MemberDao;
import vo.MemberVO;

public class LoginAction implements Action, Preparable, ModelDriven<MemberVO>, SessionAware {

	private MemberVO vo;
	private Map<String, Object> session;
	private String url;
	private int no;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public MemberVO getModel() {
		return vo;
	}
	
	@Override
	public void prepare() throws Exception {
		vo = new MemberVO();
	}
	
	@Override
	public String execute() throws Exception {
		
		boolean loginchk = false;
		
		loginchk = MemberDao.getDao().logincheck(vo);
		
		if (loginchk) {
			System.out.println("로그인 성공");
			if(url==null){
				url="index";
			}else{
				url=url+"?no="+no;
			}
			session.put("loginid", vo.getMemid());
			return SUCCESS;
		}else{
			System.out.println("로그인 실패");
			return "INPUT";
		}
	}
	
	//logout시 실행될 메서드
			public String logout() throws Exception{
				// 로그아웃일 때는 세션을 삭제한다. 
				session.remove("loginid");
				return SUCCESS;
			}
	
	
}
