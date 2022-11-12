package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.User;


@Repository
public interface DAO_User extends JpaRepository<User, Long>{

}
