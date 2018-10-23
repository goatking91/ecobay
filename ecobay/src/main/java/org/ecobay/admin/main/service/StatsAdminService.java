package org.ecobay.admin.main.service;

import java.util.List;

import org.ecobay.admin.main.domain.StatsVO;

public interface StatsAdminService {
	public List<StatsVO> memberJoinDays(StatsVO svo) throws Exception;
	public List<StatsVO> memberJoinDaysM(StatsVO svo) throws Exception;
	public List<StatsVO> memberJoinDaysF(StatsVO svo) throws Exception;
	public List<StatsVO> productPayState(StatsVO svo) throws Exception;
	public List<StatsVO> productState(StatsVO svo) throws Exception;
}
