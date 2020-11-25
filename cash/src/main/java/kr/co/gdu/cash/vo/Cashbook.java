package kr.co.gdu.cash.vo;

import lombok.Data;

@Data
public class Cashbook {
	private int cashbookId;
	private String cashbookKind;
	private String categoryName;
	private int cashbookPrice;
	private String cashbookContent;
	private String cashbookDate;
	private String createDate;
	private String updateDate;

}
