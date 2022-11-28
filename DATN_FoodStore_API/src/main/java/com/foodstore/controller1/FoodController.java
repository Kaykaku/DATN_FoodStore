package com.foodstore.controller1;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.model.entity.Category;
import com.foodstore.model.entity.Food;
import com.foodstore.model.extend.Comment;
import com.foodstore.service.CategoryFoodService;
import com.foodstore.service.CategoryService;
import com.foodstore.service.CommentService;
import com.foodstore.service.FoodService;
import com.foodstore.service.ReviewService;
import com.foodstore.util.constraints.Display;


@Controller
@RequestMapping("shop")
public class FoodController {
	@Autowired
	private FoodService foodService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CategoryFoodService categoryFoodService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CommentService commentService;

	@RequestMapping({ "all", "{category}" })
	public String list(Model model, @PathVariable(value = "category") Optional<String> cid,
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "price_min") Optional<Double> price_min,
			@RequestParam(value = "price_max") Optional<Double> price_max,
			@RequestParam(value = "quantity") Optional<Integer> quantity,
			@RequestParam(value = "view") Optional<Integer> view,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "create_by") Optional<Long> create_by,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "status") Optional<Integer> status,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sortBy") Optional<String> sort) {
	
		boolean up = sort.orElse("").contains("Up");
		Sort sortOption = Sort.by(up ? Direction.ASC : Direction.DESC
				, sort.orElse("name").replace("Down","").replace("Up", ""));
		
		Optional<Long> cate_id = Optional.ofNullable(null);
		if(cid.isPresent()) cate_id = Optional.ofNullable(categoryService.getByName(cid.get()).getId());
		
		Page<Food> list =  foodService.getByFilter(
				keyword.orElse("")
				,price_min
				,price_max
				,quantity
				,view
				,create_date
				,status
				,is_display
				,cate_id
				,PageRequest.of(page.isPresent() ? page.get()-1 : 0, size.orElse(9),sortOption));
		model.addAttribute("items", list);
		model.addAttribute("cid", cid.orElse(""));
		model.addAttribute("price_min", price_min.orElse(0.0));
		model.addAttribute("price_max", price_max.orElse(0.0));
		model.addAttribute("size", size.orElse(9));
		model.addAttribute("sortBy",sort.orElse("create_dateDown"));
		model.addAttribute("title","category");
		return "product/list";
	}

	@GetMapping("/detail/{id}")
	public String detail(Model model, @PathVariable("id") Long foodId) {
		Food item = foodService.getById(foodId);
		
		List<Comment> comments = commentService.getByFilter("", 
				Optional.ofNullable(foodId), Optional.ofNullable(null),
				Optional.ofNullable(null), Optional.ofNullable(null), Optional.ofNullable(Display.SHOW));
		
		double  averageRating = reviewService.getAverageRating(foodId);
		Map<Integer, Integer> ratingStatus = reviewService.getStatictisRating(foodId);
		model.addAttribute("item", item);
		model.addAttribute("comments", comments);
		model.addAttribute("averageRating", averageRating);
		model.addAttribute("ratingStatus", ratingStatus);
		model.addAttribute("title", item.getName());
		return "product/detail";
	}

	@ModelAttribute("sortList")
	public Map<String, String> get() {
		Map<String, String> map = new LinkedHashMap<>();
		map.put("Date up", "create_dateUp");
		map.put("Date down", "create_dateDown");
		map.put("Price up", "priceUp");
		map.put("Price down", "priceDown");
		map.put("Name up", "nameUp");
		map.put("Name down", "nameDown");
		return map;
	}
}
