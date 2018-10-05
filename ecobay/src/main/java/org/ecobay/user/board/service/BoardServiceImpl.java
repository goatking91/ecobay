package org.ecobay.user.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.user.board.persistence.NoticeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static int COUNT = 1;
	
	
	/*@Autowired
	private FaqDAO faqDao;*/
	
	@Autowired
	private NoticeDAO noticeDao;
	
	/*@Autowired
	private QnaDAO qnaDao;*/
	
	
	/* ============================================
	 * FAQ
	 * ============================================ */
	

	
	
	/* ============================================
	 * NOTICE
	 * ============================================ */
	
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return noticeDao.noticeList();
	}

	@Override
	public NoticeVO noticeLoad(int notice_idx) throws Exception {
		return noticeDao.noticeLoad(notice_idx);
	}

	@Override
	public void noticeViewCnt(int notice_idx) throws Exception {
		noticeDao.noticeViewCnt(notice_idx);
		
	}

	
	
	
	/* ============================================
	 * QNA
	 * ============================================ */

	
	


}
