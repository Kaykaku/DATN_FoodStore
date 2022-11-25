package com.foodstore.controller.rest;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.Customer;
import com.foodstore.service.CartService;
import com.foodstore.service.CustomerService;

@RestController
@RequestMapping("/rest/cart")
public class CartRestController {

	@Autowired
	private CartService cartService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private CustomerService customerService;

	@GetMapping("/add")
	public ResponseEntity<?> doAdd(@RequestParam("id") Long id, @RequestParam("quantity") Integer quantity,
			@RequestParam("isReplace") boolean isReplace) {
		String username = request.getRemoteUser();
		if (ObjectUtils.isEmpty(username)) {
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
		}

		Customer currentCus = customerService.getByUsername(username);
		return ResponseEntity.ok(cartService.handleCart(currentCus, id, quantity, isReplace));
	}

	@GetMapping("/refreshQuantity")
	public ResponseEntity<?> getTotalQuantity() {
		String username = request.getRemoteUser();
		return ResponseEntity.ok(cartService.getTotalQuantity(username));
	}

	@GetMapping("/refreshPrice")
	public ResponseEntity<?> getTotalPrice() {
		String username = request.getRemoteUser();
		return ResponseEntity.ok(cartService.getTotalPrice(username));
	}

	@GetMapping("/delete/{id}")
	public void doDelete(@PathVariable("id") Long id) {
		cartService.delete(id);
	}

	@GetMapping("/clear")
	public void doClear() {
		String username = request.getRemoteUser();
		Customer currentCus = customerService.getByUsername(username);
		cartService.clearAll(currentCus.getId());
	}
}
