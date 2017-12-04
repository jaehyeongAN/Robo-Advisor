package spring.project.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CreationHelper;

import spring.project.vo.DispVO;
import spring.project.vo.MoneyVO;

public class DispService {

	public DispVO Display(MoneyVO vo) {
		// TODO Auto-generated constructor stub

		int lev = Calc.Lev(vo.getAge(), vo.getSumIncome()); // 나이대별 등급 책정

		MoneyVO exp = new MoneyVO();
		exp = Calc.expense_calc(vo.getAge(), lev); // 나이대별 등급에 따른 평균 지출값

		DispVO dv = new DispVO();

		dv = Calc.display(vo, exp);
		return dv;

	}
	
	  public MoneyVO Expen(MoneyVO vo){
	      int lev = Calc.Lev(vo.getAge(), vo.getSumIncome()); // 나이대별 등급 책정

	      MoneyVO exp = new MoneyVO();
	      exp = Calc.expense_calc(vo.getAge(), lev); // 나이대별 등급에 따른 평균 지출값
	      
	      return exp;
	   } 
	
	
	public void saveExcel(MoneyVO vo, DispVO dv) {

		File xlsFile = null;
		FileOutputStream fileOut = null;
		System.out.println("저장?");

		try {
			Date now = new Date();
			String d = new SimpleDateFormat("yyyy-MM-dd_hh;mm;ss").format(now);
			String sXlsPath = "../workspace(sts)/Project_finance/src/FinanceTable/FinanceTable_"+vo.getId()+"_"+d+".xls";
			xlsFile = new File(sXlsPath);

			// Workbook 및 Helper 생성
			HSSFWorkbook wb = new HSSFWorkbook();
			CreationHelper createHelper = wb.getCreationHelper();

			// Sheet 생성
			HSSFSheet hssfSheet = wb.createSheet("SHEET_1");

			// Row 생성
			HSSFRow row = hssfSheet.createRow(0);
			// Cell 생성
			HSSFCell cell = row.createCell(0);
			cell.setCellValue("결과창");
			cell = row.createCell(3);
			cell.setCellValue("아이디");
			cell = row.createCell(4);
			cell.setCellValue(vo.getId());
			cell = row.createCell(6);
			cell.setCellValue("나이");
			cell = row.createCell(7);
			cell.setCellValue(vo.getAge());

			row = hssfSheet.createRow(1);
			cell = row.createCell(0);
			cell.setCellValue("고정수입");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedIncome());
			cell = row.createCell(3);
			cell.setCellValue("변동수입");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucIncome());
			cell = row.createCell(6);
			cell.setCellValue("총수입");
			cell = row.createCell(7);
			cell.setCellValue(vo.getSumIncome());

			row = hssfSheet.createRow(2);
			cell = row.createCell(0);
			cell.setCellValue("고정지출");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedExpense());
			cell = row.createCell(3);
			cell.setCellValue("변동지출");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucExpense());
			cell = row.createCell(6);
			cell.setCellValue("총지출");
			cell = row.createCell(7);
			cell.setCellValue(vo.getSumExpense());

			row = hssfSheet.createRow(3);
			cell = row.createCell(6);
			cell.setCellValue("수지차");
			cell = row.createCell(7);
			cell.setCellValue(vo.getSumIncome() - vo.getSumExpense());

			row = hssfSheet.createRow(4);
			cell = row.createCell(0);
			cell.setCellValue("주거비용");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedHome());
			cell = row.createCell(3);
			cell.setCellValue("생활용품");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucLife());

			row = hssfSheet.createRow(5);
			cell = row.createCell(0);
			cell.setCellValue("식비");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedFood());
			cell = row.createCell(3);
			cell.setCellValue("의류미용");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucBeauty());

			row = hssfSheet.createRow(6);
			cell = row.createCell(0);
			cell.setCellValue("통신비");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedCommunication());
			cell = row.createCell(3);
			cell.setCellValue("문화레저");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucLeisure());

			row = hssfSheet.createRow(7);
			cell = row.createCell(0);
			cell.setCellValue("교통비");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedTrans());
			cell = row.createCell(3);
			cell.setCellValue("의료비");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucMedical());

			row = hssfSheet.createRow(8);
			cell = row.createCell(0);
			cell.setCellValue("보험료");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedInsurance());
			cell = row.createCell(3);
			cell.setCellValue("경조사비");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucEvent());

			row = hssfSheet.createRow(9);
			cell = row.createCell(0);
			cell.setCellValue("세금");
			cell = row.createCell(1);
			cell.setCellValue(vo.getFixedTax());
			cell = row.createCell(3);
			cell.setCellValue("기타비용");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlueEtc());

			row = hssfSheet.createRow(10);
			cell = row.createCell(3);
			cell.setCellValue("교육비");
			cell = row.createCell(4);
			cell.setCellValue(vo.getFlucEdu());
			
			row = hssfSheet.createRow(11);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFixedHome());
		
			row = hssfSheet.createRow(12);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFixedFood());
			
			row = hssfSheet.createRow(13);
			cell = row.createCell(0);
			cell.setCellValue(dv.getCommunication());
			
			row = hssfSheet.createRow(14);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFixedTrans());
			
			row = hssfSheet.createRow(15);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFixedInsurance());
			
			row = hssfSheet.createRow(16);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFixedTax());
			
			
			row = hssfSheet.createRow(17);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFlucLife());
			
			row = hssfSheet.createRow(18);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFlucBeauty());
			
			row = hssfSheet.createRow(19);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFlucLeisure());
			
			row = hssfSheet.createRow(20);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFlucMedical());
			
			row = hssfSheet.createRow(21);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFlucEvent());
			
			row = hssfSheet.createRow(22);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFlueEtc());
			
			row = hssfSheet.createRow(23);
			cell = row.createCell(0);
			cell.setCellValue(dv.getFlucEdu());

			// #. Excel 파일 출력
			fileOut = new FileOutputStream(xlsFile);
			wb.write(fileOut);

			System.out.println("저장????");
		} catch (IOException e) {
			e.printStackTrace();

			System.out.println("에러???");
		} finally {
			if (fileOut != null)
				try {
					fileOut.close();
				} catch (Exception ex) {
				}
		}
	}

}