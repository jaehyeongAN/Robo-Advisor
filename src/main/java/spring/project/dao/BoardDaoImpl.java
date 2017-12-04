package spring.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.vo.BoardVO;
import spring.project.vo.MemberVO;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public List<BoardVO> boardList() {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectList("boardList");
	}
	
	@Override
	public BoardVO selectBoard(int board_no) {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectOne("selectBoard", board_no);

	}
	
	
	@Override
	public List<BoardVO> findBoard() {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectList("findBoard");
	}
	
	@Override
	public void insert(BoardVO vo) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.insert("insertBoard", vo);
	}
	
	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		
		this.SqlSessionTemplate.update("updateBoard", vo);
		

	}
	
	@Override
	public void delete(int board_no) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.delete("deleteBoard", board_no);

	}
	
	
}
