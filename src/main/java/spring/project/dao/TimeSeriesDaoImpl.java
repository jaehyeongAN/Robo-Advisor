package spring.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Repository;

@Repository
public class TimeSeriesDaoImpl implements TimeSeriesDao {

	@Override
	public List<Integer> TimeSeriesValue(String type, String add, String jugeao, int peongsu, int inputyear){
		
		List<Integer> value = new ArrayList<Integer>();
		//int value = 0;
		TimeSeries ts = new TimeSeries();
		
		try {
			value = ts.TimeSeriesValue1(type, add, jugeao, peongsu, inputyear);
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return value;
	}
	
}
