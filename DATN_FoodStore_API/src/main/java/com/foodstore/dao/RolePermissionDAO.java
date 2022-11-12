package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.RolePermission;


@Repository
public interface RolePermissionDAO extends JpaRepository<RolePermission, Long>{

}
