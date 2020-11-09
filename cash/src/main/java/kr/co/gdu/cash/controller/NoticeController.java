package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	// 공지 목록 1
	@GetMapping("/admin/noticeList")
	public String noticeList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
			) {
		int rowPerPage = 10;
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		
		int totalCount = noticeService.getCount();	
		int lastPage = totalCount / rowPerPage;	
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		// noticeService 호출하기
		return "noticeList";
	}

	// 공지 입력 폼 2
	@GetMapping("/admin/addNotice")
	public String addNotice(Model model) {
		return "addNotice";
	}

	// 공지사항 입력 액션 3
	@PostMapping("/admin/addNotice")
	public String addNotice(Notice notice) {
		noticeService.addNotice(notice); // 서비스에서 입력하면
		return "redirect:/admin/noticeList"; // 여기로 전달
	}

	// 공지사항 상세보기 4
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model, @PathVariable(value = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "noticeOne";
	}

	// 공지사항 삭제 5
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String  removeNotice(Model model, @PathVariable(value = "noticeId") int noticeId) {
		noticeService.removeNoticeByNoticeId(noticeId);
		return "redirect:/admin/noticeList";
	}

	// 공지사항 수정 폼 6
	@PostMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, @PathVariable(value = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "modifyNotice";
	}

	// 공지사항 수정 액션 7
	@GetMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		noticeService.modifyNotice(notice);
		return "redirect:/admin/noticeOne?noticeId=" + notice.getNoticeId();
	}
}

//작업 순서 vo -> mapper -> mapper(쿼리) -> 