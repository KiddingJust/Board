package org.kidding.service;

import java.util.List;
import java.util.Map;

import org.kidding.domain.Board;
import org.kidding.domain.PageParam;

public interface BoardService {

	public List<Board> getList(PageParam param);
	
	public int register(Board board);

	public int getTotal();
	
	public Board get(PageParam param);
	
	public int remove(PageParam param);
	
	public int modify(Board board);
	
//	public Map<String, String> search(PageParam param);
	
}
