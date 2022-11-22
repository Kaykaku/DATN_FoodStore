package com.foodstore.controller.rest;

import java.util.ArrayList;
import java.util.List;

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

import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/customer")
@Slf4j
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
			@RequestParam(value = "size", required = false) int pageSize) {
		List<Customer> customers = new ArrayList<>();
		try {
			Page<Customer> pageCustomers = customerService.getByIsDisplay(PageRequest.of(pageNumber - 1, pageSize));
			customers = pageCustomers.getContent();
			if (customers.size() > 0) {
				return ResponseEntity.ok(customers);
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
		List<Customer> customers = new ArrayList<>();
		try {
			Page<Customer> pageCustomers = customerService.getByKeyword(keyword, PageRequest.of(pageNumber - 1, pageSize));
			customers = pageCustomers.getContent();
			if (customers.size() > 0) {
				return ResponseEntity.ok(customers);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> doGetById(@PathVariable("id") Long id) {
		Customer customerResp = customerService.getById(id);
		if (ObjectUtils.isEmpty(customerResp)) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.ok(customerResp);
	}

	@PostMapping("/add")
	public ResponseEntity<?> doCreate(@Valid @RequestBody Customer customerReq) {
		try {
			if (customerService.getByUsername(customerReq.getUsername()) != null) {
				log.error("Username đã tồn tại!");
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			} else {
				log.info("Create Successfully!");
				return new ResponseEntity<>(customerService.create(customerReq), HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Create Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> doUpdate(@RequestBody Customer customerReq, @PathVariable("id") Long id) {
		Customer currentCustomer = customerService.getById(id);
		try {
			if (ObjectUtils.isNotEmpty(currentCustomer)) {
				log.info("Update Successfully! --->");
				return new ResponseEntity<>(customerService.update(customerReq), HttpStatus.OK);
			}
		} catch (Exception ex) {
			log.error("Update Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> doDelete(@PathVariable("id") Long id) {
		try {
			customerService.deleteLogical(id);
			log.info("Detele " + id + " Successfully!");
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception ex) {
			log.error("Delete Failed ---> " + ex.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
