package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.CustomerCoupon;


@Service
public interface CustomerCouponService extends IService<CustomerCoupon> {
	Page<CustomerCoupon> getByCustomerId(Pageable pageable,Long id);
	
	Page<CustomerCoupon> getByCouponId(Pageable pageable,Long id);
	
	Page<CustomerCoupon> getByStatus(Pageable pageable,int status);
	
	CustomerCoupon getByCustomerIdAndCouponId(Long customerId ,Long couponId);
}
