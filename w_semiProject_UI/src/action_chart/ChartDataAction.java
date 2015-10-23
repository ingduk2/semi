package action_chart;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.Action;

import dao.chartDao;
import vo.z_chartVO;

public class ChartDataAction implements Action{
 private ArrayList<Double> data;
 private int sizev;
 @Override
 public String execute() throws Exception {
  //data = Dao.getList();
	 //여기서 디비의 값을 불러와서 dao를 통해서 그 arraylist에 값 넣으면 된다.
	 //data=asdf.dao.getdao.getdata():
  data = new ArrayList<Double>();
  
  /*
       name: 'Tokyo',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

        }, {
            name: 'New York',
            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

        }, {
            name: 'London',
            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

        }, {
            name: 'Berlin',
            data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
   */
  List<z_chartVO> list=chartDao.getDao().selectChart();
  for(z_chartVO e:list){
	  System.out.println(e.getA());
	  data.add(e.getA());
  }
  for(z_chartVO e:list){
	  data.add(e.getB());
  }
  for(z_chartVO e:list){
	  data.add(e.getC());
  }
  for(z_chartVO e:list){
	  data.add(e.getD());
  }
  
//  Double[] it ={1.0, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 
//    148.5, 216.4, 194.1, 95.6, 54.4};
//  for(Double e: it){
//   data.add(e);
//  }

  sizev=data.size();
  return SUCCESS;
 }

 public  ArrayList<Double> getData() {
  return data;
 }

 public int getSizev() {
  return sizev;
 }

}
