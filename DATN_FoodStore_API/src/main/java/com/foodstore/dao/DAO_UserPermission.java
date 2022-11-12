package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.UserPermission;


@Repository
public interface DAO_UserPermission extends JpaRepository<UserPermission, Long>{

}
