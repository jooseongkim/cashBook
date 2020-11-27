package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeFileMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeFile;
import kr.co.gdu.cash.vo.NoticeForm;

@Service
@Transactional
public class NoticeService {
	// aws 서버용
	 private final String PATH = "/home/ubuntu/tomcat9/webapps/cash/upload/";
	// 집
	// private final String PATH = "C:\\Users\\wntjd\\git\\cashBook\\cash\\src\\main\\webapp\\upload\\";
	// 학원
	// private final String PATH = "C:\\Users\\GD\\Desktop\\jsgit\\cashbook\\cashBook\\cash\\src\\main\\webapp\\upload\\";
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private CashbookMapper cashbookMapper;
	@Autowired
	private NoticeFileMapper noticeFileMapper;

	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {
		// int currentPage , int rowPerPage �몢媛쒕�� �궗�슜�빐�꽌 beginRow瑜� 援ы븯硫� �맖
		// noticeMapper�쓽 硫붿꽌�뱶瑜� �샇異쒗븳�떎
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage - 1) * rowPerPage);
		map.put("rowPerPage", rowPerPage);
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);
		return noticeList;
	}

	public int getNoticeCount() {
		return noticeMapper.selectNoticeCount();
	}

	// Issue : notcieList 以묐났
	public Map<String, Object> getNoticeAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLastestNoticeList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;

	}

	public Notice getNoticeOne(int noticeId) {
		return noticeMapper.selectNoticeOne(noticeId);

	}

	public List<Notice> getNoticeList() {
		return noticeMapper.selectLastestNoticeList();
	}

	public void addNotice(NoticeForm noticeForm) {

		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		noticeMapper.insertNotice(notice);

		List<NoticeFile> noticefile = null;
		if (noticeForm.getNoticeFile() != null) {
			noticefile = new ArrayList<NoticeFile>();
			for (MultipartFile mf : noticeForm.getNoticeFile()) {
				NoticeFile nf = new NoticeFile();
				nf.setNoticeId(notice.getNoticeId());

				int p = mf.getOriginalFilename().lastIndexOf(".");

				String ext = mf.getOriginalFilename().substring(p).toLowerCase();

				String fileName = UUID.randomUUID().toString().replace("-", " ");
				
				nf.setNoticeFileId(notice.getNoticeId());
				nf.setNoticeFileName(fileName + ext);
				nf.setNoticeFileSize(mf.getSize());
				nf.setNoticeFileType(mf.getContentType());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH + fileName + ext));
					System.out.println(PATH+"*PATH*");
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}

			}
		}
		if (noticefile != null) {
			for (NoticeFile nf : noticefile) {
				noticeFileMapper.insertNoticeFile(nf);
			}
		}
	}

	public void removeNoticeByNoticeId(int noticeId) {
		List<String> noticefileList = noticeFileMapper.selectNoticeFileNameList(noticeId);
		// 실제 파일 삭제
		for(String s : noticefileList) {
			File f = new File(PATH + s);
			f.delete();
		}

		noticeFileMapper.deleteNoticeFile(noticeId);

		noticeMapper.removeNotice(noticeId);
		return;
	}

	public int removeNoticefileOne(String noticeFileName) {

		File f = new File(PATH + noticeFileName);
		f.delete();
		
		return noticeFileMapper.deleteNoticeFileOne(noticeFileName);
	}

	public void modifyNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		noticeMapper.modifyNotice(notice);
		
		// 공지사항 파일 추가
		// 파일이 들어 올 시 실제 파일 저장, 리스트에 파일 정보 저장
		List<NoticeFile> noticefile = null;
		if(noticeForm.getNoticeFile()!= null) {
			noticefile = new ArrayList<NoticeFile>();
			// 파일을 각각 저장 -> 파일의 개수만큼 반복
			for(MultipartFile mf : noticeForm.getNoticeFile()) {
				NoticeFile nf = new NoticeFile();
				int p = mf.getOriginalFilename().lastIndexOf("."); // 확장자 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");

				// 파일 정보 저장
				nf.setNoticeId(notice.getNoticeId());
				nf.setNoticeFileName(filename + ext);
				nf.setNoticeFileSize(mf.getSize());
				nf.setNoticeFileType(mf.getContentType());
				
				// 리스트에 저장
				noticefile.add(nf);
				
				try {
					mf.transferTo(new File(PATH + filename + ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		// 파일이 들어 올 시 리스트를 DB에 저장
		if(noticefile != null) {
			for(NoticeFile nf : noticefile) {
				noticeFileMapper.insertNoticeFile(nf);
			}
		}
		return;
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
