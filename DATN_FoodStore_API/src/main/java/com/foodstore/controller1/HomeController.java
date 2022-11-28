package com.foodstore.controller1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.foodstore.model.entity.Food;
import com.foodstore.service.FoodService;

@Controller
public class HomeController {
	@Autowired private FoodService foodService;
	
	@GetMapping({"","/home/index","index","home"})
	public String home(Model model) {
		Pageable pageable = PageRequest.of(0, 8);
		Page<Food> list = foodService.getAll(pageable);
		model.addAttribute("title", "Home");
		model.addAttribute("items", list);
		return "home/index";
	}
	
	@GetMapping({"home/about"})
	public String about(Model model) {
		model.addAttribute("title", "About");
		return "home/about";
	}
	
	@GetMapping({"home/contact"})
	public String contact(Model model) {
		model.addAttribute("title", "Contact");
		return "home/contact";
	}
	
	@GetMapping({"admin","admin/home/index"})
	public String admin(Model model) {
		model.addAttribute("title", "About");
		return "redirect:/admin/html/index.html";
	}
}
