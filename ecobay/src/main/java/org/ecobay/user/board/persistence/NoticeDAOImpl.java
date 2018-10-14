package org.ecobay.user.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.NoticeVO;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.user.mapper.NoticeMapper";

	@Override
	public List<NoticeVO> noticeList(NoticeVO vo) throws Exception {
		return session.selectList(namespace + ".selectNoticeList", vo);	
	}

	@Override
	public NoticeVO noticeLoad(int notice_idx) throws Exception {
		return session.selectOne(namespace + ".selectNoticeOne", notice_idx);
	}

	@Override
	public void noticeViewCnt(int notice_idx) throws Exception {
		session.update(namespace + ".updateViewCnt", notice_idx);
		
	}

	@Override
	public List<NoticeVO> ajaxNoticeTopList() throws Exception {
		return session.selectList(namespace + ".selectNoticeTopList");	
	}

	@Override
	public int selectNoticeListCnt(NoticeVO vo) throws Exception {
		return session.selectOne(namespace + ".selectNoticeListCnt", vo);
	}


	
}
