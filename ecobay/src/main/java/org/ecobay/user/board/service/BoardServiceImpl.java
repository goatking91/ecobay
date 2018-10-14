package org.ecobay.user.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.domain.QnaVO;
import org.ecobay.user.board.persistence.FaqDAO;
import org.ecobay.user.board.persistence.NoticeDAO;
import org.ecobay.user.board.persistence.QnaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static int COUNT = 1;
	
	
	/*@Autowired
	private FaqDAO faqDao;*/
	
	@Autowired
	private NoticeDAO noticeDao;
	
	@Autowired
	private QnaDAO qnaDao;
	
	@Autowired
	private FaqDAO faqDao;
	
	
	/* ============================================
	 * FAQ
	 * ============================================ */
	
	@Override
	public List<FaqVO> faqList(FaqVO faqVO) throws Exception {
		return faqDao.faqList(faqVO);
	}
	
	@Override
	public List<FaqVO> LoadFaqTopList() throws Exception {
		return faqDao.ajaxFaqTopList();
	}

	@Override
	public int selectFaqListCnt(FaqVO faqVO) throws Exception {
		return faqDao.selectFaqListCnt(faqVO);
	}
	
	
	/* ============================================
	 * NOTICE
	 * ============================================ */
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO vo) throws Exception {
		return noticeDao.noticeList(vo);
	}

	@Override
	public NoticeVO noticeLoad(int notice_idx) throws Exception {
		return noticeDao.noticeLoad(notice_idx);
	}

	@Override
	public void noticeViewCnt(int notice_idx) throws Exception {
		noticeDao.noticeViewCnt(notice_idx);
	}
	
	@Override
	public List<NoticeVO> LoadNoticeTopList() throws Exception {
		return noticeDao.ajaxNoticeTopList();
	}
	
	@Override
	public int selectNoticeListCnt(NoticeVO noticeVO) throws Exception {
		return noticeDao.selectNoticeListCnt(noticeVO);
	}


	
	/* ============================================
	 * QNA
	 * ============================================ */
	
	@Override
	public void qnaRegist(QnaVO vo) throws Exception {
		qnaDao.qnaRegist(vo);
	}


}
