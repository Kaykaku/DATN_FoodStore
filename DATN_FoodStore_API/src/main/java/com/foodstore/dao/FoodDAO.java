package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Food;

@Repository
public interface FoodDAO extends JpaRepository<Food, Long> {

	@Query("SELECT f FROM Food f WHERE f.is_display = ?1 AND f.quantity_limit > ?2")
	List<Food> findByIsDisplayAndQuantity(Boolean isDisplay, Integer quantityLimit);

	@Query("SELECT f FROM Food f WHERE f.is_display = ?1 AND f.quantity_limit > ?2")
	Page<Food> findByIsDisplayAndQuantity(Boolean isDisplay, Integer quantityLimit, Pageable pageable);

	@Query("SELECT f FROM Food f WHERE f.name "
			+ "LIKE %?1% AND f.is_display = ?2 AND f.quantity_limit > ?3")
	Page<Food> findByKeyword(String keyword, Boolean isDisplay, Integer quantityLimit, Pageable pageable);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE Food f SET f.is_display = ?1 WHERE f.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);
}
