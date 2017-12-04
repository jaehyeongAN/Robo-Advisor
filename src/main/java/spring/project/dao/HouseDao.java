package spring.project.dao;

import java.util.List;

import spring.project.vo.HouseVO;
import spring.project.vo.XmlVO2;

public interface HouseDao {
	// 주거설계 계산
	public HouseVO house_calc(HouseVO vo);
	// 상품추천
	public List<XmlVO2> recommender();

	public void insertHouse(HouseVO vo);
	
	
	// 최신 주거 설계 불름
	public HouseVO selectHouseOne(String id);

}
