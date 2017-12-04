package spring.project.dao;

import java.util.List;

import spring.project.vo.MemberVO;

public interface MemberDao {
	
	List<MemberVO> selectMemberAll();
	
	MemberVO selectOne(String id);
	
	MemberVO loginCheck(MemberVO vo);
	
	MemberVO idCheck(MemberVO vo);
	
	public void insert(MemberVO vo);
	public void update(MemberVO vo);
	public void delete(String id);
	void test();
}
