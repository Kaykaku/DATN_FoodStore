package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.Order;


@Repository
public interface DAO_Order extends JpaRepository<Order, Long>{

}
