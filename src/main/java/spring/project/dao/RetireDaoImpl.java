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


import spring.project.vo.RetireVO;
import spring.project.vo.XmlVO;

@Repository
public class RetireDaoImpl implements RetireDao {
	String name;
	int retireYear, nowAge, deathAge, requireMoney, savedMoney, pension, saveMoney;
	double rate;
	int nowYear,retireAge, accMoney, requireTotal, totalMoney, lackMoney, addMoney, annuity;
	double addMoney2, addMoney3;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	

	@Override
	public RetireVO retire_calc(RetireVO vo) {
		// TODO Auto-generated method stub
		name = vo.getName();
		retireYear = vo.getRetireYear();
		nowAge = vo.getNowAge();
		deathAge = vo.getDeathAge();
		requireMoney = vo.getRequireMoney();
		savedMoney = vo.getSavedMoney();
		pension = vo.getPension();
		saveMoney = vo.getSaveMoney();
		rate = vo.getRate();

		Calendar calendar = Calendar.getInstance();
		nowYear = calendar.get(Calendar.YEAR); // 현재 날짜

		// 은퇴시 필요 생활비를 위해 모아야하는 총 자금
		retireAge = 0;
		retireAge = (retireYear - nowYear) + nowAge; // 은퇴시 나이
		requireTotal = (requireMoney * 12) * (deathAge - retireAge); // 은퇴 후
																		// 필요자금

		// 연금
		annuity = 0;
		for (int i = 1; i <= (deathAge - retireAge); i++) {
			annuity += 80 * 12;
		}

		// 준비된 자금과 현재 저축가능 금액으로 모을 수 있는 자금
		accMoney = 0;
		for (int i = 1; i <= (retireYear - nowYear); i++) {
			accMoney += (saveMoney * 12) * Math.pow((1 + rate), 1);
		}

		totalMoney = accMoney + savedMoney + pension + annuity; // pension:퇴직금,
																// annuity: 연금

		// 부족 자금
		lackMoney = requireTotal - totalMoney;

		// 부족 자금을 채우기 위해서 매달 추가 저축해야하는 금액
		addMoney = lackMoney / ((retireYear - nowYear) * 12);

		// 외부요소(대출/적금/주식/보험 등)로 40% 충당할 경우
		addMoney2 = Math.round(((lackMoney * 0.4) / ((retireYear - nowYear) * 12)) / 10);

		// 외부요소(대출/적금/주식/보험 등)로 60% 충당할 경우
		addMoney3 = Math.round(((lackMoney * 0.6) / ((retireYear - nowYear) * 12)) / 10);

		/*
		 * System.out.println("필요 총자금 : "+requireTotal);
		 * System.out.println("모을수 있는 총자금 : "+totalMoney);
		 * System.out.println("부족 자금 : "+lackMoney);
		 */

		vo.setRetireAge(retireAge);
		vo.setRequireTotal(requireTotal);
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
	public List<XmlVO> recommender() {

		// 1. Rserve이용 - 학습데이터 읽어서 상품추천
		String[] recomm_list = {};
		try{
			RConnection rc = new RConnection();	// R 연결객체 생성
			
			// 라이브러리 로딩
			rc.eval("library(recommenderlab)");
			rc.eval("library(rJava)");
			rc.eval("library(reshape2)");

			
			// csv에 마지막 행에 현재 사용자 data 추가( 지속적인 학습데이터 생성으로 머신러닝 )
			
			rc.eval("setwd('/home/anjh/DEV/Spring/workspace(sts)/Project_finance/src/main/webapp/resources/data')");
			
			rc.eval("user <- c('" + name + "'," + nowAge + "," + requireMoney + ","
					+ saveMoney + "," + savedMoney +","+ pension + ")");
			rc.eval("newRow <- matrix(user, nrow=T)");
			rc.eval("write.table(newRow , file = 'retire_product2', append = T, row.names = F, col.names = F, sep = ',')");

			// csv 파일 읽어오기
			rc.eval("retire <- read.csv('retire_product2.csv',fileEncoding = 'CP949', encoding = 'utf-8')");
			rc.eval("retire_long <- melt(id=1, retire)");
			rc.eval("names(retire_long) <- c('user','condition','rating')");

			// 0점 제외
			rc.eval("retire_long <- subset(retire_long, rating != 0)");
			rc.eval("retire_real <- as(retire_long, 'realRatingMatrix')");

			// 추천 모델 생성
			// (1) 학습 데이터 생성( 첫번째부터 마지막 전까지)
			rc.eval("trainSet <- retire_real[c(1:(nrow(retire_real)-1)),]");

			// (2) 추천 대상자 선정 : 입력된 마지막 행 사용자를 추천대상자로 선정
			rc.eval("recommTarget <- retire_real[nrow(retire_real),]");
			
			// (3) 추천 모델 생성
			rc.eval("recomm_model <- Recommender(trainSet, method='UBCF', parameter = 'Pearson')");

			// (4) 상품 추천
			rc.eval("recomm_list <- predict(recomm_model, recommTarget, n=5)");

			rc.eval("recomm_result <- as(recomm_list,'list')");
			// rc.eval("recomm_result <- recomm_result$user");

			REXP recomm_result = rc.eval("unlist(recomm_result)"); // list를 character로 형변환

			recomm_list = recomm_result.asStrings();
			System.out.println("추천된 상품1 : "+recomm_list[0]);
			System.out.println("추천된 상품2 : "+recomm_list[1]);
			System.out.println("추천된 상품3 : "+recomm_list[2]);
			System.out.println("추천된 상품4 : "+recomm_list[3]);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}


		// 2. XML파싱
		List<XmlVO> xmlList = new ArrayList<XmlVO>();		
		int page = 1; // 페이지 초기값
		
		try {
			while (true) {

				// parsing할 url 지정(API 키 포함해서)
				String url = "http://finlife.fss.or.kr/finlifeapi/annuitySavingProductsSearch.xml?auth=1db6e257b5ad61c5241a1bc1c9bc863b&topFinGrpNo=050000&pageNo="
						+ page;

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				// root tag 접근
				doc.getDocumentElement().normalize();
				// System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

				// 파싱할 tag 접근
				NodeList nList = doc.getElementsByTagName("baseinfo");
				// System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
				// tag 수만큼 반복
				for (int temp = 0; temp < nList.getLength(); temp++) {
					XmlVO xmlvo = new XmlVO();

					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;

						// 상품 추천 조건 지정
						for (int i = 0; i < recomm_list.length; i++) {
							// 추천된 상품명과 같고 유지건수가 1000이상인 상품
							if (getTagValue("kor_co_nm", eElement).equals(recomm_list[i]) && Integer.parseInt(getTagValue("mntn_cnt", eElement)) >= 100) {		
								
								// vo 객체에 값 set
								xmlvo.setFin_prdt_cd(getTagValue("fin_prdt_cd", eElement));
								xmlvo.setKor_co_nm(getTagValue("kor_co_nm", eElement));
								xmlvo.setFin_prdt_nm(getTagValue("fin_prdt_nm", eElement));
								xmlvo.setSale_strt_day(getTagValue("sale_strt_day", eElement));
								xmlvo.setMntn_cnt(getTagValue("mntn_cnt", eElement));
								xmlvo.setPrdt_type_nm(getTagValue("prdt_type_nm", eElement));
								xmlvo.setAvg_prft_rate(getTagValue("avg_prft_rate", eElement));
								xmlvo.setDcls_rate(getTagValue("dcls_rate", eElement));

							} else {
								continue;
							}
						}
						// xmlList에 추가
						xmlList.add(xmlvo);

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

	public RetireVO selectRetire(String id) {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectOne("selectRetire", id);

	}

	@Override
	public void retireInsert(RetireVO vo) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.insert("insertRetire", vo);
	}
}
