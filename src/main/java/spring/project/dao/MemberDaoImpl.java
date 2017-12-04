package spring.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public List<MemberVO> selectMemberAll() {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectList("selectMemberAll");
	}

	@Override
	public MemberVO selectOne(String id) {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectOne("selectOne", id);
	}
	
	@Override
	public MemberVO loginCheck(MemberVO vo){
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectOne("loginCheck", vo);
	}
	
	@Override
	public MemberVO idCheck(MemberVO vo){
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectOne("idCheck", vo);
	}
	
	@Override
	public void insert(MemberVO vo) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.insert("insertMember", vo);
	}

	@Override
	public void update(MemberVO vo) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.update("updateMember", vo);

	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.delete("deleteMember", id);
	}

	@Override
	public void test() {
		// TODO Auto-generated method stub

	}

}
