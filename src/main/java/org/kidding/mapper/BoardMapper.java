package org.kidding.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.kidding.domain.Board;
import org.kidding.domain.PageParam;

public interface BoardMapper {
	
	//하지만 연산이 안 된다. MySQL은
	@Select("select * from tbl_board order by bno desc limit ${skip}, 10")
	public List<Board> getList(PageParam param);
	
	@Insert(" insert into tbl_board (title, content, writer) " + 
			"values (#{title}, #{content}, #{writer})")
	public int insert(Board board);

	@Select("select count(*) from tbl_board")
	public int count();
	
	@Select("select * from tbl_board where bno = #{bno}")
	public Board get(PageParam param);
}
