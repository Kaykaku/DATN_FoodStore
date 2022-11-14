package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.PhoneAddress;


@Repository
public interface PhoneAddressDAO extends JpaRepository<PhoneAddress, Long>{

}
