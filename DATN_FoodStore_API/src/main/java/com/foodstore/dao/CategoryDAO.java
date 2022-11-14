package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Category;

@Repository
public interface CategoryDAO extends JpaRepository<Category, Long> {

	List<Category> findByIsDisplay(Boolean isDisplay);

	Page<Category> findByIsDisplay(Boolean isDisplay, Pageable pageable);

}
