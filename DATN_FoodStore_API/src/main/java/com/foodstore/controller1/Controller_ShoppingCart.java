package com.foodstore.controller1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("cart")
public class Controller_ShoppingCart {
	
	@GetMapping("view")
	public String view(Model model) {
		model.addAttribute("title", "Cart");
		return "cart/view";
	}
	
	@GetMapping("checkout")
	public String checkout(Model model) {
		model.addAttribute("title", "Check out");
		return "cart/checkout";
	}
}
