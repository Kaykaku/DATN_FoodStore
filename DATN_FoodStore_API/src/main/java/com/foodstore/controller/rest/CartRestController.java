package com.foodstore.controller.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.service.CartService;

@RestController
@RequestMapping("/rest/cart")
public class CartRestController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private HttpServletRequest request;

	@GetMapping("/add")
	public ResponseEntity<?> doAdd(@RequestParam("id") Long id, @RequestParam("quantity") Integer quantity,
			@RequestParam("isReplace") boolean isReplace) {
		return ResponseEntity.ok(cartService.handleCart(id, quantity, isReplace));
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
}
