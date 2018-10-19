package org.kidding.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.kidding.domain.Board;
import org.kidding.domain.PageParam;

public interface BoardMapper {
	
	public int update(Board board);
	
	public List<Board> getList(PageParam param);
	
	public int insert(Board board);

	public int count();
	
	public Board get(PageParam param);
	
	public int delete(PageParam param);
}
