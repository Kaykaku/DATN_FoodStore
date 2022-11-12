package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.CustomerCoupon;


@Repository
public interface DAO_CustomerCoupon extends JpaRepository<CustomerCoupon, Long>{

}
