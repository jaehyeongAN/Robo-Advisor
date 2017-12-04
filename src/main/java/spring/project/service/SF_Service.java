package spring.project.service;


import java.util.List;

import spring.project.vo.SFVO;


public interface SF_Service {
	
	List<SFVO> sf_select_result(String code);
	void sf_insert(SFVO vo); //삽입
	SFVO sf_selectOne(String d_id);
	void sf_update(SFVO vo);
	void sf_delete(String d_id);
	
	public double FV_a(int n, double Rate);
	
	public double PV_a(int n, double Rate);
	
	public double FV(int n, double Rate);
	
	public double PV(int n, double Rate);
	
	int FV_my_year(int p, int goalMoney, double Rate);
	
	double[] finn(int nowAge);

	SFVO selectSfvo(String id);

	List<SFVO> sfvoResultList(String id);
	
}
