package spring.project.service;

import spring.project.vo.RecommVO;

public interface RecommService {
	void recomm_insert(RecommVO re_vo);
	
	double [] recomm_select_w(String code);
	
	public void WriteCSV2();
	
}
