package spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.FinnanceDao;
import spring.project.vo.MemberVO;
import spring.project.vo.MoneyVO;
import spring.project.vo.MoneyVO2;

@Service
public class FinnanceServiceImpl implements FinnanceService {

	
	@Autowired
	private FinnanceDao finnanceDao;

	@Override
	public void insert(MoneyVO vo) {
		// TODO Auto-generated method stub

		System.out.println("Service 영역");
		this.finnanceDao.insertmoney(vo);
	}

	@Override
	public MoneyVO selectOne(String id) {
		// TODO Auto-generated method stub
		return this.finnanceDao.selectOne(id);
	}

	@Override
	public void update(MoneyVO vo) {
		// TODO Auto-generated method stub
		this.finnanceDao.update(vo);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		this.finnanceDao.delete(id);
	}

	@Override
	public void updatepay(MemberVO vo) {
		// TODO Auto-generated method stub
		this.finnanceDao.updatepay(vo);

	}

	@Override
	public MoneyVO selectResult(String id) {
		// TODO Auto-generated method stub
		return this.finnanceDao.selectResult(id);
	}

	@Override
	public MoneyVO2 selectMoney2(String id) {
		// TODO Auto-generated method stub
		return this.finnanceDao.selectMoney2(id);
	}

	@Override
	public void insertMoney2(MoneyVO2 vo) {
		// TODO Auto-generated method stub
		this.finnanceDao.insertMoney2(vo);
	}

}