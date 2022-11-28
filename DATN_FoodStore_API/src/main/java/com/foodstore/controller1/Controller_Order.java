//package com.foodstore.controller1;
//
//import java.util.List;
//import java.util.Optional;
//import java.util.stream.Collectors;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.asm.entity.Order;
//import com.asm.service.Service_Order;
//
//@Controller
//@RequestMapping("user/order")
//public class Controller_Order {
//
//	@Autowired
//	private Service_Order orderService;
//
//	@GetMapping("list")
//	public String list(Model model, HttpServletRequest request) {
//		String username = request.getRemoteUser();
//		List<Order> orders =orderService.findByUsername(username)
//				.stream().sorted((o1,o2) -> o2.getId().compareTo(o1.getId()))
//				.collect(Collectors.toList());
//		model.addAttribute("orders", orders);
//		model.addAttribute("title", "My orders");
//		model.addAttribute("totalAmount", orders.stream().mapToDouble(o -> 
//			o.getOrderDetails().stream().mapToDouble(d-> d.getPrice()*d.getQuantity()).sum()).sum());
//		return "order/list";
//	}
//
//	@GetMapping("detail/{id}")
//	public String detail(@PathVariable("id") Long id, Model model , HttpServletRequest request,@RequestParam("read") Optional<Boolean> read) {
//		String username = request.getRemoteUser();
//		Order order =orderService.findByIdAndUsername(id,username);
//		if(order.equals(new Order())) return "redirect:/security/unauthorized";
//		if(read.orElse(false)) {
//			order.setRead1(true);
//			orderService.update(order);
//		}	
//		model.addAttribute("order", order);
//		model.addAttribute("title", "Order #"+id);
//		return "order/detail";
//	}
//
//}
