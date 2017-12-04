package spring.project.service;

import java.util.List;

import spring.project.vo.HouseVO;
import spring.project.vo.XmlVO2;

public interface HouseService {
	
	public HouseVO house_calc(HouseVO vo);
	
	// 상품추천 
	public List<XmlVO2> recommender();
	

	public void insert(HouseVO vo);

	public HouseVO selectOne(String id);

	

}
