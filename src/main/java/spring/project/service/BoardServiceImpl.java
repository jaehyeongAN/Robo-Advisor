package spring.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.project.dao.BoardDao;
import spring.project.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	
	@Override
	public List<BoardVO> boardList(){
		
		return this.boardDao.boardList();
	}
	
	
	@Override
	public BoardVO selectBoard(int board_no) {
		// TODO Auto-generated method stub
		return this.boardDao.selectBoard(board_no);
	}
	
	
	@Override
	public List<BoardVO> findBoard(){
		
		return this.boardDao.findBoard();
	}
	
	
	@Override
	public void insert(BoardVO vo) {
		// TODO Auto-generated method stub

		System.out.println("Service 영역");
		this.boardDao.insert(vo);
	}

	
	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		System.out.println("serviceimpl 넘어옴" + vo.getBoard_name());
		this.boardDao.update(vo);
		
	}

	@Override
	public void delete(int board_no) {
		// TODO Auto-generated method stub
		this.boardDao.delete(board_no);
	}

	

}
