package org.kidding.service;

import java.util.List;

import org.kidding.domain.Board;
import org.kidding.domain.PageParam;
import org.kidding.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;
	

	@Override
	public int register(Board board) {
		return mapper.insert(board);
	}


	@Override
	public List<Board> getList(PageParam param) {
		return mapper.getList(param);
	}


	@Override
	public int getTotal() {
		return mapper.count();
	}


	@Override
	public Board get(PageParam param) {
		return mapper.get(param);
	}
	
}
