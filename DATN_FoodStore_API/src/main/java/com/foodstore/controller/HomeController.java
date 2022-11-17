package com.foodstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(value = { "/", "", "/home", "/home/index" })
	public String doRedirect() {
		return "redirect:/index";
	}

	@GetMapping("/index")
	public String doGetIndex() {
		return "user/index";
	}
	
}
