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

import com.foodstore.model.entity.Customer;
import com.foodstore.model.extend.PhoneAddress;
import com.foodstore.service.CustomerService;
import com.foodstore.service.PhoneAddressService;
import com.foodstore.util.constraints.Contact;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/customer")
public class CustomerRestController {
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private PhoneAddressService phoneAddressService;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			Page<Customer> cusPage = customerService.getAll(PageRequest.of(page.orElse(0), size.orElse(10)));
			return ResponseEntity.ok(cusPage);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "gender") Optional<Boolean> gender,
			@RequestParam(value = "birthday") Optional<Long> birthday,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "status") Optional<Integer> status,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {
			
			Page<Customer> customerPage = customerService.getByFilter(
					keyword.orElse("")
					,gender
					,birthday
					,create_date
					,is_display
					,status
					,PageRequest.of(page.orElse(0), size.orElse(10),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(customerPage);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/phone/default")
	public ResponseEntity<?> doGetAllDefaultPhone() {
		try {
			List<PhoneAddress> page = phoneAddressService.getByFilter("",Optional.ofNullable(null), Optional.ofNullable(Contact.PHONE),Optional.ofNullable(true));
			return ResponseEntity.ok(page);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/address/default")
	public ResponseEntity<?> doGetAllDefaultAddress() {
		try {
			List<PhoneAddress> page = phoneAddressService.getByFilter("",Optional.ofNullable(null), Optional.ofNullable(Contact.ADDRESS),Optional.ofNullable(true));
			return ResponseEntity.ok(page);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/contact/{id}")
	public ResponseEntity<?> doGetContactByCus(@PathVariable("id")Long id) {
		try {
			List<PhoneAddress> page = phoneAddressService.getByFilter("",Optional.ofNullable(id), Optional.ofNullable(null),Optional.ofNullable(null));
			return ResponseEntity.ok(page);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("/create")
	public Customer create(@RequestBody Customer customer) {
		customer.setCreate_date(new Date());
		return customerService.create(customer);
	}
	
	@PutMapping("/update/{id}")
	public Customer update(@RequestBody Customer customer,@PathVariable("id")Integer id) {
		return customerService.update(customer);
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id")Long id) {
		customerService.delete(id);
	}
	
}