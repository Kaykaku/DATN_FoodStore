package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.OrderDetail;


@Repository
public interface DAO_OrderDetail extends JpaRepository<OrderDetail, Long>{

}
