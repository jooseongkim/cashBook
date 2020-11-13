package kr.co.gdu.cash.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restService.MemberRestService;

@RestController
public class MemberRestController {
	@Autowired private MemberRestService memberRestService;

	@PostMapping("/admin/idCheck")
	public String idCheck(@RequestParam(value = "id") String id) {
		String returnId = memberRestService.getMemberId(id);
		
		if(returnId == null) {
			return "yes";
		} 
		return "No";
	}
}
