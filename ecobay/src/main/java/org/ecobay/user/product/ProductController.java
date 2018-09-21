package org.ecobay.user.product;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.ecobay.user.product.domain.AuctionInfoVO;
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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
    public String regGET(Model model) throws Exception {
		model.addAttribute("bigclass", service.bigclassList());

    	return "product/register.page";
    }
	
	@RequestMapping(value = "/reg.do", method = RequestMethod.POST)
    public String regPOST(ProductVO vo) throws Exception {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setMember_id(user.getUsername());
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

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
    public String list(ProductVO vo, Model model) throws Exception {
		model.addAttribute("bigclass", service.bigclassList());
		
		vo.setStart_num(1);
		vo.setEnd_num(18);
		model.addAttribute("productList", service.selectList(vo));

    	return "product/list.page";
    }
	
    @ResponseBody
    @RequestMapping(value = "/list.do/{page}", method = RequestMethod.POST)
    public Map<String, List<ProductVO>> listPOST(@PathVariable("page") int page, ProductVO vo) throws Exception {
    	
		vo.setStart_num((page-1) * 3 + 1 );
		vo.setEnd_num(page * 3);
		
		Map<String, List<ProductVO>> map = new HashMap<String, List<ProductVO>>();
    	
		map.put("arr", service.selectList(vo));
    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/midclass.do/{class_big_cd}", method = RequestMethod.GET)
    public ResponseEntity<List<ProductVO>> classList(@PathVariable("class_big_cd") String class_big_cd) throws Exception {
  
    	return new ResponseEntity<List<ProductVO>>(service.midclassList(class_big_cd) ,HttpStatus.OK);
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
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		
		logger.info("delete file: " + fileName);
		
		/*String formatName = fileName.substring(fileName.lastIndexOf(".")+1);*/
			
		String front = fileName.substring(0, 12);
		String end = fileName.substring(14);
		new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}
