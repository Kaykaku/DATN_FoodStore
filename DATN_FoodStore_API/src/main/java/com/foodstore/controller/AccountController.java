package com.foodstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {
	
	@GetMapping("/login")
	public String doShowLogin() {
		return "user/login";
	} 
	
	@GetMapping("/signup")
	public String doShowSignUp() {
		return "user/signup";
	}

}
