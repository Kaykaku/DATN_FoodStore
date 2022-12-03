package com.foodstore.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.foodstore.dao.OrderDAO;
import com.foodstore.dao.OrderDetailDAO;
import com.foodstore.model.entity.Customer;
import com.foodstore.model.extend.Notification;
import com.foodstore.model.transaction.Order;
import com.foodstore.model.transaction.OrderDetail;
import com.foodstore.service.CustomerService;
import com.foodstore.service.NotificationService;
import com.foodstore.service.OrderService;
import com.foodstore.util.constraints.Colorful;
import com.foodstore.util.convert.Convert;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired 
	private OrderDAO orderDAO;
	
	@Autowired 
	private OrderDetailDAO detailDAO;
	
	@Autowired 
	private CustomerService customerService;
	
	@Autowired 
	private NotificationService notificationService;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Order getById(Long id) {
		return orderDAO.findById(id).orElse(null);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getAllByOrderIdLike(String id,Pageable pageable) {
		return orderDAO.findAllByOrderIdLike(id,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Order> getAll() {
		return orderDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Order create(Order entiy) {
		return orderDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Order create(JsonNode orderData) {
		ObjectMapper mapper = new ObjectMapper();
		
		Order order = mapper.convertValue(orderData, Order.class);
		order.setOrder_date(new Date());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Customer customer = customerService.getByUsername(((UserDetails)principal).getUsername());
		order.setCustomer_o(customer);
		orderDAO.save(order);
		
		TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {};
		List<OrderDetail> details = mapper.convertValue(orderData.get("order_details"), type)
				.stream().peek(d->d.setOrder(order)).collect(Collectors.toList());
		detailDAO.saveAll(details);
		
		notificationService.createMess("Bạn đã đặt đơn hàng #"+order.getId() +" thành công!", order.getId(), "order", customer, Colorful.Info);
		return order;
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Order update(Order entiy) {
		return orderDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		orderDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getAll(Pageable pageable) {
		return orderDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getByCustomerId(Long id,Pageable pageable) {
		return orderDAO.findByCustomerId(id,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getByPaymentmethodId(Long id,Pageable pageable) {
		return orderDAO.findByPaymentmethodId(id,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getByCustomerIdAndPaymentmethodId(Long customerId, Long paymentmethodId , Pageable pageable){
		return orderDAO.findByCustomerIdAndPaymentmethodId( customerId,paymentmethodId,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getByDisplayStatus( boolean isDisplay,Pageable pageable) {
		return orderDAO.findByDisplayStatus(isDisplay,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getByOrderStatus(int status,Pageable pageable) {
		return orderDAO.findByOrderStatus(status,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Order> getByWatchStatus(boolean isWatched,Pageable pageable) {
		return orderDAO.findByWatchStatus(isWatched,pageable);
	}

	@Override
	public List<Order> getByFilter(String keyword, Optional<Long> cus_id, Optional<Long> pay_id,
			Optional<Long> create_date, Optional<Double> fee, Optional<Long> paid_date, Optional<Integer> status,
			Optional<Boolean> is_watched, Optional<Boolean> is_display) {
		List<Order> list = getByKeywordEng(keyword);
		if(cus_id.isPresent()) list = list.stream().filter(o-> o.getCustomer_o().getId() == cus_id.get()).toList();
		if(pay_id.isPresent()) list = list.stream().filter(o-> o.getPaymentmethod().getId() == pay_id.get()).toList();
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getOrder_date().getTime() >= create_date.get()).toList();
		if(fee.isPresent()) list = list.stream().filter(o-> o.getFee() >= fee.get()).toList();
		if(paid_date.isPresent()) list = list.stream().filter(o-> o.getPaid_date().getTime() >=  paid_date.get()).toList();
		if(status.isPresent()) list = list.stream().filter(o-> o.getStatus() == status.get()).toList();
		if(is_display.isPresent()) list = list.stream().filter(o-> o.is_display() == is_display.get()).toList();
		if(is_watched.isPresent()) list = list.stream().filter(o-> o.is_watched() == is_watched.get()).toList();
		return list;
	}

	@Override
	public Page<Order> getByFilter(String keyword, Optional<Long> cus_id, Optional<Long> pay_id,
			Optional<Long> create_date, Optional<Double> fee, Optional<Long> paid_date, Optional<Integer> status,
			Optional<Boolean> is_watched, Optional<Boolean> is_display, Pageable pageable) {
		List<Order> list = getByFilter(keyword, cus_id, pay_id, create_date, fee, paid_date, status, is_watched, is_display);
		return (Page<Order>) Convert.toPage(list, pageable);
	}
	
	@Override
	public List<Order> getByKeywordEng(String keyword) {
		List<Order> list = orderDAO.findAll();
		list = list.stream().filter(o -> Convert.toEngString(o.getShipped_address().toLowerCase()).contains(Convert.toEngString(keyword.toLowerCase())) 
				|| Convert.toEngString(o.getShipped_phone().toLowerCase()).contains(Convert.toEngString(keyword.toLowerCase()))).toList();
		return list;
	}
}
