package com.foodstore.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.model.entity.Food;
import com.foodstore.service.FoodService;

@Controller
public class HomeController {
	
	@Autowired
	private FoodService foodService;
	
	@GetMapping("/contact-us")
	public String doShowContact() {
		return "user/contact";
	}
	
	@GetMapping("/introduce")
	public String doShowIntroduce() {
		return "user/introduce";
	}

	@GetMapping(value = { "/", "", "/home", "/home/index" })
	public String doRedirect() {
		return "redirect:/index";
	}

	@GetMapping("/index")
	public String doGetIndex(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
			@RequestParam(value = "size", required = false, defaultValue = "8") int pageSize) {
		List<Food> newFoods = new ArrayList<>();
		try {
			Page<Food> pageNewFoods = foodService.getNewProduct(PageRequest.of(pageNumber - 1, pageSize));
			newFoods = pageNewFoods.getContent();
			model.addAttribute("totalPages", pageNewFoods.getTotalPages());
			model.addAttribute("currentPage", pageNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("newFoods", newFoods);
		return "user/index";
	}
	
	@GetMapping({"admin","admin/home/index"})
	public String admin(Model model) {
		return "redirect:/admin/html/index.html";
	}
}
