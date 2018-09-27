package org.ecobay.admin.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.persistence.FaqDAO;
import org.ecobay.admin.board.persistence.NoticeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private FaqDAO faqDao;
	
	@Autowired
	private NoticeDAO noticeDao;
	
	
	/* FAQ */
	@Override
	public void faqRegist(FaqVO vo) throws Exception {
		faqDao.regist(vo);
	}

	@Override
	public List<FaqVO> faqList() throws Exception {	
		return faqDao.faqList();
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

	
	
	/* NOTICE */
	@Override
	public void noticeRegist(NoticeVO vo) throws Exception {
		noticeDao.noticeRegist(vo);
	}

	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return noticeDao.noticeList();
	}

	@Override
	public NoticeVO noticeLoad(int notice_idx) throws Exception {
		return noticeDao.noticeLoad(notice_idx);
	}

	@Override
	public void noticeUpdate(NoticeVO vo) throws Exception {
		noticeDao.noticeUpdate(vo);
		
	}

	@Override
	public void noticeDelete(int notice_idx) throws Exception {
		noticeDao.noticeDelete(notice_idx);
		
	}

	@Override
	public void noticeViewCnt(int notice_idx) throws Exception {
		noticeDao.noticeViewCnt(notice_idx);
	}

}
