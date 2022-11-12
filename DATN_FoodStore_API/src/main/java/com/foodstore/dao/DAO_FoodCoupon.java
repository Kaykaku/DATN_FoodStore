package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.FoodCoupon;


@Repository
public interface DAO_FoodCoupon extends JpaRepository<FoodCoupon, Long>{

}
