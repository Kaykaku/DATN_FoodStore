package com.foodstore.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.OrderDetail;


@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	@Query("Select o From OrderDetail o Where o.food_od.id=?1")
	Page<OrderDetail> findByFoodId(Long id,Pageable pageable);
	
	@Query("Select o From OrderDetail o Where o.order.id=?1")
	Page<OrderDetail> findByOrderId(Long id,Pageable pageable);
	
	@Query("Select o From OrderDetail o Where o.food_od.id=?1 and o.order.id=?2")
	Page<OrderDetail> findByFoodIdAndOrderId(Long foodId , Long orderId,Pageable pageable);
	
	//Fix later
	/*
	 * @Query("Select o From OrderDetail o Where " +
	 * "o.is_display=?1 and o.status=?2") Page<OrderDetail> findByAllStatus(Pageable
	 * pageable,boolean isDisplay,int status);
	 */
}
