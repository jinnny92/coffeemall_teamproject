package kr.co.dw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/about")
public class AboutController {
	
	@RequestMapping(value = "/about" , method = RequestMethod.GET)
	public String about() { 
		
		return "/about/about";
	}

}
