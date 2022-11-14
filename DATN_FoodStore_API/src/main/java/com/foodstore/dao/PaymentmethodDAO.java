package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Paymentmethod;


@Repository
public interface PaymentmethodDAO extends JpaRepository<Paymentmethod, Long>{

}
