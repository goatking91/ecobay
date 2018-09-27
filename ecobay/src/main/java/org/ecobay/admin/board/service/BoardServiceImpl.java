package org.ecobay.admin.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.persistence.FaqDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private FaqDAO dao;

	@Override
	public void FaqRegist(FaqVO vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public List<FaqVO> faqList() throws Exception {	
		return dao.faqList();
	}

	@Override
	public FaqVO faqLoad(int faq_idx) throws Exception {

		return dao.faqLoad(faq_idx);
	}

	@Override
	public void faqUpdate(FaqVO vo) throws Exception {
		System.out.println(vo.getFaq_idx());
		dao.faqUpdate(vo);
	}

	@Override
	public void faqDelete(int faq_idx) throws Exception {
		dao.faqDelete(faq_idx);
	}

}
