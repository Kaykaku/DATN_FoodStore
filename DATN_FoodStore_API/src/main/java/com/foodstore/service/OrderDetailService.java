package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.OrderDetail;


@Service
public interface OrderDetailService extends IService<OrderDetail> {
	Page<OrderDetail> getByFoodId(Pageable pageable,Long id);
	
	Page<OrderDetail> getByOrderId(Pageable pageable,Long id);
	
	Page<OrderDetail> getByFoodIdAndOrderId(Pageable pageable,Long foodId , Long orderId);
	
	Page<OrderDetail> getByAllStatus(Pageable pageable,boolean isDisplay);
	
	Page<OrderDetail> getByAllStatus(Pageable pageable,int status);
	
	Page<OrderDetail> getByAllStatus(Pageable pageable,boolean isDisplay,int status);
}
