package spring.project.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.mybatis.spring.SqlSessionTemplate;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import spring.project.vo.HouseVO;
import spring.project.vo.XmlVO2;
@Repository
public class HouseDaoImpl implements HouseDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	String name, rpay_type_nm, lend_rate_type_nm;
	int enterYear,requireMoney, savedMoney, saveMoney;
	double rate;
	int nowYear, accMoney, totalMoney, lackMoney, yearSave, monthSave, addMoney;
	double addMoney2, addMoney3;
	
	
	
	@Override
	public HouseVO house_calc(HouseVO vo) {
		// TODO Auto-generated method stub
		name = vo.getName();
		enterYear = vo.getEnterYear();
		requireMoney = vo.getRequireMoney();
		savedMoney = vo.getSavedMoney();
		saveMoney = vo.getSaveMoney();
		rate = vo.getRate();
		rpay_type_nm = vo.getRpay_type_nm();
		lend_rate_type_nm = vo.getLend_rate_type_nm();

		Calendar calendar = Calendar.getInstance();
		nowYear = calendar.get(Calendar.YEAR); // 현재년도
		
		// 목표주거금액을 위해 필요한 년/월 저축액
		yearSave = 0;
		for(int i= 1; i<(enterYear-nowYear); i++){
			yearSave += Math.pow((1+rate), i);
		}
		
		yearSave = requireMoney / yearSave;
		monthSave = yearSave / 12;
		
		// 준비된 자금과 현재 저축가능 금액으로 모을 수 있는 자금
		accMoney = 0;
		for(int i=1; i<=(enterYear-nowYear); i++){
			accMoney += (saveMoney * 12) * Math.pow((1+rate), 1);
			
		}
		totalMoney = accMoney + savedMoney;
		
		// 부족 자금
		lackMoney = requireMoney - totalMoney;
		
		// 부족 자금을 채우기 위해서 매달 추가 저축해야하는 금액
		addMoney = lackMoney /  ((enterYear - nowYear)*12);
		
		// 대출을 40% 받았을 경우 
		addMoney2 = Math.round(((lackMoney * 0.4) / ((enterYear-nowYear)*12)) / 10);
		
		// 대출을 60% 받았을 경우
		addMoney3 = Math.round(((lackMoney * 0.6) / ((enterYear-nowYear)*12)) / 10);
		
		vo.setYearSave(yearSave);
		vo.setMonthSave(monthSave);
		vo.setTotalMoney(totalMoney);
		vo.setLackMoney(lackMoney);
		vo.setAddMoney(addMoney);
		vo.setAddMoney2(addMoney2);
		vo.setAddMoney3(addMoney3);

		return vo;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// getTagValue 메소드 정의
		private static String getTagValue(String tag, Element eElement) {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			if (nValue == null)
				return null;
			return nValue.getNodeValue();
		}
		
		@Override
		public List<XmlVO2> recommender(){
			
			// 1. Rserve이용 - 학습데이터 읽어서 상품추천
			String[] recomm_list = {};
			try{
				RConnection rc = new RConnection();	// R 연결객체 생성
				
				// 라이브러리 로딩
				rc.eval("library(recommenderlab)");
				rc.eval("library(rJava)");
				rc.eval("library(reshape2)");

				
				// csv에 마지막 행에 현재 사용자 data 추가( 지속적인 학습데이터 생성으로 머신러닝 )
				rc.eval("setwd('C:/NCS/Spring/workspace(spring)/Project_finance/src/main/webapp/resources/data')");
				rc.eval("user <- c('" + name + "'," + requireMoney + ","
						+ saveMoney + "," + savedMoney +")");
				rc.eval("newRow <- matrix(user, nrow=T)");
				rc.eval("write.table(newRow , file = 'house_product.csv', append = T, row.names = F, col.names = F, sep = ',')");

				// csv 파일 읽어오기
				rc.eval("house <- read.csv('house_product.csv',fileEncoding = 'CP949', encoding = 'utf-8')");
				rc.eval("house_long <- melt(id=1, house)");
				rc.eval("names(house_long) <- c('user','condition','rating')");

				// 0점 제외
				rc.eval("house_long <- subset(house_long, rating != 0)");
				rc.eval("house_real <- as(house_long, 'realRatingMatrix')");

				// 추천 모델 생성
				// (1) 학습 데이터 생성( 첫번째부터 마지막 전까지)
				rc.eval("trainSet <- house_real[c(1:(nrow(house_real)-1)),]");

				// (2) 추천 대상자 선정 : 입력된 마지막 행 사용자를 추천대상자로 선정
				rc.eval("recommTarget <- house_real[nrow(house_real),]");
				
				// (3) 추천 모델 생성
				rc.eval("recomm_model <- Recommender(trainSet, method='UBCF', parameter = 'Pearson')");

				// (4) 상품 추천
				rc.eval("recomm_list <- predict(recomm_model, recommTarget, n=15)");

				rc.eval("recomm_result <- as(recomm_list,'list')");
				// rc.eval("recomm_result <- recomm_result$user");

				REXP recomm_result = rc.eval("unlist(recomm_result)"); // list를 character로 형변환

				recomm_list = recomm_result.asStrings();
				//System.out.println("추천된 상품1 : "+recomm_list[0]);
				//System.out.println("추천된 상품2 : "+recomm_list[1]);

				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			// 2. XML파싱
			List<XmlVO2> xmlList = new ArrayList<XmlVO2>();
			String rpay_type_nm1 = rpay_type_nm;
			String lend_rate_type_nm1 = lend_rate_type_nm;
			
			int page = 1; // 페이지 초기값
			
			try {
				while (true) {
					// parsing할 url 지정(API 키 포함해서)
					String url = "http://finlife.fss.or.kr/finlifeapi/rentHouseLoanProductsSearch.xml?auth=1db6e257b5ad61c5241a1bc1c9bc863b&topFinGrpNo=020000&pageNo="
							+ page;

					DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
					DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
					Document doc = dBuilder.parse(url);

					// root tag 접근
					doc.getDocumentElement().normalize();
					// System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

					// 파싱할 tag 접근
					NodeList nList = doc.getElementsByTagName("product");
					// System.out.println("파싱할 리스트 수 : "+ nList.getLength());
					
					// tag 수만큼 반복
					for (int temp = 0; temp < nList.getLength(); temp++) {
						XmlVO2 xmlvo2 = new XmlVO2();

						Node nNode = nList.item(temp);
						if (nNode.getNodeType() == Node.ELEMENT_NODE) {

							Element eElement = (Element) nNode;

							// 상품 추천 조건 지정
							for (int i = 0; i < recomm_list.length; i++) {
								// 추천된 상품명, 선택된 상환방식, 금리방식과 같은 상품 

								if (getTagValue("fin_prdt_nm", eElement).equals(recomm_list[i])){		
									if(getTagValue("rpay_type_nm", eElement).equals(rpay_type_nm) && getTagValue("lend_rate_type_nm", eElement).equals(lend_rate_type_nm)){
										// vo 객체에 값 set
										xmlvo2.setFin_prdt_cd(getTagValue("fin_prdt_cd", eElement));
										xmlvo2.setKor_co_nm(getTagValue("kor_co_nm", eElement));
										xmlvo2.setFin_prdt_nm(getTagValue("fin_prdt_nm", eElement));
										xmlvo2.setLoan_inci_expn(getTagValue("loan_inci_expn", eElement));
										xmlvo2.setErly_rpay_fee(getTagValue("erly_rpay_fee", eElement));
										xmlvo2.setDly_rate(getTagValue("dly_rate", eElement));
										xmlvo2.setLoan_lmt(getTagValue("loan_lmt", eElement));
										xmlvo2.setRpay_type_nm(getTagValue("rpay_type_nm", eElement));
										xmlvo2.setLend_rate_type_nm(getTagValue("lend_rate_type_nm", eElement));
										xmlvo2.setLend_rate_min(getTagValue("lend_rate_min", eElement));
										xmlvo2.setLend_rate_max(getTagValue("lend_rate_max", eElement));
										xmlvo2.setLend_rate_avg(getTagValue("lend_rate_avg", eElement));
									}

								} else {
									continue;
								}
							}
							// xmlList에 추가
							xmlList.add(xmlvo2);

						} // for end
					} // if end
					page += 1;
					//System.out.println("page number : " + page);
					if (page > 12) {
						break;
					}
				} // while end

			} catch (Exception e) {
				e.printStackTrace();
			} // try~catch end
			
			return xmlList;
			
		}
		

		@Override
		public HouseVO selectHouseOne(String id) {
			// TODO Auto-generated method stub
			
			return this.sqlSessionTemplate.selectOne("selectHouseOne", id);
		}

		@Override
		public void insertHouse(HouseVO vo) {
			// TODO Auto-generated method stub
			this.sqlSessionTemplate.insert("insertHouse", vo);
			
		}
		
}
