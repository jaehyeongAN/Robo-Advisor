package spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.RecommDao;
import spring.project.vo.RecommVO;


@Service
public class RecommServiceImpl implements RecommService {
	
	@Autowired
	private RecommDao recommdao;
	
	@Override
	public void recomm_insert(RecommVO re_vo) {
		// TODO Auto-generated method stub
		this.recommdao.recomm_insert(re_vo);
	}

	@Override
	public double[] recomm_select_w(String code) {
		// TODO Auto-generated method stub
		return this.recommdao.recomm_select_w(code);
	}

	@Override
	public void WriteCSV2() {
		// TODO Auto-generated method stub
		this.recommdao.WriteCSV2();
	}

	
}
