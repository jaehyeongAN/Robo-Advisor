package spring.project.dao;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import au.com.bytecode.opencsv.CSVWriter;
import spring.project.vo.RecommVO;

@Repository
public class RecommDaoImpl implements RecommDao {
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public void recomm_insert(RecommVO re_vo) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.insert("insertRecomm", re_vo);
	}
	
	@Override
	public double [] recomm_select_w(String code){
		// TODO Auto-generated method stub
		System.out.println("recomm_select_w 시작");
		System.out.println("code : "+code);
		System.out.println("codetype : ");
		
		double [] w = new double[5];
		RecommVO recommvo = this.SqlSessionTemplate.selectOne("selectOneRecomm", code);
		w[0] = recommvo.getFo_h();
		w[1] = recommvo.getFo_m();
		w[2] = recommvo.getFo_edu();
		w[3] = recommvo.getFo_r();
		w[4] = recommvo.getFo_etc();
		return w;
	}
	
	@Override
	public void WriteCSV2() {
		List<RecommVO> rlist = this.SqlSessionTemplate.selectList("selectRecomm");
		
		// ========가상의 DB조회리스트========
		Map<String, Object> hmap = null;
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		
		
		//
		RecommVO vo = new RecommVO();
		vo.setCode("123212");
		vo.setInvest_tot(112);
		vo.setNowAge(113);
		vo.setReq_h(114);
		vo.setReq_m(115);
		vo.setReq_edu(116);
		vo.setReq_etc(117);
		vo.setReq_r(118);
		vo.setReq_etc(119);
		vo.setFo_h(120);
		vo.setFo_m(121);
		vo.setFo_edu(122);
		vo.setFo_r(123);
		vo.setFo_etc(124);
		vo.setFo_etc(125);
		//
		hmap = new HashMap<String, Object>();
		hmap.put("A", "CODE");
		hmap.put("B", "INVEST_TOT");
		hmap.put("C", "NOWAGE");
		hmap.put("D", "REQ_H");
		hmap.put("E", "REQ_M");
		hmap.put("F", "REQ_EDU");
		hmap.put("G", "REQ_R");
		hmap.put("H", "REQ_ETC");
		hmap.put("I", "FO_H");
		hmap.put("J", "FO_M");
		hmap.put("K", "FO_EDU");
		hmap.put("L", "FO_R");
		hmap.put("M", "FO_ETC");
		list.add(hmap);
		for (int i = 0; i < rlist.size(); i++) {
			hmap = new HashMap<String, Object>();
			hmap.put("A", rlist.get(i).getCode());
			hmap.put("B", rlist.get(i).getInvest_tot());
			hmap.put("C", rlist.get(i).getNowAge());
			hmap.put("D", rlist.get(i).getReq_h());
			hmap.put("E", rlist.get(i).getReq_m());
			hmap.put("F", rlist.get(i).getReq_edu());
			hmap.put("G", rlist.get(i).getReq_r());
			hmap.put("H", rlist.get(i).getReq_etc());
			hmap.put("I", rlist.get(i).getFo_h());
			hmap.put("J", rlist.get(i).getFo_m());
			hmap.put("K", rlist.get(i).getFo_edu());
			hmap.put("L", rlist.get(i).getFo_r());
			hmap.put("M", rlist.get(i).getFo_etc());
			list.add(hmap);
		}
		/*
		 * hmap = new HashMap<String, Object>(); hmap.put("A", vo.getCode());
		 * hmap.put("B", vo.getInvest_tot()); hmap.put("C", vo.getNowAge());
		 * hmap.put("D", vo.getReq_h()); hmap.put("E", vo.getReq_m());
		 * hmap.put("F", vo.getReq_edu()); hmap.put("G", vo.getReq_r());
		 * hmap.put("H", vo.getReq_etc()); hmap.put("I", vo.getFo_h());
		 * hmap.put("J", vo.getFo_m()); hmap.put("K", vo.getFo_edu());
		 * hmap.put("L", vo.getFo_r()); hmap.put("M", vo.getFo_etc());
		 * list.add(hmap);
		 */

		// ========가상의 DB조회리스트========

		try {
			/**
			 * csv 파일을 쓰기위한 설정 설명 D:\\test.csv : csv 파일저장할 위치+파일명 EUC-KR :
			 * 한글깨짐설정을 방지하기위한 인코딩설정(UTF-8로 지정해줄경우 한글깨짐) ',' : 배열을 나눌 문자열 '"' :
			 * 값을 감싸주기위한 문자
			 **/
			CSVWriter cw = new CSVWriter(new OutputStreamWriter(new FileOutputStream("/home/anjh/DEV/Spring/workspace(sts)/Project_finance/src/main/webapp/resources/data/recomm_w.csv"), "EUC-KR"), ',',
					'"');
			try {
				for (Map<String, Object> m : list) {
					// 배열을 이용하여 row를 CSVWriter 객체에 write
					cw.writeNext(new String[] { String.valueOf(m.get("A")), String.valueOf(m.get("B")),
							String.valueOf(m.get("C")), String.valueOf(m.get("D")), String.valueOf(m.get("E")),
							String.valueOf(m.get("F")), String.valueOf(m.get("G")), String.valueOf(m.get("H")),
							String.valueOf(m.get("I")), String.valueOf(m.get("J")), String.valueOf(m.get("K")),
							String.valueOf(m.get("L")), String.valueOf(m.get("M")) });
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 무조건 CSVWriter 객체 close
				cw.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
}
