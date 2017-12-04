package spring.project.dao;



import spring.project.vo.RecommVO;

public interface RecommDao {
	void recomm_insert(RecommVO re_vo);
	
	double [] recomm_select_w(String code);
	
	public void WriteCSV2();
	
}
