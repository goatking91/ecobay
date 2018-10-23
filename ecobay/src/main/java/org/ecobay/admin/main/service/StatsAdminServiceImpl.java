package org.ecobay.admin.main.service;

import java.util.List;

import org.ecobay.admin.main.domain.StatsVO;
import org.ecobay.admin.main.persistence.StatsAdminDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatsAdminServiceImpl implements StatsAdminService {
	
	@Autowired
	private StatsAdminDAO dao;

	@Override
	public List<StatsVO> memberJoinDays(StatsVO svo) throws Exception {
		return dao.memberJoinDays(svo);
	}

	@Override
	public List<StatsVO> memberJoinDaysM(StatsVO svo) throws Exception {
		return dao.memberJoinDaysM(svo);
	}

	@Override
	public List<StatsVO> memberJoinDaysF(StatsVO svo) throws Exception {
		return dao.memberJoinDaysF(svo);
	}

	@Override
	public List<StatsVO> productPayState(StatsVO svo) throws Exception {
		return dao.productPayState(svo);
	}

	@Override
	public List<StatsVO> productState(StatsVO svo) throws Exception {
		return dao.productState(svo);
	}
}
