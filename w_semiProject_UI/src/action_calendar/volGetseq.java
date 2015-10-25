package action_calendar;

import com.opensymphony.xwork2.Action;

import dao.volunteerDao;

public class volGetseq implements Action{

//	private int seq;
	private String seq;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		//그냥 인트로 할 시 getseq.jsp에서 ${seq}로 받지를 못함.
		//처음에 null포인터가 나버림!!!!!!
		int temp_seq=volunteerDao.getDao().getSeq();
		System.out.println("=-=-=-=-=-=-=-="+temp_seq+"--=--0-0-0-0=-0-=0-");
		seq=Integer.toString(temp_seq+1); //순서가 insert부터 안되고, getseq부터 되서 1을 더해줌.
		return SUCCESS;
	}

	public String getSeq() {
		return seq;
	}

//	public int getSeq() {
//		return seq;
//	}
	
	
}
