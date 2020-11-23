package kr.co.gdu.cash.restController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restService.MemberRestService;

@RestController
public class MemberRestController {
	@Autowired
	private MemberRestService memberRestService;

	@PostMapping("/admin/idCheck")
	public String idCheck(@RequestParam(value = "id") String id) {
		String returnId = memberRestService.getMemberId(id);

		if (returnId == null) {
			return "yes";
		}
		return "No";
	}

	@GetMapping("/totalOutAndInByYear/{year}")
	public Map<String, Object> totalOutAndInByYear(@PathVariable(name = "year") int year) {
		return memberRestService.getTotalOutAndInByYear(year);
	}

	@GetMapping("/totalMonthlyExpendituresByYear/{year}") // 연도별 월간 총 지출액 금액
	public Map<String, Object> totalMonthlyExpendituresByYear(@PathVariable(name = "year") int year) {
		return memberRestService.getTotalMonthlyExpendituresByYear(year);
	}
	@GetMapping("/lineDataset/{year}")
	public Map<String, Object> lineDataset(@PathVariable(name = "year") int year) {
		return memberRestService.getLineDataSet(year);
	}
	@GetMapping("/radarDataSet")
	public List<Map<String, Object>> radarDataSet() {
		return memberRestService.getRadarDataSet();
	}
	@GetMapping("/totalYearExpenditures")
	public List<Map<String, Object>> totalYearExpenditures() {
		return memberRestService.getTotalYearExpenditures();
	}
	@GetMapping("/TotalYearInCom")
	public List<Map<String, Object>> TotalYearInCom() {
		return memberRestService.getTotalYearInCom();
	}
}
