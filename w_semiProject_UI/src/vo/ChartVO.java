package vo;

public class ChartVO {//��Ʈ
	private String chartdate; //��Ʈ��¥
	private int misscnt, foundcnt, carecnt, adoptioncnt;
				// �����Ű��, �߽߰Ű��, ��ȣ �� , �Ծ� ��
	public String getChartdate() {
		return chartdate;
	}
	public void setChartdate(String chartdate) {
		this.chartdate = chartdate;
	}
	public int getMisscnt() {
		return misscnt;
	}
	public void setMisscnt(int misscnt) {
		this.misscnt = misscnt;
	}
	public int getFoundcnt() {
		return foundcnt;
	}
	public void setFoundcnt(int foundcnt) {
		this.foundcnt = foundcnt;
	}
	public int getCarecnt() {
		return carecnt;
	}
	public void setCarecnt(int carecnt) {
		this.carecnt = carecnt;
	}
	public int getAdoptioncnt() {
		return adoptioncnt;
	}
	public void setAdoptioncnt(int adoptioncnt) {
		this.adoptioncnt = adoptioncnt;
	}
}
