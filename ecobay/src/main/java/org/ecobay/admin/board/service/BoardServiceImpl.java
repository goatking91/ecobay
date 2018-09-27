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

}
