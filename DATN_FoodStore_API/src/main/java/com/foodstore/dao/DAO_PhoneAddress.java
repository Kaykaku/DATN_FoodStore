package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.PhoneAddress;


@Repository
public interface DAO_PhoneAddress extends JpaRepository<PhoneAddress, Long>{

}
