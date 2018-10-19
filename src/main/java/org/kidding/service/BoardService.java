package org.kidding.service;

import java.util.List;

import org.kidding.domain.Board;
import org.kidding.domain.PageParam;

public interface BoardService {

	public List<Board> getList(PageParam param);
	
	public int register(Board board);

	public int getTotal();
	
	public Board get(PageParam param);
}
