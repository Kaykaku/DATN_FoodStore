package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.UserRole;


@Repository
public interface DAO_UserRole extends JpaRepository<UserRole, Long>{

}
