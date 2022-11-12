package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Permission;


@Repository
public interface DAO_Permission extends JpaRepository<Permission, Long>{

}
