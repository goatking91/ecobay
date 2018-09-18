package org.ecobay.user.product;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.service.ProductService;
import org.ecobay.user.util.MediaUtils;
import org.ecobay.user.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/product")
@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value = "/reg.do", method = RequestMethod.GET)
    public String regGET() {
    	return "product/register.page";
    }
	
	@RequestMapping(value = "/reg.do", method = RequestMethod.POST)
    public String regPOST(ProductVO vo) throws Exception {
		// 상풍코드 생성 - [상품코드[상품코드(14자리) : 대분류코드(2자리) + 중분코드(2자리) + 날짜(yyMMdd(6자리)) + 일련번호(4자리) ]
		SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
		String sDate = transFormat.format(new Date());
		String searchVal = vo.getClass_big_cd() + vo.getClass_mid_cd() + sDate;
		
		System.out.println("searchVal = " + searchVal);
		
		int iMaxCnt = service.maxCnt(searchVal);
		
		String sproductcode = searchVal + String.format("%04d", iMaxCnt);
		vo.setProduct_cd(sproductcode);
		
		service.insert(vo);
		
    	return "redirect:/product/list.do";
    }
    
    @RequestMapping(value = "/detail.do")
    public String detail(@RequestParam("product_cd") String product_cd, Model model) throws Exception {
    	model.addAttribute("product", service.select(product_cd));
    	
    	return "product/detail.page";
    }
    
/*    @RequestMapping(value = "/modify.do", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("product_cd") String product_cd, Model model) throws Exception {
    	model.addAttribute("product", service.select(product_cd));
    	
    	return "product/modify.page";
    }
    
    @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
    public String modifyPOST(ProductVO vo) throws Exception {
    	service.update(vo);
    	
    	return "redirect:/product/detail.do";
    }*/
    
    @RequestMapping("/list.do")
    public String list(Model model) throws Exception {
    	model.addAttribute("productList", service.selectList());
    	
    	return "product/list.page";
    }
    
    @RequestMapping(value = "/midclass.do", method = RequestMethod.POST)
    public String classList(@RequestParam("class_big_cd") String class_big_cd, Model model) throws Exception {
    	System.out.println("class_big_cd = " + class_big_cd);
    	model.addAttribute("product", service.classList(class_big_cd));
    	return "product/register.page";
    }
    
    @RequestMapping(value = "/uploadAjax.do", method = RequestMethod.GET) 
    public void uploadAjax() {
    }
    
    @RequestMapping(value = "/uploadAjax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
    	
    	logger.info("originalName: " + file.getOriginalFilename());
    	logger.info(uploadPath);
    	return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
    }
    
    @ResponseBody
	@RequestMapping(value = "/displayFile.do")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME : " + fileName);
		
		try {
		
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\""); 
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
}
