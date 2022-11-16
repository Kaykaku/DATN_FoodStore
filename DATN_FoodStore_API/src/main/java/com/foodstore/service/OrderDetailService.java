package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.OrderDetail;


@Service
public interface OrderDetailService extends IService<OrderDetail> {
	Page<OrderDetail> getByFoodId(Long id,Pageable pageable);
	
	Page<OrderDetail> getByOrderId(Long id,Pageable pageable);
	
	Page<OrderDetail> getByFoodIdAndOrderId(Long foodId , Long orderId,Pageable pageable);
	
	Page<OrderDetail> getByAllStatus(boolean isDisplay,Pageable pageable);
	
	Page<OrderDetail> getByAllStatus(int status,Pageable pageable);
	
	Page<OrderDetail> getByAllStatus(boolean isDisplay,int status,Pageable pageable);
}
