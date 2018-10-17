package org.ecobay.admin.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeAdminDAOImpl implements NoticeAdminDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.NoticeMapper";

	@Override
	public void noticeRegist(NoticeVO vo) throws Exception {
		session.insert(namespace + ".insertNotice", vo);
	}

	@Override
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception {
		return session.selectList(namespace + ".selectNoticeList", noticeVO);	
	}

	@Override
	public NoticeVO noticeLoad(int notice_idx) throws Exception {
		return session.selectOne(namespace + ".selectNoticeOne", notice_idx);
	}

	@Override
	public void noticeUpdate(NoticeVO vo) throws Exception {
		session.update(namespace + ".updateNotice", vo);
		
	}

	@Override
	public void noticeDelete(int notice_idx) throws Exception {
		session.update(namespace + ".deleteNotice", notice_idx);
		
	}

	@Override
	public void noticeViewCnt(int notice_idx) throws Exception {
		session.update(namespace + ".updateViewCnt", notice_idx);
		
	}

	@Override
	public void noticeFileInsert(NoticeFileVO vo) throws Exception {
		session.insert(namespace + ".insertNoticeFile", vo);
		
	}

	@Override
	public int maxNoticeFileCnt() throws Exception {
		return session.selectOne(namespace + ".maxNoticeFileCnt");
	}

	@Override
	public int maxNoticeIDX() throws Exception {
		return session.selectOne(namespace + ".maxNoticeIDX");
	}

	@Override
	public int selectNoticeListCnt(NoticeVO vo) throws Exception {
		return session.selectOne(namespace + ".selectNoticeListCnt", vo);
	}

	@Override
	public void noticeFileDelete(int file_idx) throws Exception {
		session.insert(namespace + ".deleteNoticeFile", file_idx);
	}

}
