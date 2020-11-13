package kr.co.gdu.cash.restService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.MemberRestMapper;

@Service
@Transactional
public class MemberRestService {
	@Autowired
	private MemberRestMapper memberRestMapper;

	public String getMemberId(String id) {
		return memberRestMapper.selectMemberId(id);
	}
	
	public Map<String, Object> getTotalMonthlyExpendituresByYear() {
		return memberRestMapper.selectTotalMonthlyExpendituresByYear();
	}
	
	public Map<String, Object> getTotalOutAndInByYear(int year) {
		return memberRestMapper.selectTotalOutAndInByYear(year);
	}
}
