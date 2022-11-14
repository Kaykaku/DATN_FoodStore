package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Order;


@Service
public interface OrderService extends IService<Order> {
	Page<Order> getByCustomerId(Pageable pageable,Long id);
	
	Page<Order> getByPaymentmethodId(Pageable pageable,Long id);
	
	Page<Order> getByCustomerIdAndPaymentmethodId(Pageable pageable,Long customerId , Long paymentmethodId);
	
	Page<Order> getByDisplayStatus(Pageable pageable,boolean isDisplay);
	
	Page<Order> getByOrderStatus(Pageable pageable,int status);
	
	Page<Order> getByWatchStatus(Pageable pageable,boolean isWatched);
}
