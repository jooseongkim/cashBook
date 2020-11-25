package kr.co.gdu.cash.vo;

import lombok.Data;

@Data
public class NoticeFile {
	private int noticeFileId;
	private int noticeId;
	private String noticeFileName;
	private String noticeFileType;
	private long noticeFileSize;
}
