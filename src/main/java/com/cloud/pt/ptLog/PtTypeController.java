package com.cloud.pt.ptLog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;



@Controller
@RequestMapping("/trainer/*")
@Slf4j
public class PtTypeController {
	
	@Autowired
	private PtTypeService ptTypeService;
	private Object all;
	
	
	@GetMapping("ptLog")
	public ModelAndView getTypeList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		
		PtTypeVO ptTypeVO = new PtTypeVO();
		ptTypeVO.setEmployeeNum(b.getName());
		List<PtTypeVO> ar = ptTypeService.getTypeList(ptTypeVO);
		
		mv.addObject("list",ar);
		mv.addObject("employeeNum", b.getName());
		mv.setViewName("trainer/ptLog");
		
		return mv;
	}
	
	@PostMapping("addType")
	public String addType(PtTypeVO ptTypeVO) throws Exception{
		
		
		int result = ptTypeService.addType(ptTypeVO);
		
		return "redirect:./ptLog";
	}
	
	@PostMapping("delType")
	public String delType(PtTypeVO ptTypeVO) throws Exception{
		
		int result = ptTypeService.delType(ptTypeVO);
		return "redirect:./ptLog";
	}
	
	//운동 진행률을 위한 조회
		@ResponseBody
		@RequestMapping("progress.cl")
		public int ajaxSelectExAll(PtTypeVO ptTypeVO) throws Exception{
			
			
			int all = ptTypeService.selectExAll(ptTypeVO); //전체 갯수
			int complete = ptTypeService.selectComplete(ptTypeVO); //완료된 갯수
			
			double c = complete;
			int result = (int)Math.round((c / all) * 100); //int값으로 반환하기위함
			
			return result;
		}
}
