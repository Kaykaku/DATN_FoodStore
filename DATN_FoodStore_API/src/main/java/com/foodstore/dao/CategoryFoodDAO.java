package com.foodstore.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.CategoryFood;

@Repository
public interface CategoryFoodDAO extends JpaRepository<CategoryFood, Long>{
	@Query("Select c From CategoryFood c Where c.category_f.id=?1")
	Page<CategoryFood> findByCategoryId(Long id,Pageable pageable);
	
	@Query("Select c From CategoryFood c Where c.food_c.id=?1")
	Page<CategoryFood> findByFoodId(Long id,Pageable pageable);
	
	@Query("Select c From CategoryFood c Where c.category_f.id=?1 and c.food_c.id=?2")
	Optional<CategoryFood> findByCategoryIdAndFoodId(Long categoryId ,Long foodId);
}
