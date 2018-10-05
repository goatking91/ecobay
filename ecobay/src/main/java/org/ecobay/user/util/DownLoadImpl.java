package org.ecobay.user.util;


import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownLoadImpl extends AbstractView{
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	 @Override
	 protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse res) throws Exception {
		 
		 	String originalFileName = (String) map.get("orgFileName");
			String systemFileName = (String)map.get("systemFileName");
			
			String userAgent = req.getHeader("User-Agent");
			
			//브라우저 확인
			if(userAgent.indexOf("Trident")!= -1){ //Chrome
				originalFileName = new String(originalFileName.getBytes("utf-8"), "ISO-8859-1");
			}else{ //IE
				originalFileName = URLEncoder.encode(originalFileName, "utf-8");
			}
			
			//binary
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; filename="+originalFileName+";");
			
	        File file = new File(uploadPath, systemFileName);
			FileUtils.copyFile(file, res.getOutputStream());
	 
	    }
}
