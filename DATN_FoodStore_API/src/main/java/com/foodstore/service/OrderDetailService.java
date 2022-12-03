package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
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
	
	@Query("Select o From OrderDetail o Where o.food_od.id=?1")
	List<OrderDetail> getByFoodId(Long id);
	
	@Query("Select o From OrderDetail o Where o.order.id=?1")
	List<OrderDetail> getByOrderId(Long id);
	
	@Query("Select o From OrderDetail o Where o.food_od.id=?1 and o.order.id=?2")
	List<OrderDetail> getByFoodIdAndOrderId(Long foodId , Long orderId);
}
