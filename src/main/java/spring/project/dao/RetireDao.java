package spring.project.dao;

import java.util.List;

import spring.project.vo.RetireVO;
import spring.project.vo.XmlVO;

public interface RetireDao {
	// 은퇴설계 계산
	public RetireVO retire_calc(RetireVO vo);
	// 상품추천 
	public List<XmlVO> recommender();

	RetireVO selectRetire(String id);

	void retireInsert(RetireVO vo);

}
