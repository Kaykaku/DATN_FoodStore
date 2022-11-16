package com.foodstore.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.model.transaction.FoodCoupon;


@Repository
public interface FoodCouponDAO extends JpaRepository<FoodCoupon, Long>{
	@Query("Select f From FoodCoupon f Where f.food_cp.id=?1")
	Page<FoodCoupon> findByFoodId(Long id,Pageable pageable);
	
	@Query("Select f From FoodCoupon f Where f.coupon_f.id=?1")
	Page<FoodCoupon> findByCouponId(Long id,Pageable pageable);
	
	@Query("Select f From FoodCoupon f Where f.status=?1")
	Page<FoodCoupon> findByStatus(int status,Pageable pageable);
	
	@Query("Select f From FoodCoupon f Where f.food_cp.id=?1 and f.coupon_f.id=?2")
	Optional<CustomerCoupon> findByFoodIdAndCouponId(Long foodId ,Long couponId);
}
