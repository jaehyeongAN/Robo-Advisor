package spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.RworkDaoImpl;

@Service
public class RworkServiceImpl implements RworkService {
	
	@Autowired
	RworkDaoImpl RworkDao;
	
	
	@Override
	public String Recomm_code(int invest_tot, int nowAge, int req_h, int req_m, int req_edu, int req_r, int req_etc) {
		// TODO Auto-generated method stub
		return this.RworkDao.Recomm_code(invest_tot, nowAge, req_h, req_m, req_edu, req_r, req_etc);
	}

}
