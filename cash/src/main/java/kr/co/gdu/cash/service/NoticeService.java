package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private CashbookMapper cashbookMapper;

	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {
		// int currentPage , int rowPerPage 두개를 사용해서 beginRow를 구하면 됨
		// noticeMapper의 메서드를 호출한다
		Map<String, Integer> map = new HashMap<>();
		map.put("beginRow", (currentPage - 1) * rowPerPage);
		map.put("rowPerPage", rowPerPage);
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);
		return noticeList;
	}

	// Issue : notcieList 중복
	public Map<String, Object> getNoticeAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLastestNoticeList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;

	}

	public Notice getNoticeOne(int noticeId) {
		Notice noticeOne = noticeMapper.selectNoticeOne(noticeId);
		System.out.println(noticeOne + "noticeOne");
		return noticeOne;

	}

	public List<Notice> getNoticeList() {
		return noticeMapper.selectLastestNoticeList();
	}

	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}

	public int removeNoticeByNoticeId(int noticeId) {
		return noticeMapper.removeNotice(noticeId);
	}

	public int modifyNotice(Notice notice) {
		return noticeMapper.modifyNotice(notice);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
