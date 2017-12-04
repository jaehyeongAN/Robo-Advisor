package spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.TimeSeriesDao;

@Service
public class TimeSeriesServiceImpl implements TimeSeriesService {
	
	@Autowired
	TimeSeriesDao TimeSeriesdao;
	
	@Override
	public List<Integer> TimeSeriesValue(String type, String add, String jugeao, int peongsu, int inputyear) {
		// TODO Auto-generated method stub
		return this.TimeSeriesdao.TimeSeriesValue(type, add, jugeao, peongsu, inputyear);
	}

}
