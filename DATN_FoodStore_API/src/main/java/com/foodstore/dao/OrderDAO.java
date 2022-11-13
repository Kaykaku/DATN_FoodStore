package com.foodstore.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Order;

@Repository
public interface OrderDAO extends JpaRepository<Order, Long>{
	@Query("Select o From Order o Where o.customer_o.id=?1")
	Page<Order> findByCustomerId(Pageable pageable,Long id);
	
	@Query("Select o From Order o Where o.paymentmethod.id=?1")
	Page<Order> findByPaymentmethodId(Pageable pageable,Long id);
	
	@Query("Select o From Order o Where o.paymentmethod.id=?1 and o.paymentmethod.id=?2")
	Page<Order> findByCustomerIdAndPaymentmethodId(Pageable pageable,Long customerId , Long paymentmethodId);
	
	@Query("Select o From Order o Where o.is_display=?1")
	Page<Order> findByDisplayStatus(Pageable pageable,boolean isDisplay);
	
	@Query("Select o From Order o Where o.status=?1")
	Page<Order> findByOrderStatus(Pageable pageable,int status);
	
	@Query("Select o From Order o Where o.is_watched=?1")
	Page<Order> findByWatchStatus(Pageable pageable,boolean isWatched);
}
