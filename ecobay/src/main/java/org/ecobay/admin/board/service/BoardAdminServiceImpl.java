package org.ecobay.admin.board.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.domain.QnaReplyVO;
import org.ecobay.admin.board.domain.QnaVO;
import org.ecobay.admin.board.persistence.FaqAdminDAO;
import org.ecobay.admin.board.persistence.NoticeAdminDAO;
import org.ecobay.admin.board.persistence.QnaAdminDAO;
import org.ecobay.user.util.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	private static int COUNT = 1;
	
	
	@Autowired
	private FaqAdminDAO faqDao;
	
	@Autowired
	private NoticeAdminDAO noticeDao;
	
	@Autowired
	private QnaAdminDAO qnaDao;
	
	
	/* ============================================
	 * FAQ
	 * ============================================ */
	@Override
	public void faqRegist(FaqVO vo) throws Exception {
		faqDao.regist(vo);
	}

	@Override
	public List<FaqVO> faqList(FaqVO vo) throws Exception {	
		return faqDao.faqList(vo);
	}

	@Override
	public FaqVO faqLoad(int faq_idx) throws Exception {
		return faqDao.faqLoad(faq_idx);
	}

	@Override
	public void faqUpdate(FaqVO vo) throws Exception {
		faqDao.faqUpdate(vo);
	}

	@Override
	public void faqDelete(int faq_idx) throws Exception {
		faqDao.faqDelete(faq_idx);
	}
	
	@Override
	public int selectFaqListCnt(FaqVO faqVO) throws Exception {
		return faqDao.selectFaqListCnt(faqVO);
	}

	
	/* ============================================
	 * NOTICE
	 * ============================================ */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void noticeRegist(NoticeVO vo) throws Exception {
		int maxNoticeFileCnt;
		vo.setNotice_idx(noticeDao.maxNoticeIDX());
		
		noticeDao.noticeRegist(vo);
		
		for (MultipartFile file : vo.getUpload()) {
			UUID uid = UUID.randomUUID();
			if (!file.isEmpty()) {
				
				String savedPath = UploadFileUtils.calcPath(uploadPath);
				
				String originalFileName = file.getOriginalFilename();
				String systemFileName = savedPath + File.separator + uid.toString() + "_" + originalFileName;
				
				File temp = new File(uploadPath, systemFileName);
				FileCopyUtils.copy(file.getBytes(), temp);

				NoticeFileVO noticeFile = new NoticeFileVO();
				noticeFile.setNotice_idx(vo.getNotice_idx());
				noticeFile.setFilename_org(originalFileName);
				noticeFile.setFilename(systemFileName);
				maxNoticeFileCnt = noticeDao.maxNoticeFileCnt();
				noticeFile.setFile_cd(maxNoticeFileCnt);
				noticeFile.setFile_idx(maxNoticeFileCnt);
				noticeFile.setFileSize(file.getSize());
				
				vo.addArticleFile(noticeFile);
				
				noticeDao.noticeFileInsert(noticeFile);
			}
		}

	}

	@Override
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception {
		return noticeDao.noticeList(noticeVO);
	}

	@Override
	public NoticeVO noticeLoad(int notice_idx) throws Exception {
		return noticeDao.noticeLoad(notice_idx);
	}
	
	@Override
	public void noticeUpdate(NoticeVO vo) throws Exception {
		int maxNoticeFileCnt;
		
    	NoticeVO oldNoticeVO = noticeDao.noticeLoad(vo.getNotice_idx());
    	
    	//두 VO합친 업데이트 될 VO
    	NoticeVO changeNoticeVO = new NoticeVO();
    	changeNoticeVO.setTitle(vo.getTitle());
    	changeNoticeVO.setContent(vo.getContent());
    	changeNoticeVO.setUpload(vo.getUpload());
    	
    	changeNoticeVO.setNotice_idx(oldNoticeVO.getNotice_idx());
    	changeNoticeVO.setRegDate(oldNoticeVO.getRegDate());
    	changeNoticeVO.setModDate(oldNoticeVO.getModDate());
    	changeNoticeVO.setUse_YN(oldNoticeVO.isUse_YN());
    	changeNoticeVO.setViewCNT(oldNoticeVO.getViewCNT());
    	changeNoticeVO.setFileVOList(oldNoticeVO.getFileVOList());
    	
    	//삭제가 false인 List
    	List<NoticeFileVO> oldFileDelFalseList =  new ArrayList<NoticeFileVO>();
    	NoticeFileVO oldNoticeFileVO = new NoticeFileVO();
    	
    	int oldFileListSize = changeNoticeVO.getFileVOList().size();
    	
    	//기존 파일의 수가 0이 아니면서, 첫번째 파일 인덱스가 0이 아닌 경우
		if (oldFileListSize != 0 && changeNoticeVO.getFileVOList().get(0).getFile_idx() != 0) {
    		for (int j = 0; j < oldFileListSize; j++) {
    			boolean del_yn = changeNoticeVO.getFileVOList().get(j).getDel_YN();
    			if (del_yn == false) {
    				oldNoticeFileVO = changeNoticeVO.getFileVOList().get(j);
    				oldFileDelFalseList.add(oldNoticeFileVO);
    			} 
    		}
    		
    		int changeUploadSize = changeNoticeVO.getUpload().size();
    		//삭제 하고 업로드
    		for (int i = 0; i < changeUploadSize; i++) {
        		MultipartFile file = changeNoticeVO.getUpload().get(i);
        		
        		if (!file.isEmpty()) {
        			
        			if (!oldFileDelFalseList.isEmpty() && changeUploadSize <= oldFileListSize ) {
        				int delFileIdx = oldFileDelFalseList.get(i).getFile_idx();
        				noticeDao.noticeFileDelete(delFileIdx);
        			}
        			
        			UUID uid = UUID.randomUUID();
        			
        			String savedPath = UploadFileUtils.calcPath(uploadPath);
        			
        			String originalFileName = file.getOriginalFilename();
        			String systemFileName = savedPath + File.separator + uid.toString() + "_" + originalFileName;
        			
        			File temp = new File(uploadPath, systemFileName);
        			FileCopyUtils.copy(file.getBytes(), temp);
        			
        			NoticeFileVO noticeFile = new NoticeFileVO();
        			noticeFile.setNotice_idx(changeNoticeVO.getNotice_idx());
        			noticeFile.setFilename_org(originalFileName);
        			noticeFile.setFilename(systemFileName);
        			maxNoticeFileCnt = noticeDao.maxNoticeFileCnt();
        			noticeFile.setFile_cd(maxNoticeFileCnt);
        			noticeFile.setFile_idx(maxNoticeFileCnt);
        			noticeFile.setFileSize(file.getSize());
        			
        			changeNoticeVO.addArticleFile(noticeFile);
        			
        			noticeDao.noticeFileInsert(noticeFile);
        		}
        		
        		//공지사항 업데이트
        		noticeDao.noticeUpdate(changeNoticeVO);
        		
    		}
    		
		} else {
			//그냥 업로드 진행
			for (int i = 0; i < changeNoticeVO.getUpload().size(); i++) {
	    		MultipartFile file = changeNoticeVO.getUpload().get(i);
	    		
	    		if (!file.isEmpty()) {
        			
	    			UUID uid = UUID.randomUUID();
	    			
	    			String savedPath = UploadFileUtils.calcPath(uploadPath);
	    			
	    			String originalFileName = file.getOriginalFilename();
	    			String systemFileName = savedPath + File.separator + uid.toString() + "_" + originalFileName;
	    			
	    			File temp = new File(uploadPath, systemFileName);
	    			FileCopyUtils.copy(file.getBytes(), temp);
	    			
	    			NoticeFileVO noticeFile = new NoticeFileVO();
	    			noticeFile.setNotice_idx(changeNoticeVO.getNotice_idx());
	    			noticeFile.setFilename_org(originalFileName);
	    			noticeFile.setFilename(systemFileName);
	    			maxNoticeFileCnt = noticeDao.maxNoticeFileCnt();
	    			noticeFile.setFile_cd(maxNoticeFileCnt);
	    			noticeFile.setFile_idx(maxNoticeFileCnt);
	    			noticeFile.setFileSize(file.getSize());
	    			
	    			changeNoticeVO.addArticleFile(noticeFile);
	    			
	    			noticeDao.noticeFileInsert(noticeFile);
        		}
			}
			
			//공지사항 업데이트
    		noticeDao.noticeUpdate(changeNoticeVO);
			
		}
		
	}

	@Override
	public void noticeDelete(int notice_idx) throws Exception {
		noticeDao.noticeDelete(notice_idx);
		
	}

	@Override
	public void noticeViewCnt(int notice_idx) throws Exception {
		noticeDao.noticeViewCnt(notice_idx);
	}
	
	@Override
	public int selectNoticeListCnt(NoticeVO noticeVO) throws Exception {
		return noticeDao.selectNoticeListCnt(noticeVO);
	}
	
	@Override
	public void noticeFileDelete(int file_idx) throws Exception {
		noticeDao.noticeFileDelete(file_idx);
		
	}
	
	
	/* ============================================
	 * QNA
	 * ============================================ */
	@Override
	public List<QnaVO> qnaList(QnaVO qnaVO) throws Exception {
		return qnaDao.qnaList(qnaVO);
	}
	
	@Override
	public QnaVO qnaLoad(int qna_idx) throws Exception {
		return qnaDao.qnaLoad(qna_idx);
	}

	@Override
	public void qnaDelete(int qna_idx) throws Exception {
		qnaDao.qnaDelete(qna_idx);
		
	}
	
	@Override
	public void qnaReplyRegist(QnaReplyVO vo) throws Exception {
		qnaDao.qnaReplyRegist(vo);
	}

	@Override
	public void qnaReplyDelete(int qnarp_idx) throws Exception {
		qnaDao.qnaReplyDelete(qnarp_idx);
	}

	@Override
	public int selectQnaListCnt(QnaVO qnaVO) throws Exception {
		return qnaDao.selectQnaListCnt(qnaVO);
	}

}
