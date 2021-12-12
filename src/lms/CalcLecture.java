package lms;
import java.util.GregorianCalendar;


public class CalcLecture {
	
    //디데이 구하는 함수
    public static long Dday(String mday){
        if(mday==null)
            return 0;
        mday = mday.trim();
        int first = mday.indexOf(".");
        int last = mday.lastIndexOf(".");
        int year = Integer.parseInt(mday.substring(0,first));
        int month = Integer.parseInt(mday.substring(first+1,last));
        int day = Integer.parseInt(mday.substring(last+1,mday.length()));

        GregorianCalendar cal = new GregorianCalendar();
        long currentTime = cal.getTimeInMillis() / (1000*60*60*24);
        cal.set(year,month-1,day);
        long birthTime = cal.getTimeInMillis() / (1000*60*60*24);
        int interval = (int)(birthTime-currentTime);

        return interval;
    }
    
    
    public static String checkTakeClass(int percent) {
    	if (percent == 100)
    		return "수강완료";
    	else
    		return "미수강";
    }
    
    public static String calcLecture(int cnt, String s) {
    	
    	System.out.println(s);
    	String[] num = s.split("% ");
    	int sum = 0;

    	for (int i = 0 ; i< cnt; i++) {
    		sum += Integer.valueOf(num[i]); 
    	}
    	
    	int avg = sum/cnt;
    	
    	String rtn = String.valueOf(avg);
    	System.out.println(rtn);
    	
    	return rtn;
    }
    
    
    
    

}
