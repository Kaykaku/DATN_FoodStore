package com.foodstore.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.CustomerCoupon;


@Repository
public interface CustomerCouponDAO extends JpaRepository<CustomerCoupon, Long>{
	@Query("Select c From CustomerCoupon c Where c.customer_cp.id=?1")
	Page<CustomerCoupon> findByCustomerId(Long id,Pageable pageable);
	
	@Query("Select c From CustomerCoupon c Where c.coupon_c.id=?1")
	Page<CustomerCoupon> findByCouponId(Long id,Pageable pageable);
	
	@Query("Select c From CustomerCoupon c Where c.status=?1")
	Page<CustomerCoupon> findByStatus(int status,Pageable pageable);
	
	@Query("Select c From CustomerCoupon c Where c.customer_cp.id=?1 and c.coupon_c.id=?2")
	Optional<CustomerCoupon> findByCustomerIdAndCouponId(Long customerId ,Long couponId);
}
