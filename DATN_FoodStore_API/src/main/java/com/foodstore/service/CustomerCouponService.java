package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.CustomerCoupon;


@Service
public interface CustomerCouponService extends IService<CustomerCoupon> {
	Page<CustomerCoupon> getByCustomerId(Long id,Pageable pageable);
	
	Page<CustomerCoupon> getByCouponId(Long id,Pageable pageable);
	
	Page<CustomerCoupon> getByStatus(int status,Pageable pageable);
	
	CustomerCoupon getByCustomerIdAndCouponId(Long customerId ,Long couponId);
}
