package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Discount;


@Repository
public interface DiscountDAO extends JpaRepository<Discount, Long>{

}
