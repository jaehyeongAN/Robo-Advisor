package spring.project.service;

import java.util.List;

import spring.project.vo.MemberVO;

public interface MemberService {

	List<MemberVO> selectMemberAll();
	
	MemberVO selectOne(String id);
	
	public MemberVO loginCheck(MemberVO vo);
	
	public MemberVO idCheck(MemberVO vo);
	
	public void insert(MemberVO vo);
	
	public void update(MemberVO vo);
	
	public void delete(String id);
}
