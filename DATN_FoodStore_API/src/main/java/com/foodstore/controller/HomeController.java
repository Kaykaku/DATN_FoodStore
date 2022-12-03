package com.foodstore.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.foodstore.model.entity.Food;
import com.foodstore.model.extend.Discount;
import com.foodstore.service.DiscountService;
import com.foodstore.service.FoodService;
import com.foodstore.service.ReviewService;

@Controller
public class HomeController {
	@Autowired 
	private FoodService foodService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private DiscountService discountService;
	
	@GetMapping({"","/home/index","index","home"})
	public String home(Model model) {
		Pageable pageable = PageRequest.of(0, 8);
		Page<Food> list1 = foodService.getTopNewProducts(pageable);
		Page<Food> list2 = foodService.getTopSalerProducts(pageable);
		Page<Food> list3 = foodService.getTopDiscountProducts(pageable);
		Page<Food> list4 = foodService.getTopViewProducts(pageable);

		Map<Long,Double> reviewScore = new HashMap<>();
		for (Food food : foodService.getAll()) {
			reviewScore.put(food.getId(), reviewService.getAverageRating(food.getId()));
		}
		
		Map<Long,Discount> discounts = new HashMap<>();
		List<Discount> listDiscounts = discountService.getAll();
		for (Discount discount : listDiscounts) {
			if(discount.getStart_date().getTime() <= new Date().getTime()
					&& discount.getEnd_date().getTime() >= new Date().getTime()) {
				discounts.put(discount.getFood_d().getId(), discount);
			}
		}
		
		model.addAttribute("title", "Home");
		model.addAttribute("reviewScore", reviewScore);
		model.addAttribute("discounts", discounts);
		model.addAttribute("items1", list1);
		model.addAttribute("items2", list2);
		model.addAttribute("items3", list3);
		model.addAttribute("items4", list4);
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
