package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.UserRole;


@Repository
public interface UserRoleDAO extends JpaRepository<UserRole, Long>{

}
