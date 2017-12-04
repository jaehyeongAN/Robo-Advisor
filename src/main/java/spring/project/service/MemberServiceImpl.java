package spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.MemberDao;
import spring.project.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao; 
	
	@Override
	public List<MemberVO> selectMemberAll() {
		// TODO Auto-generated method stub
		return this.memberDao.selectMemberAll();
	}


	
	@Override
	public MemberVO selectOne(String id) {
		// TODO Auto-generated method stub
		return this.memberDao.selectOne(id);
	}
	
	@Override
	public MemberVO loginCheck(MemberVO vo){
		return this.memberDao.loginCheck(vo);
	}
	
	@Override
	public MemberVO idCheck(MemberVO vo){
		return this.memberDao.idCheck(vo);
	}
	
	@Override
	public void insert(MemberVO vo) {
		// TODO Auto-generated method stub
		this.memberDao.insert(vo);
	}

	@Override
	public void update(MemberVO vo) {
		// TODO Auto-generated method stub
		this.memberDao.update(vo);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		this.memberDao.delete(id);
	}

}
