package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.model.transaction.FoodCoupon;


@Service
public interface FoodCouponService extends IService<FoodCoupon> {
	Page<FoodCoupon> getByFoodId(Pageable pageable,Long id);
	
	Page<FoodCoupon> getByCouponId(Pageable pageable,Long id);
	
	Page<FoodCoupon> getByStatus(Pageable pageable,int status);
	
	CustomerCoupon getByFoodIdAndCouponId(Long foodId ,Long couponId);
}
