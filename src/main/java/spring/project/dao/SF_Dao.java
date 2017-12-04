package spring.project.dao;

import java.util.List;

import spring.project.vo.SFVO;


public interface SF_Dao {
	List<SFVO> sf_selectAll();
	
	List<SFVO> sf_select_result(String code);
	
	SFVO sf_selectOne(String id);
	
	SFVO sf_selectResult(String id);

	List<SFVO> sfvoResultList(String id);
	
	void sf_insert(SFVO vo);
	
	void sf_update(SFVO vo);
	
	void sf_delete(String id);
	
	public double FV_a(int n, double Rate);
	
	public double PV_a(int n, double Rate);
	
	public double FV(int n, double Rate);
	
	public double PV(int n, double Rate);
	
	int FV_my_year(int p, int goalMoney, double Rate);
	
	double[] finn(int nowAge);
}
