package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Customer;


@Repository
public interface DAO_Customer extends JpaRepository<Customer, Long>{

}
