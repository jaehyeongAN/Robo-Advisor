package spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.SF_Dao;
import spring.project.vo.SFVO;

@Service
public class SF_ServiceImpl implements SF_Service {
	
	@Autowired
	private SF_Dao sf_dao;
	
	@Override
	public double FV_a(int n, double Rate) {
		// TODO Auto-generated method stub
		return sf_dao.FV_a(n, Rate);
	}

	@Override
	public double PV_a(int n, double Rate) {
		// TODO Auto-generated method stub
		return sf_dao.PV_a(n, Rate);
	}

	
	
	@Override
	public double FV(int n, double Rate) {
		// TODO Auto-generated method stub
		return sf_dao.FV(n, Rate);
	}

	@Override
	public double PV(int n, double Rate) {
		// TODO Auto-generated method stub
		return sf_dao.PV(n, Rate);
	}

	@Override
	public int FV_my_year(int p, int goalMoney, double Rate) {
		// TODO Auto-generated method stub
		return sf_dao.FV_my_year(p, goalMoney, Rate);
	}

	@Override
	public double[] finn(int nowAge) {
		// TODO Auto-generated method stub
		return sf_dao.finn(nowAge);
	}
	
	@Override
	public List<SFVO> sf_select_result(String code) {
		// TODO Auto-generated method stub
		return sf_dao.sf_select_result(code);
	}

	@Override
	public void sf_insert(SFVO vo) {
		// TODO Auto-generated method stub
		this.sf_dao.sf_insert(vo);
	}

	@Override
	public SFVO sf_selectOne(String d_id) {
		// TODO Auto-generated method stub
		return this.sf_dao.sf_selectOne(d_id);
	}

	@Override
	public void sf_update(SFVO vo) {
		// TODO Auto-generated method stub
		this.sf_dao.sf_update(vo);
		
	}

	@Override
	public void sf_delete(String id) {
		// TODO Auto-generated method stub
		this.sf_dao.sf_delete(id);
	}

	@Override
	public SFVO selectSfvo(String id) {
		// TODO Auto-generated method stub
		return this.sf_dao.sf_selectResult(id);
	}

	@Override
	public List<SFVO> sfvoResultList(String id) {
		// TODO Auto-generated method stub
		return this.sf_dao.sfvoResultList(id);
	}

}
