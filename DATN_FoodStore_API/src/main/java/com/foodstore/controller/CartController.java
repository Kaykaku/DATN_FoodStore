package com.foodstore.controller;
//package com.foodstore.controller;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.foodstore.model.transaction.Cart;
//import com.foodstore.service.CartService;
//
//@Controller
//@RequestMapping("/cart")
//public class CartController {
//
//	@Autowired
//	private CartService cartService;
//
//	@Autowired
//	private HttpServletRequest request;
//
//	@GetMapping("/view")
//	public String doShowCart(Model model,
//			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
//			@RequestParam(value = "size", required = false, defaultValue = "5") int pageSize) {
//		String username = request.getRemoteUser();
//		Page<Cart> carts = cartService.getByCustomerName(username, PageRequest.of(pageNumber - 1, pageSize));
//		model.addAttribute("totalPages", carts.getTotalPages());
//		model.addAttribute("currentPage", pageNumber);
//		model.addAttribute("carts", carts);
//		return "user/cart";
//	}
//
//	@GetMapping("/checkout")
//	public String doShowCheckout() {
//		return "user/checkout";
//	}
//}
