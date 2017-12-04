package spring.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.vo.MemberVO;
import spring.project.vo.MoneyVO;
import spring.project.vo.MoneyVO2;

@Repository
public class FinnanceDaoImpl implements FinnanceDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertmoney(MoneyVO vo) {
		System.out.println("DAO 영역");
		// TODO Auto-generated method stub
		this.sqlSessionTemplate.insert("insertMoney", vo);
	}

	@Override
	public MoneyVO selectOne(String id) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("selectMoney", id);
	}

	@Override
	public void update(MoneyVO vo) {
		// TODO Auto-generated method stub
		this.sqlSessionTemplate.update("updateMoney", vo);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		this.sqlSessionTemplate.delete("deleteMoney", id);
	}

	@Override
	public void updatepay(MemberVO vo) {
		// TODO Auto-generated method stub
		this.sqlSessionTemplate.update("updateMemberpay", vo);

	}

	@Override
	public MoneyVO selectResult(String id) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("finnanceResult", id);
	}

	@Override
	public MoneyVO2 selectMoney2(String id) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("selectMoney2",id);
	}

	@Override
	public void insertMoney2(MoneyVO2 vo) {
		// TODO Auto-generated method stub
		this.sqlSessionTemplate.insert("insertMoney2", vo);
	}

}