package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Order;

@Repository
public interface OrderDAO extends JpaRepository<Order, Long>{
	@Query("Select o From Order o Where o.customer_o.id=?1")
	Page<Order> findByCustomerId(Long id,Pageable pageable);
	
	@Query("Select o From Order o Where o.customer_o.id like %?1%")
	Page<Order> findAllByOrderIdLike(String id,Pageable pageable);
	
	@Query("Select o From Order o Where o.paymentmethod.id=?1")
	Page<Order> findByPaymentmethodId(Long id,Pageable pageable);
	
	@Query("Select o From Order o Where o.paymentmethod.id=?1 and o.paymentmethod.id=?2")
	Page<Order> findByCustomerIdAndPaymentmethodId(Long customerId , Long paymentmethodId,Pageable pageable);
	
	
	@Query("Select o From Order o Where o.is_display=?1")
	Page<Order> findByDisplayStatus(Boolean isDisplay,Pageable pageable);
	
	@Query("Select o From Order o Where o.status=?1")
	Page<Order> findByOrderStatus(int status,Pageable pageable);
	
	@Query("Select o From Order o Where o.is_watched=?2")
	Page<Order> findByWatchStatus(Boolean isWatched,Pageable pageable);
	
	@Query("Select o From Order o Where o.shipped_address LIKE %?1% or o.shipped_phone LIKE %?1%")
	List<Order> findByFilter(String keyword);
	/*
	 * @Query("Select o From Order o Where " +
	 * "o.is_display=?1 and o.status=?2 and o.is_watched=?3") Page<Order>
	 * findByAllStatus(boolean isDisplay,int status,boolean
	 * isWatched);
	 */
}
