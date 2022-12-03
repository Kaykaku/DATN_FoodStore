package com.foodstore.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.model.entity.Customer;
import com.foodstore.model.transaction.Order;
import com.foodstore.service.CustomerService;
import com.foodstore.service.OrderService;
import com.foodstore.util.constraints.Display;


@Controller
@RequestMapping("user/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private CustomerService customerService;

	@GetMapping("list")
	public String list(Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		Customer customer = customerService.getByUsername(username);
		List<Order> orders =orderService.getByFilter(
				"",
				Optional.ofNullable(customer.getId()),
				Optional.ofNullable(null),
				Optional.ofNullable(null),
				Optional.ofNullable(null),
				Optional.ofNullable(null),
				Optional.ofNullable(null),
				Optional.ofNullable(null),
				Optional.ofNullable(Display.SHOW)
				)
				.stream().sorted((o1,o2) -> ((Long)o2.getOrder_date().getTime()).compareTo((Long)o1.getOrder_date().getTime()))
				.collect(Collectors.toList());
		model.addAttribute("orders", orders);
		model.addAttribute("title", "My orders");
		model.addAttribute("totalAmount", orders.stream().mapToDouble(o -> 
			o.getOrder_details().stream().mapToDouble(d-> d.getPrice()*d.getQuantity()).sum()).sum());
		return "order/list";
	}

	@GetMapping({"detail/{id}","{id}"})
	public String detail(@PathVariable("id") Long id, Model model , HttpServletRequest request,@RequestParam("read") Optional<Boolean> read) {
		String username = request.getRemoteUser();
		Customer customer = customerService.getByUsername(username);
		Order order = orderService.getById(id);
		if(order == null || order.getCustomer_o().getId() !=customer.getId()) return "redirect:/security/unauthorized";
		model.addAttribute("order", order);
		model.addAttribute("title", "Order #"+id);
		return "order/detail";
	}

}
