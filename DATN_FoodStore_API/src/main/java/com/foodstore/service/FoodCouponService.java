package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.model.transaction.FoodCoupon;


@Service
public interface FoodCouponService extends IService<FoodCoupon> {
	Page<FoodCoupon> getByFoodId(Long id,Pageable pageable);
	
	Page<FoodCoupon> getByCouponId(Long id,Pageable pageable);
	
	Page<FoodCoupon> getByStatus(int status,Pageable pageable);
	
	CustomerCoupon getByFoodIdAndCouponId(Long foodId ,Long couponId);
}
