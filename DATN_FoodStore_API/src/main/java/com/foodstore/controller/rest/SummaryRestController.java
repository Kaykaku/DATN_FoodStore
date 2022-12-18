package com.foodstore.controller.rest;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.service.CustomerService;
import com.foodstore.service.FoodService;
import com.foodstore.service.OrderDetailService;
import com.foodstore.service.OrderService;
import com.foodstore.service.UserService;

@RestController
@CrossOrigin("*")
@RequestMapping("rest/summary")
public class SummaryRestController {
	@Autowired private FoodService foodService;
	@Autowired private OrderService orderService;
	@Autowired private OrderDetailService orderDetailService;
	@Autowired private CustomerService customerService;
	@Autowired private UserService userService;
	/* -- First Row Content -- */
	@GetMapping("firstRow")
	public Map<String,Object> showSummary(){
		Map<String,Object> map = new HashMap<>();
		map.put("todayOrder", orderService.getToDayOrder());
		map.put("totalOrder", orderService.totalOrder());
		map.put("available", foodService.getAvailable());
		map.put("totalProduct", foodService.getTotalProduct());
		map.put("todayIncome", orderDetailService.getTodayIncome());
		map.put("totalIncome", orderDetailService.getTotalIncome());
		map.put("totalCustomer", customerService.getAll().size());
		map.put("todayCustomer", customerService.getAll().stream().filter(c-> c.getCreate_date().getTime() >= new Date().getTime()-86400).count());
		map.put("totalAccount", userService.getAll().size());
		return map;
	}
	
	@GetMapping("secondRow")
	public Map<String,List<Object[]>> showSecond(){
		Map<String,List<Object[]>> map = new HashMap<>();
		map.put("revenueLast7Days", orderService.getRevenueLast7Days());
		map.put("productSoldByCate", foodService.numberOfProductSoldByType());
		return map;
	}
	
	@GetMapping("thirdRow")
	public Map<String,List<Object[]>> showThird(){
		Map<String,List<Object[]>> map = new HashMap<>();
		map.put("percentSoldByCate", foodService.getPercentByCate());
		map.put("productAvailableRate", foodService.availableRate());
		return map;
	}

	@GetMapping("fourthRow")
	public Map<String,List<Object[]>> fourthRow(){
		Map<String,List<Object[]>> map = new HashMap<>();
		map.put("top10SoldProduct", foodService.top10Product());
		return map;
	}
	
	@GetMapping("fifthRow")
	public Map<String,List<Object[]>> fifthRow(){
		Map<String,List<Object[]>> map = new HashMap<>();
		map.put("topCustomer", customerService.top10Customer());
		return map;
	}
}
