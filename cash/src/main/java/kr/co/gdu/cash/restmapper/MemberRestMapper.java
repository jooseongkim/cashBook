package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRestMapper {
	public String selectMemberId(String id);
	public Map<String, Object> selectTotalMonthlyExpendituresByYear(int year);
	
	public Map<String, Object> selectTotalOutAndInByYear(int year);
	
	public Map<String, Object> lineDataset(int year);
	
	public List<Map<String, Object>> radarDataSet();
	
	public List<Map<String, Object>> selectTotalYearExpenditures();
	
	public List<Map<String, Object>> selectTotalYearInCome();
	
	public Map<String, Object> selectAvgMontlyIncome(int year);
	
	public Map<String, Object> selectAvgMontlyExpenditures(int year);
	
	public List<Map<String, Object>> selectAvgTotalYearIncome();
	
	public Map<String, Object> selectMontlyNetIncome(int year);
}
