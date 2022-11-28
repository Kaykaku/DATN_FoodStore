//package com.foodstore.controller;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Optional;
//
//import org.apache.commons.lang3.ObjectUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.foodstore.model.entity.Food;
//import com.foodstore.service.FoodService;
//import com.foodstore.util.services.SessionUtil;
//
//@Controller
//public class ShopController {
//	
//	@Autowired
//	private SessionUtil session;
//
//	@Autowired
//	private FoodService foodService;
//
//	@GetMapping("/shop")
//	public String doShowShop(Model model,
//			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
//			@RequestParam(value = "size", required = false, defaultValue = "9") int pageSize) {
//		List<Food> foods = new ArrayList<>();
//		try {
//			Page<Food> pageFoods = foodService.getByIsDisplayAndQuantity(PageRequest.of(pageNumber - 1, pageSize));
//			foods = pageFoods.getContent();
//			model.addAttribute("totalPages", pageFoods.getTotalPages());
//			model.addAttribute("currentPage", pageNumber);
//		} catch (Exception e) {
//			e.printStackTrace();
//			foods = foodService.getAll();
//		}
//		model.addAttribute("foods", foods);
//		return "user/shop";
//	}
//
//	@GetMapping("/search")
//	public String doSearchProduct(Model model, @RequestParam(value = "keyword", required = false) Optional<String> kw,
//			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
//			@RequestParam(value = "size", required = false, defaultValue = "9") int pageSize) {
//		List<Food> foods = new ArrayList<>();
//		try {
//			String keyword = kw.orElse(session.getAttribute("keyword"));
//			session.setAttribute("keyword", keyword);
//			Page<Food> pageFoods = foodService.getByKeyword(keyword, PageRequest.of(pageNumber - 1, pageSize));
//			foods = pageFoods.getContent();
//			model.addAttribute("totalPages", pageFoods.getTotalPages());
//			model.addAttribute("currentPage", pageNumber);
//			model.addAttribute("keyword", keyword);
//		} catch (Exception e) {
//			e.printStackTrace();
//			foods = foodService.getAll();
//		}
//		model.addAttribute("foods", foods);
//		return "user/shop";
//	}
//
//	@GetMapping("/productDetail/{id}")
//	public String doProductDetail(@PathVariable Long id, Model model) {
//		Food food = foodService.getById(id);
//		if (ObjectUtils.isNotEmpty(food)) {
//			model.addAttribute("food", food);
//		}
//		return "user/productDetail";
//	}
//
//	@GetMapping("/byCategory/{name}")
//	public String doShowProdByCate(@PathVariable("name") String name, Model model,
//			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
//			@RequestParam(value = "size", required = false, defaultValue = "9") int pageSize) {
//		List<Food> foods = new ArrayList<>();
//		try {
//			Page<Food> pageFoods = foodService.findByCategoryName(name, PageRequest.of(pageNumber - 1, pageSize));
//			foods = pageFoods.getContent();
//			model.addAttribute("totalPages", pageFoods.getTotalPages());
//			model.addAttribute("currentPage", pageNumber);
//		} catch (Exception ex) {
//			foods = foodService.getAll();
//			ex.printStackTrace();
//		}
//		model.addAttribute("foods", foods);
//		return "user/shop";
//	}
//	
//	@GetMapping("/myOrder")
//	public String doShowOrder() {
//		return "user/myOrder";
//	}
//}
