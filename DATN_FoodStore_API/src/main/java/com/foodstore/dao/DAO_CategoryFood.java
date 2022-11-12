package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.CategoryFood;


@Repository
public interface DAO_CategoryFood extends JpaRepository<CategoryFood, Long>{

}
