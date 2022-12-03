package com.foodstore.service;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.foodstore.model.transaction.Order;


@Service
public interface OrderService extends IService<Order> {
	Page<Order> getByCustomerId(Long id,Pageable pageable);
	
	public Order create(JsonNode orderData);
	
	Page<Order> getAllByOrderIdLike(String id,Pageable pageable);
	
	Page<Order> getByPaymentmethodId(Long id,Pageable pageable);
	
	Page<Order> getByCustomerIdAndPaymentmethodId(Long customerId , Long paymentmethodId,Pageable pageable);
	
	Page<Order> getByDisplayStatus( boolean isDisplay,Pageable pageable);
	
	Page<Order> getByOrderStatus( int status,Pageable pageable);
	
	Page<Order> getByWatchStatus( boolean isWatched,Pageable pageable);
	
	List<Order> getByKeywordEng(String keyword);
	
	List<Order> getByFilter(
			String keyword,
			Optional<Long> cus_id,
			Optional<Long> pay_id ,
			Optional<Long> create_date ,
			Optional<Double> fee,
			Optional<Long> paid_date, 
			Optional<Integer> status,
			Optional<Boolean> is_watched , 
			Optional<Boolean> is_display);
	
	Page<Order> getByFilter(
			String keyword,
			Optional<Long> cus_id,
			Optional<Long> pay_id ,
			Optional<Long> create_date ,
			Optional<Double> fee,
			Optional<Long> paid_date, 
			Optional<Integer> status,
			Optional<Boolean> is_watched , 
			Optional<Boolean> is_display,
			Pageable pageable);
	/*
	 * Page<Order> getByAllStatus(Optional<Boolean>
	 * isDisplay,Optional<Boolean> status,Optional<Boolean> isWatched,Pageable pageable);
	 */
}
