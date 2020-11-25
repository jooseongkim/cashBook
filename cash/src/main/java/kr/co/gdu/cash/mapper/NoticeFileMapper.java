package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.NoticeFile;

@Mapper
public interface NoticeFileMapper {
	int insertNoticeFile(NoticeFile noticeFile);
	int deleteNoticeFile(int noticeId);
	List<String> selectNoticeFileNameList(int noticeId);
	int deleteNoticeFileOne(String noticeFileName);
}
