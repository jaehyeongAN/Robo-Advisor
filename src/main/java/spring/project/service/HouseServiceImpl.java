package spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.HouseDao;
import spring.project.vo.HouseVO;
import spring.project.vo.XmlVO2;
@Service
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	HouseDao houseDao;

	@Override
	public HouseVO house_calc(HouseVO vo) {
		// TODO Auto-generated method stub
		return houseDao.house_calc(vo);
	}
	
	@Override
	public List<XmlVO2> recommender(){
		
		return houseDao.recommender();
	}

	@Override
	public void insert(HouseVO vo) {
		// TODO Auto-generated method stub

		this.houseDao.insertHouse(vo);
	}

	@Override
	public HouseVO selectOne(String id) {
		// TODO Auto-generated method stub

		return this.houseDao.selectHouseOne(id);
	}	

}
