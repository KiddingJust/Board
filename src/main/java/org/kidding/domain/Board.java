package org.kidding.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Board {
	
	private Integer bno;
	private String title, content, writer;
	private Date regdate, updatedate;
}
