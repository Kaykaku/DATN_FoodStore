package com.foodstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foodstore.model.entity.Paymentmethod;
import com.foodstore.service.PaymentmethodService;

@Controller
@RequestMapping("cart")
public class ShoppingCartController {
	@Autowired
	private PaymentmethodService paymentmethodService;
	
	@GetMapping("view")
	public String view(Model model) {
		List<Paymentmethod> list = paymentmethodService.getAll();
		model.addAttribute("paymethods", list);
		model.addAttribute("title", "Cart");
		return "cart/view";
	}
	
	@GetMapping("checkout")
	public String checkout(Model model) {
		List<Paymentmethod> list = paymentmethodService.getAll();
		model.addAttribute("paymethods", list);
		model.addAttribute("title", "Check out");
		return "cart/checkout";
	}
}
