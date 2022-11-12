package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Role;


@Repository
public interface DAO_Role extends JpaRepository<Role, Long>{

}
