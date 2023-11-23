package com.techblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

// This class is use for uploading and deleting the files(pictures)
public class helper {
	
	public static boolean deletFile(String path) {
		boolean f=false;
		
		try {
			File file = new File(path);
			f=file.delete();
		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
		return f;
	}
	
	public static boolean saveFile(InputStream is,String path) {
		boolean f = false;
		
		try {
			byte b[]= new byte[is.available()];
			
			is.read(b);
			
			FileOutputStream fos =new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}

}
