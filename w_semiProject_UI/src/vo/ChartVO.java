package vo;

public class ChartVO {//차트
	private String chartdate; //차트날짜
	private int misscnt, foundcnt, carecnt, adoptioncnt;
				// 실종신고수, 발견신고수, 보호 수 , 입양 수
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
