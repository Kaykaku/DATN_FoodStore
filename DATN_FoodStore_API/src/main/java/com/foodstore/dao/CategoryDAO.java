package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Category;

@Repository
public interface CategoryDAO extends JpaRepository<Category, Long> {

	@Query("SELECT c FROM Category c WHERE c.is_display = ?1")
	List<Category> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT c FROM Category c WHERE c.is_display = ?1")
	Page<Category> findByIsDisplay(Boolean isDisplay, Pageable pageable);

	@Query("SELECT c FROM Category c WHERE CONCAT(c.name, c.display_name) LIKE %?1% AND c.is_display = ?2")
	Page<Category> findByKeyword(String keyword, Boolean isDisplay, Pageable pageable);

}
