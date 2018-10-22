package org.kidding.mapper;

import java.util.List;
import java.util.Map;

import org.kidding.domain.Board;
import org.kidding.domain.PageParam;

public interface BoardMapper {
	
	public int update(Board board);
	
	public List<Board> getList(PageParam param);
	
	public int insert(Board board);

	public int count();
	
	public Board get(PageParam param);
	
	public int delete(PageParam param);
	
//	public Map<String, String> search(PageParam pageParam);
	
	public int searchCount(PageParam pageParam);
}
