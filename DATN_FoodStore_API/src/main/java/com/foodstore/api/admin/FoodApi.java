package com.foodstore.api.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.Food;
import com.foodstore.service.FoodService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/foods")
@Slf4j
public class FoodApi {

@Autowired
	private FoodService foodService;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
			@RequestParam(value = "size", required = false) int pageSize) {
		List<Food> foods = new ArrayList<>();
		try {
			Page<Food> pageFoods = foodService.getByIsDisplayAndQuantity(PageRequest.of(pageNumber - 1, pageSize));
			foods = pageFoods.getContent();
			if (foods.size() > 0) {
				return ResponseEntity.ok(foods);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/findByKeyword")
	public ResponseEntity<?> doGetAllByKeyword(
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
			@RequestParam(value = "size", required = false) int pageSize) {
		List<Food> foods = new ArrayList<>();
		try {
			Page<Food> pageFoods = foodService.getByKeyword(keyword, PageRequest.of(pageNumber - 1, pageSize));
			foods = pageFoods.getContent();
			if (foods.size() > 0) {
				return ResponseEntity.ok(foods);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> doGetById(@PathVariable("id") Long id) {
		Food categoryResp = foodService.getById(id);
		if (ObjectUtils.isEmpty(categoryResp)) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.ok(categoryResp);
	}

	@PostMapping("/add")
	public ResponseEntity<Food> doCreate(@Valid @RequestBody Food foodReq) {
		foodReq.setView_count(0);
		foodReq.setCreate_date(new Date());
		
		Food foodResp = foodService.create(foodReq);
		try {
			if (ObjectUtils.isNotEmpty(foodResp)) {
				log.info("Create Successfully! ---> " + foodResp.getName());
				return new ResponseEntity<>(foodResp, HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Create Failed! --->" + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> doUpdate(@RequestBody Food foodReq, @PathVariable("id") Long id) {
		Food currentFood = foodService.getById(id);
		try {
			if (ObjectUtils.isNotEmpty(currentFood)) {
				log.info("Update Successfully!");
				return new ResponseEntity<>(foodService.update(foodReq), HttpStatus.OK);
			}
		} catch (Exception ex) {
			log.error("Update Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> doDelete(@PathVariable("id") Long id) {
		try {
			foodService.deleteLogical(id);
			log.info("Detele " + id + " Successfully!");
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception ex) {
			log.error("Delete Failed ---> " + ex.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
