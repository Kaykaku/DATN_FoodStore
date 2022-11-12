package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.FoodCoupon;


@Repository
public interface FoodCouponDAO extends JpaRepository<FoodCoupon, Long>{

}
