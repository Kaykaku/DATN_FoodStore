package com.foodstore.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.service.CategoryService;
import com.foodstore.service.FoodService;

@RestController()
@RequestMapping("/api/shop")
public class ShopApi {

	@Autowired
	private FoodService foodService;
	
	@Autowired
	private CategoryService categoryService;

	@GetMapping()
	public ResponseEntity<?> doShowIndex() {
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
