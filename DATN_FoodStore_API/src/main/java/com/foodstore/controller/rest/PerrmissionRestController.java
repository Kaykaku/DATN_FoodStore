package com.foodstore.controller.rest;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.Permission;
import com.foodstore.service.PermissionService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/permission")
public class PerrmissionRestController {
	
	@Autowired
	private PermissionService permissionService;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			Page<Permission> pageCategories = permissionService.getAll(PageRequest.of(page.orElse(0), size.orElse(10)));
			return ResponseEntity.ok(pageCategories);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {
			
			Page<Permission> pageCategories = permissionService.getByFilter(
					keyword.orElse("")
					,is_display
					,PageRequest.of(page.orElse(0), size.orElse(8),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(pageCategories);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter/all")
	public ResponseEntity<?> doGetAll(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "is_display") Optional<Boolean> is_display) {
		try {
			
			List<Permission> pageCategories = permissionService.getByFilter(
					keyword.orElse("")
					,is_display);
			return ResponseEntity.ok(pageCategories);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("/create")
	public Permission create(@RequestBody Permission permission) {
		return permissionService.create(permission);
	}
	
	@PutMapping("/update/{id}")
	public Permission update(@RequestBody Permission permission,@PathVariable("id")Integer id) {
		return permissionService.update(permission);
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id")Long id) {
		permissionService.delete(id);
	}
	
	
	
}
