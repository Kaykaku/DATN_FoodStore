package com.foodstore.service;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Order;


@Service
public interface OrderService extends IService<Order> {
	Page<Order> getByCustomerId(Long id,Pageable pageable);
	
	Page<Order> getAllByOrderIdLike(String id,Pageable pageable);
	
	Page<Order> getByPaymentmethodId(Long id,Pageable pageable);
	
	Page<Order> getByCustomerIdAndPaymentmethodId(Long customerId , Long paymentmethodId,Pageable pageable);
	
	Page<Order> getByDisplayStatus( boolean isDisplay,Pageable pageable);
	
	Page<Order> getByOrderStatus( int status,Pageable pageable);
	
	Page<Order> getByWatchStatus( boolean isWatched,Pageable pageable);
	/*
	 * Page<Order> getByAllStatus(Optional<Boolean>
	 * isDisplay,Optional<Boolean> status,Optional<Boolean> isWatched,Pageable pageable);
	 */
}
