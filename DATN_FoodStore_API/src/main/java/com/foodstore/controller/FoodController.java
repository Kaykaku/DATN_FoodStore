package com.foodstore.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.model.entity.Customer;
import com.foodstore.model.entity.Food;
import com.foodstore.model.extend.Comment;
import com.foodstore.model.extend.Discount;
import com.foodstore.model.transaction.Review;
import com.foodstore.service.CategoryService;
import com.foodstore.service.CommentService;
import com.foodstore.service.CustomerService;
import com.foodstore.service.DiscountService;
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
	private ReviewService reviewService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private DiscountService discountService;

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
				,Optional.of(Display.SHOW)
				,cate_id
				,PageRequest.of(page.isPresent() ? page.get()-1 : 0, size.orElse(9),sortOption));
		
		Map<Long,Double> reviewScore = new HashMap<>();
		for (Food food : list.getContent()) {
			reviewScore.put(food.getId(), reviewService.getAverageRating(food.getId()));
		}
		
		Map<Long,Discount> discounts = new HashMap<>();
		List<Discount> list2 = discountService.getAll();
		for (Discount discount : list2) {
			if(discount.getStart_date().getTime() <= new Date().getTime()
					&& discount.getEnd_date().getTime() >= new Date().getTime()
					&& discount.is_display() == true) {
				discounts.put(discount.getFood_d().getId(), discount);
			}
		}
		
		model.addAttribute("items", list);
		model.addAttribute("reviewScore", reviewScore);
		model.addAttribute("discounts", discounts);
		model.addAttribute("cid", cid.orElse(""));
		model.addAttribute("price_min", price_min.orElse(-1.0));
		model.addAttribute("price_max", price_max.orElse(-1.0));
		model.addAttribute("size", size.orElse(9));
		model.addAttribute("sortBy",sort.orElse("idDown"));
		model.addAttribute("title",cid.isPresent() ? categoryService.getByName(cid.get()).getDisplay_name() : ("category"));
		return "product/list";
	}

	@GetMapping("/detail/{id}")
	public String detail(Model model, @PathVariable("id") Long foodId,HttpServletRequest request) {
		Food item = foodService.getById(foodId);
		if(!item.is_display()) return "redirect:/security/unauthorized";
		item.setView_count(item.getView_count()+1);
		foodService.update(item);
		
		List<Comment> comments = commentService.getByFilter("", 
				Optional.ofNullable(null), Optional.ofNullable(foodId),
				Optional.ofNullable(null), Optional.ofNullable(null), Optional.ofNullable(Display.SHOW));
		double  averageRating = reviewService.getAverageRating(foodId);
		Map<Integer, Integer> ratingStatus = reviewService.getStatictisRating(foodId);
		Page<Food> foods = foodService.getByFilter("",
				Optional.ofNullable(null), Optional.ofNullable(null), Optional.ofNullable(null), Optional.ofNullable(null), Optional.ofNullable(null), Optional.ofNullable(null),
				Optional.ofNullable(Display.SHOW), 
				Optional.ofNullable( item.getCategory_foods().size() > 0 ? item.getCategory_foods().get(0).getCategory_f().getId():1),
				PageRequest.of(0, 4));
		
		String username = request.getRemoteUser();
		Customer customer = customerService.getByUsername(username);
		if(customer!=null) {
			Review review = reviewService.getByCustomerIdAndFoodId(customer.getId(),foodId);
			if(review==null) {
				review = new Review();
				review.setCustomer_r(customer);
				review.setFood_r(item);
				review = reviewService.create(review);
			}
			review.setViews(review.getViews()+1);
			reviewService.update(review);
			model.addAttribute("review", review);
		}
		
		Map<Long,Discount> discounts = new HashMap<>();
		List<Discount> list2 = discountService.getAll();
		for (Discount discount : list2) {
			if(discount.getStart_date().getTime() <= new Date().getTime()
					&& discount.getEnd_date().getTime() >= new Date().getTime()
					&& discount.is_display() == true) {
				discounts.put(discount.getFood_d().getId(), discount);
			}
		}
		model.addAttribute("item", item);
		model.addAttribute("items", foods);
		model.addAttribute("comments", comments);
		model.addAttribute("averageRating", averageRating);
		model.addAttribute("ratingStatus", ratingStatus);
		model.addAttribute("title", item.getName());
		model.addAttribute("discounts", discounts);
		return "product/detail";
	}

	@ModelAttribute("sortList")
	public Map<String, String> get() {
		Map<String, String> map = new LinkedHashMap<>();
		map.put("Date up", "idUp");
		map.put("Date down", "idDown");
		map.put("Price up", "priceUp");
		map.put("Price down", "priceDown");
		map.put("A-Z", "nameUp");
		map.put("Z-A", "nameDown");
		return map;
	}
}
