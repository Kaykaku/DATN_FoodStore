package com.foodstore.controller.rest;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.model.entity.Category;
import com.foodstore.service.CategoryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/rest/category")
@Slf4j
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			Page<Category> pageCategories = categoryService.getAll(PageRequest.of(page.orElse(0), size.orElse(10)));
			return ResponseEntity.ok(pageCategories);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "create_by") Optional<Long> create_by,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "type") Optional<Integer> type,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			Page<Category> pageCategories = categoryService.getByFilter(
					keyword.orElse("")
					,create_date
					,create_by
					,is_display
					,type
					,PageRequest.of(page.orElse(0), size.orElse(10)));
			return ResponseEntity.ok(pageCategories);
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
		List<Category> categories = new ArrayList<>();
		try {
			Page<Category> pageCategories = categoryService.getByKeyword(keyword, PageRequest.of(pageNumber, pageSize));
			categories = pageCategories.getContent();
			if (categories.size() > 0) {
				return ResponseEntity.ok(categories);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> doGetById(@PathVariable("id") Long id) {
		Category categoryResp = categoryService.getById(id);
		if (ObjectUtils.isEmpty(categoryResp)) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.ok(categoryResp);
	}

	@PostMapping("/add")
	public ResponseEntity<Category> doCreate(@Valid @RequestBody Category categoryReq) {
		Category categoryResp = categoryService.create(categoryReq);
		try {
			if (ObjectUtils.isNotEmpty(categoryResp)) {
				log.info("Create Successfully! ---> " + categoryResp.getName());
				return new ResponseEntity<>(categoryResp, HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Create Failed! --->" + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> doUpdate(@RequestBody Category categoryReq, @PathVariable("id") Long id) {
		Category currentCategory = categoryService.getById(id);
		try {
			if (ObjectUtils.isNotEmpty(currentCategory)) {
				log.info("Update Successfully!");
				return new ResponseEntity<>(categoryService.update(categoryReq), HttpStatus.OK);
			}
		} catch (Exception ex) {
			log.error("Update Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> doDelete(@PathVariable("id") Long id) {
		try {
			categoryService.deleteLogical(id);
			log.info("Detele " + id + " Successfully!");
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception ex) {
			log.error("Delete Failed ---> " + ex.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
