package com.zhiyou100.crowdfunding;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pages/*")
public class TestController {
	@RequestMapping("calendar")
	public ModelAndView calendar() {
		ModelAndView mav = new ModelAndView("/pages/calendar.jsp");
		mav.addObject("title", LocalDate.now());
		System.out.println(LocalDate.now());
		return mav;
	}	
}
