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

import com.fasterxml.jackson.databind.JsonNode;
import com.foodstore.model.transaction.Order;
import com.foodstore.model.transaction.OrderDetail;
import com.foodstore.service.OrderDetailService;
import com.foodstore.service.OrderService;
import com.foodstore.util.constraints.TableName;
import com.foodstore.util.convert.RemoteCurrentUser;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/order")
public class OrderRestController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private RemoteCurrentUser remoteCurrentUser;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAll() {
		try {
			List<Order> list = orderService.getAll();
			return ResponseEntity.ok(list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "cus_id") Optional<Long> cus_id,
			@RequestParam(value = "pay_id") Optional<Long> pay_id ,
			@RequestParam(value = "create_date") Optional<Long> create_date ,
			@RequestParam(value = "fee") Optional<Double> fee,
			@RequestParam(value = "paid_date") Optional<Long> paid_date, 
			@RequestParam(value = "status") Optional<Integer> status,
			@RequestParam(value = "is_watched") Optional<Boolean> is_watched , 
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {
			Page<Order> pageO = orderService.getByFilter(
					keyword.orElse(""),
					cus_id,
					pay_id,
					create_date,
					fee,
					paid_date,
					status,
					is_watched,
					is_display,
					PageRequest.of(page.orElse(0), size.orElse(10),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(pageO);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
//	@PostMapping("/create")
//	public Order create(@RequestBody Order order) {
//		order.setOrder_date(new Date());
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		Customer customer = customerService.getByUsername(((UserDetails)principal).getUsername());
//		order.setCustomer_o(customer);
//		System.out.println(order.getOrder_details().get(0));
//		return orderService.create(order);
//	}
	
	@PostMapping("/create")
	public Order create(@RequestBody JsonNode orderData) {
		Order o = orderService.create(orderData);
		remoteCurrentUser.createHistory(" (AUTO CREATE BY CUSTOMER) create new record of customer '"+ o.getCustomer_o().getUsername()+"' with ID", TableName.Order , o.getId());
		return o;
	}
	
	@PostMapping("/createOrder")
	public Order createOrder(@RequestBody JsonNode orderData) {
		Order o = orderService.create(orderData);
		remoteCurrentUser.createHistory(" (AUTO CREATE BY CUSTOMER) create new record of customer '"+ o.getCustomer_o().getUsername()+"' with ID", TableName.Order , o.getId());
		return o;
	}
	
	@PutMapping("/update/{id}")
	public Order update(@RequestBody Order order,@PathVariable("id")Integer id) {
		Order o = orderService.update(order);
		remoteCurrentUser.createHistory(" update record of customer '"+ o.getCustomer_o().getUsername()+"' with ID", TableName.Order , o.getId());
		return o;
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id")Long id) {
		Order o = orderService.getById(id);
		remoteCurrentUser.createHistory(" delete record of customer '"+ o.getCustomer_o().getUsername()+"' with ID", TableName.Order , o.getId());
		orderService.delete(id);
	}
	
	@GetMapping("detail/{id}")
	public List<OrderDetail> getlist(@PathVariable("id")Long id) {
		return orderDetailService.getByOrderId(id);
	}
}
