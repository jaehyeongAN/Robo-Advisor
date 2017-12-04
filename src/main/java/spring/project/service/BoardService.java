package spring.project.service;

import java.util.List;

import spring.project.vo.BoardVO;

public interface BoardService {
	
	List<BoardVO> boardList();
	
	BoardVO selectBoard(int board_no);
	
	List<BoardVO> findBoard();
	
	void insert(BoardVO vo);
	
	void update(BoardVO vo);
	
	void delete(int board_no);
}
