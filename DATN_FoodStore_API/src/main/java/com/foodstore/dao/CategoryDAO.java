package com.foodstore.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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
	
	@Query("SELECT c FROM Category c WHERE c.name LIKE %?1% "
			+ "or c.display_name LIKE %?1% or c.description LIKE %?1% ")
	List<Category> findByKeyword(String keyword);
	
	@Query("SELECT c FROM Category c WHERE c.name = ?1 ")
	Optional<Category> findByName(String keyword);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Category c SET c.is_display = ?1 WHERE c.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);
}
