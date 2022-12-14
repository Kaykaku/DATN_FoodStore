package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Coupon;


@Repository
public interface CouponDAO extends JpaRepository<Coupon, Long>{

}
