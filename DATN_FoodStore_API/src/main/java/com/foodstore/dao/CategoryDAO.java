package com.foodstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Category;


@Repository
public interface CategoryDAO extends JpaRepository<Category, Long>{

}
