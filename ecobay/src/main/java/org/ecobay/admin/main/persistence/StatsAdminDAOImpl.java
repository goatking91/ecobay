package org.ecobay.admin.main.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.main.domain.StatsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatsAdminDAOImpl implements StatsAdminDAO {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.StatsMapper";
	
	@Override
	public List<StatsVO> memberJoinDays(StatsVO svo) throws Exception {
		return session.selectList(namespace + ".memberJoinDays", svo);
	}

	@Override
	public List<StatsVO> memberJoinDaysM(StatsVO svo) throws Exception {
		return session.selectList(namespace + ".memberJoinDaysM", svo);
	}

	@Override
	public List<StatsVO> memberJoinDaysF(StatsVO svo) throws Exception {
		return session.selectList(namespace + ".memberJoinDaysF", svo);
	}

	@Override
	public List<StatsVO> productPayState(StatsVO svo) throws Exception {
		return session.selectList(namespace + ".productPayState", svo);
	}

	@Override
	public List<StatsVO> productState(StatsVO svo) throws Exception {
		return session.selectList(namespace + ".productState", svo);
	}
}
