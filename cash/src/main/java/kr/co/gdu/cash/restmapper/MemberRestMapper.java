package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRestMapper {
	public String selectMemberId(String id);
	public Map<String, Object> selectTotalMonthlyExpendituresByYear(int year);
	
	public Map<String, Object> selectTotalOutAndInByYear(int year);
	
	public Map<String, Object> lineDataset(int year);
	
	public Map<String, Object> RadarDataSet();
}
