/**
 * 
 */

function goUrl(url){
		location=url;
	}

function goList(url,param){
    if(!param)
        url=url;
    else
        url=url+"?"+param;
    location=url;
}