package service;
//�쁽�뾽�뿉�꽌�룄 �럹�씠吏� �븷 �븣 怨꾩냽 �궗�슜 �븷 肄붾뱶�씠�떎.  
public class Paging {
	//View 濡� �룎�젮以� �럹�씠吏� 媛�
	private String pagingCode;

	public String getPagingCode() {
		return pagingCode;
	}

	public void setPagingCode(String pagingCode) {
		this.pagingCode = pagingCode;
	}
	
	public Paging(int totalRecord, int nowPage, int numPerPage,
			int numPerBlock, String url, String params){
		//TotalRecord : 珥� �뜲�씠�꽣 �닔瑜� ���옣
		//nowPage: �쁽�옱 �럹�씠吏�
		//numperPage: �럹�씠吏��떦 紐� 以� �뵫 蹂댁뿬 以� 寃껋씤吏�.... --�븳�럹�씠吏��떦 蹂댁뿬以� 以� (寃뚯떆湲� �닔)
		//numPerBlock: �럹�씠吏� [1][2]... 釉붾줉�쓣 紐뉕컻濡� �젣�븳�븷 媛� -- �븘�옒�쓽 �럹�씠吏� 1.2.3.4.5 6 7 8 9 10 -1釉붾줉
																	//  1. 2. 3. 4. 5. --10 - 2釉�
		//url: �럹�씠吏� �씠�룞寃쎈줈瑜� ���옣
		//�쟾泥� �럹�씠吏� 媛� 諛� �쟾泥� 釉붾줉 媛� 援ы븯湲�.
		
		//�쟾泥� �럹�씠吏�媛� 2�럹�씠吏�媛� �엳�쑝硫�
		//1.1->2�럹�씠吏� 10/6=1.111 ->2 �럹�씠吏� 媛� �릺湲� �쐞�빐�꽌�뒗
		//Math.ceil()瑜� �궗�슜�븯硫� �맂�떎.
		int totalPage=(int) Math.ceil((double)totalRecord / numPerPage); // �쟾泥� / �럹�씠吏��떦 �닔 30/15=2�럹�씠吏�
			//�쟾泥� 釉붾줉媛믪쓣 援ы븳 媛�
			//�뿰�궛寃곌낵 : 1�럹�씠吏�遺��꽣 1 1 1 1 1->6�럹�씠吏� 1.1 1.2 1.3
		int totalBlock = (int) Math.ceil((double)totalPage/numPerBlock); // �쟾泥� / 釉붾줉 �닔 
			//�쁽�옱 �럹�씠吏� 媛믪뿉�꽌 �럹�씠吏� �젣�븳�닔瑜� �굹�늻�뼱�꽌 �쁽�옱 釉붾줉�쓽 媛믪쓣 援ы빐�빞 �븳�떎.
		int nowBlock=(int) Math.ceil((double)nowPage/numPerBlock); // 吏�湲덊럹�씠吏�/ 釉붾줉 �닔 �쁽�옱釉붾줉�쓽 媛�.
		
		//�럹�씠吏뺤쓣 援ы븯湲� �쐞�븳 �깭洹멸났�떇�쓣 ���옣�븯湲� �쐞�븳 �옄猷�
			//�씠�쟾 �럹�씠吏�瑜� 援ы쁽
		StringBuffer prev= new StringBuffer();
			//�떎�쓬 �럹�씠吏�瑜� 援ы쁽
		StringBuffer next= new StringBuffer();
			//�럹�씠吏� 媛� 援ы쁽
		StringBuffer paging= new StringBuffer();
			
		
		//�뼳 
		//�� 
		//�씠�쟾 �럹�씠吏� 援ы븯�뒗 怨듭떇
		//nowBlock>1 �씠硫� �씠�쟾 �럹�씠吏��쓽 留곹겕瑜� 援ы쁽. �씤�뜲 <a href='url?nowPage=(nowBlock -2)*numPerBlock +1'>��</a>&nbsp;&nbsp;
		//										  ��&nbsp;&nbsp;
		if(nowBlock > 1){ //nowBlock �씠 1蹂대떎 �겕�떎硫� �씠�쟾�럹�씠吏��쓽 留곹겕瑜� 援ы쁽
			prev.append("<a href='").append(url);
			prev.append("?nowPage=");
			prev.append((nowBlock - 2) * numPerBlock +1);
			prev.append(params);
			prev.append("'></a>&nbsp;&nbsp;");
		}else{
			prev.append("&nbsp;&nbsp;");
		}
		
		//�럹�씠吏� 異쒕젰
		for(int i=0; i<numPerBlock; i++){
			//異쒕젰�릺�뒗 �럹�씠吏� 媛�
			int printPage=((nowBlock-1)* numPerBlock)+i+1; //�쁽�옱 �럹�씠吏� 媛�-泥섏쓬�뿉�뒗 0�씤�뜲 1�럹�씠吏�瑜� 異쒕젰�븯湲� �쐞�빐 +1
			
			if(printPage==nowPage){// �쁽�옱 �럹�씠吏��씪 寃쎌슦 (留곹겕瑜� 嫄몃㈃ �븞�맖.
				paging.append("<font color='olive'>");
				paging.append(printPage).append("</font>");
				
			}else{
				//�쁽�옱 �럹�씠吏�媛� �븘�땺 寃쎌슦�뿉�뒗 �럹�씠吏��쓽李⑥씠瑜� �몢硫� �맂�떎.
				paging.append("<a href='").append(url);
				paging.append("?nowPage=");
				paging.append(printPage).append(params).append("'>");
				paging.append(printPage).append("</a>&nbsp;&nbsp;");
			}
			
			//�쟾泥� �럹�씠吏��� 媛숇떎硫�, �럹�씠吏� 異쒕젰臾몄쓣 鍮좎졇 �굹���빞 �븳�떎.
			
			if(printPage==totalPage){
				break;
			}
		}//for臾� 醫낅즺
		
		//�떎�쓬 �럹�씠吏�瑜� 援ы쁽: totalBlock �씠 nowBlock蹂대떎 �겢寃쎌슦 (釉붾줉蹂대떎 留롮븘吏�硫� �꽆�뼱媛�寃� 留곹겕.)
		//�럹�씠吏�瑜� �븯�굹 �뜑 留뚮뱾�뼱�빞 �븯誘�濡� <a href='url?nowPage=nowBlock*numPerBlock+1'>�뼳</a>
		if(totalBlock > nowBlock){
			next.append("<a href='").append(url);
			next.append("?nowPage=").append(nowBlock * numPerBlock +1);
			prev.append(params);
			next.append("'>").append("</a>");
		}else{
			next.append("&nbsp;&nbsp;"); //�씠嫄� �뾾�븷踰꾨━硫� �닲寃⑥�寃뚮맂�떎. 留곹겕
		}
		//�럹�씠吏�媛� �셿�꽦 �릺�뿀�쑝硫� 議고빀�맂 �럹�씠吏� 肄붾뱶�뿉 ���옣
		pagingCode=prev.toString() + paging.toString()
				+next.toString();
		
	}
	
	
}
