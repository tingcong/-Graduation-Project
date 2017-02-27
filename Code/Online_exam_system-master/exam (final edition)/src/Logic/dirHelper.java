package Logic;

import java.io.File;

public class dirHelper {
	public static void makeDir(String dir){
		File file =new File(dir); 
		if  (!file.exists()  && !file.isDirectory())      
		{       
		    file.mkdirs();
		}
	}
}
