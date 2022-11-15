package com.foodstore.service;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Order;


@Service
public interface OrderService extends IService<Order> {
	Page<Order> getByCustomerId(Pageable pageable,Long id);
	
	Page<Order> getAllByOrderIdLike(Pageable pageable,String id);
	
	Page<Order> getByPaymentmethodId(Pageable pageable,Long id);
	
	Page<Order> getByCustomerIdAndPaymentmethodId(Pageable pageable,Long customerId , Long paymentmethodId);
	
	/*
	 * Page<Order> getByAllStatus(Pageable pageable,Optional<Boolean>
	 * isDisplay,Optional<Boolean> status,Optional<Boolean> isWatched);
	 */
}
