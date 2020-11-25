package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper //public class NoticeMapperImpl implements NoticeMapper{} 가 만들어짐
public interface NoticeMapper {
	// 화면에 최근 5개 공지를 보여주는 메서드
	List<Notice> selectLastestNoticeList();
	
	List<Notice> selectNoticeListByPage(Map <String, Integer> map);
	
	int insertNotice(Notice notice);
	
	Notice selectNoticeOne(int noticeId);
	
	int modifyNotice(Notice notice);
	
	int removeNotice(int noticeId);

	int selectNoticeCount();
	
}
