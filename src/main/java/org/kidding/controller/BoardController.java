package org.kidding.controller;

import org.kidding.domain.Board;
import org.kidding.domain.PageParam;
import org.kidding.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@PostMapping("/modify") //리다이렉트 할 계획이면 리턴 타입은 String.
	public String modify(PageParam pageParam, Board board, RedirectAttributes rttr) {
		
		int result = service.modify(board);
				
		//한 번만 전달되도록! 
		rttr.addFlashAttribute("result", result ==1?"SUCCESS":"FAIL");
		
		return pageParam.getLink("redirect:/board/read");
	}
	
	@PostMapping("/remove")
	public String remove(PageParam pageParam, RedirectAttributes rttr) {
	
		int count = service.remove(pageParam);	
		log.info(count);
		log.info(pageParam);
		rttr.addFlashAttribute("result", count==1?"SUCCESS":"FAIL");
		
		return "redirect:/board/list?page="+pageParam.getPage();
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(@ModelAttribute("pageObj")PageParam pageParam, Model model) {
		log.info("read page.......");
		//DB 연동 안 한 상태
		model.addAttribute("board", service.get(pageParam));	
	}
	
	@GetMapping("/list")
	public void list(@ModelAttribute("pageObj") PageParam pageParam, Model model) {
		log.info("list page.......");
		log.info(pageParam);
		//DB 연동 안 한 상태
		pageParam.setTotal(service.getTotal());
		model.addAttribute("list", service.getList(pageParam));	
	}
	
	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	@PostMapping("/register")
	public String registerPost(Board board, RedirectAttributes rttr) {
		log.info(board);
		
		//int 반환하는 이유가 이거임. service.register(board)를 통해 DB에 값을 넣었을 때, result를 통해 성공/실패 여부도 반환
		int result = service.register(board);
		log.info(result);
		
		rttr.addFlashAttribute("result", result==1?"SUCCESS":"FAIL");
		
		return "redirect:/board/list";
	}
}
