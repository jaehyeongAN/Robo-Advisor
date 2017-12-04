package spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.RetireDao;
import spring.project.vo.RetireVO;
import spring.project.vo.XmlVO;
@Service
public class RetireServiceImpl implements RetireService {
	
	@Autowired
	RetireDao retireDao;

	@Override
	public RetireVO retire_calc(RetireVO vo) {
		// TODO Auto-generated method stub
		return retireDao.retire_calc(vo);
	}
	
	@Override
	public List<XmlVO> recommender(){
		
		return retireDao.recommender();
	}
	
	@Override
	public RetireVO selectRetire(String id) {
		// TODO Auto-generated method stub
		return this.retireDao.selectRetire(id);
	}

	@Override
	public void retireInsert(RetireVO vo) {
		// TODO Auto-generated method stub
		this.retireDao.retireInsert(vo);
	}
	
}
