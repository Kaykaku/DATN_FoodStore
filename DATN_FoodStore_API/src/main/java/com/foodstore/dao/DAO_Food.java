package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Food;


@Repository
public interface DAO_Food extends JpaRepository<Food, Long>{

}
