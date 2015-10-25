<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ include file="top.jsp" %>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>



<script>

function test() {
	  $.ajax({
	   url : 'chartdata',
	   success : function(vals) {
	    //alert(vals);
	    var opt = [];
	    var opt1 = [];
	    var opt2 = [];
	    var opt3 = [];
	    var v = vals.split(",");
	    //alert(v);
	    //�ڹٽ�ũ��Ʈ �� ���ο� opt�� �迭���� ������ �� �Ǽ������� ��ȯ 
	    //alert(v.length);
	    for (var i = 0; i < v.length; i++) {
	    	if(i>=0 && i<12){
	    		//alert(v[i]);
	    		opt.push([parseFloat(v[i])]);
	    	}else if(i>=12 && i<24){
	    		opt1.push([parseFloat(v[i])]);
	    	}else if(i>=24 && i<36){
	    		opt2.push([parseFloat(v[i])]);
	    	}else if(i>=36 && i<48){
	    		opt3.push([parseFloat(v[i])]);
	    	}
	     
	    }
	    //alert(opt.length);
	    //alert(opt);
	    /* alert(opt1.length);
	    alert(opt2.length);
	    alert(opt3.length);
	     */
	    
	    //alert(opt.length+":"+v.length);
	    //alert(typeof(opt[0]))
	    //-------------------------
	    //alert("test:"+opt.length);
	   $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Monthly Average Rainfall'
        },
        subtitle: {
            text: 'Source: WorldClimate.com'
        },
        xAxis: {
            categories: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rainfall (mm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Tokyo',
            /* data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4] */
			data : opt
        }, {
            name: 'New York',
            /* data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3] */
            data : opt1
        }, {
            name: 'London',
            /* data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2] */
			data : opt2
        }, {
            name: 'Berlin',
            /* data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1] */
			data : opt3
        }]
    });
	    
	    //----------------------------
	   }
	  });
	 }
	 $(function() {
	  test();
	 });
</script>

 <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

 
 
 <%@ include file="bottom.jsp" %>
 