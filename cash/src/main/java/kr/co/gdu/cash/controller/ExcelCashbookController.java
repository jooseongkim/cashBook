package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.vo.Cashbook;

@Controller
@Scope("singleton")
public class ExcelCashbookController {

	@GetMapping(path = "/admin/cashbookListExcel", produces = "application/vnd.ms-excel")
	public String cashbookListExcel() {
		return "cashbookExcelView";
	}

}

@Component
@Scope("prototype") // 컴포넌트타입의 스코프의 디폴트값은 "singleton"
class cashbookExcelView extends AbstractXlsView {
	@Autowired
	CashbookService cashbookService;

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 응답 내용을 파일로 전송 (파일 이름은 cashbook.xls)
		response.setHeader("Content-Disposition", "attachment; filname=\"cashbook.xls\"");
		
		List<Cashbook> cashbookList =  cashbookService.getCashbookListAll();
		
		// 엑셀 시트 생성
		Sheet sheet = workbook.createSheet("sheet1");
		
		// 시트 안에 행 생성
		Row titleRow = sheet.createRow(0);
		titleRow.createCell(0).setCellValue("번호");
		titleRow.createCell(1).setCellValue("수입/지출");
		titleRow.createCell(2).setCellValue("카테고리");
		titleRow.createCell(3).setCellValue("가격");
		titleRow.createCell(4).setCellValue("내용");
		titleRow.createCell(5).setCellValue("기록일시");
		titleRow.createCell(6).setCellValue("생성 날짜");
		titleRow.createCell(7).setCellValue("수정 날짜");

		// 시트 안에 셀 생성
		for(int i =1; i<cashbookList.size(); i++) {
			Row row = sheet.createRow(i);
			row.createCell(0).setCellValue(cashbookList.get(i).getCashbookId());
			row.createCell(1).setCellValue(cashbookList.get(i).getCashbookKind());
			row.createCell(2).setCellValue(cashbookList.get(i).getCategoryName());
			row.createCell(3).setCellValue(cashbookList.get(i).getCashbookPrice());
			row.createCell(4).setCellValue(cashbookList.get(i).getCashbookContent());
			row.createCell(5).setCellValue(cashbookList.get(i).getCashbookDate());
			row.createCell(6).setCellValue(cashbookList.get(i).getCreateDate());
			row.createCell(7).setCellValue(cashbookList.get(i).getUpdateDate());
		}

				
	}
}
