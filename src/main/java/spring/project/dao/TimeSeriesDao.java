package spring.project.dao;

import java.util.List;

public interface TimeSeriesDao {
	
	public List<Integer> TimeSeriesValue(String type, String add, String jugeao, int peongsu, int inputyear);
	
}
