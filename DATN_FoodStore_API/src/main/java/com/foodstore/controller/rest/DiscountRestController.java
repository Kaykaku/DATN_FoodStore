package com.foodstore.controller.rest;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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

import com.foodstore.model.entity.User;
import com.foodstore.model.extend.Discount;
import com.foodstore.service.DiscountService;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.TableName;
import com.foodstore.util.convert.RemoteCurrentUser;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/discount")
public class DiscountRestController {
	
	@Autowired
	private DiscountService discountService;
	@Autowired
	private UserService userService;
	@Autowired
	private RemoteCurrentUser remoteCurrentUser;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			Page<Discount> pageList = discountService.getAll(PageRequest.of(0, 10));
			return ResponseEntity.ok(pageList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/active")
	public ResponseEntity<?> doGetActive(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			List<Discount> pageList = discountService.getAll().stream()
					.filter(d -> d.is_display() 
					&& d.getCreate_date().getTime() <= new Date().getTime()
					&& d.getEnd_date().getTime() >= new Date().getTime()).toList();
			return ResponseEntity.ok(pageList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "is_fixed") Optional<Boolean> is_fixed,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "start_date") Optional<Long> start_date,
			@RequestParam(value = "end_date") Optional<Long> end_date,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "create_by") Optional<Long> create_by,
			@RequestParam(value = "type") Optional<Integer> type,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {
			Page<Discount> pageD = discountService.getByFilter(
					keyword.orElse("")
					,is_fixed
					,create_date
					,start_date
					,end_date
					,is_display
					,create_by
					,PageRequest.of(page.orElse(0), size.orElse(10),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(pageD);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("/create")
	public Discount create(@RequestBody Discount discount) {
		discount.setCreate_date(new Date());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userService.getByUsername(((UserDetails)principal).getUsername());
		discount.setUser_d(user);
		Discount d =discountService.create(discount);
		remoteCurrentUser.createHistory(" create a new record '"+ d.getName()+"' with ID", TableName.Discount , d.getId());
		return d;
	}
	
	@PutMapping("/update/{id}")
	public Discount update(@RequestBody Discount discount,@PathVariable("id")Integer id) {
		Discount d =discountService.update(discount);
		remoteCurrentUser.createHistory(" update record '"+ d.getName()+"' with ID", TableName.Discount , d.getId());
		return d;
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id")Long id) {
		Discount d =discountService.getById(id);
		remoteCurrentUser.createHistory(" delete record '"+ d.getName()+"' with ID", TableName.Discount , d.getId());
		discountService.delete(id);
	}
	
}
