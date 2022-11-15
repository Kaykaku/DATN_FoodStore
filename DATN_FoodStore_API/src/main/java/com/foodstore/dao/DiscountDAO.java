package com.foodstore.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Discount;


@Repository
public interface DiscountDAO extends JpaRepository<Discount, Long>{
	@Query("Select c From Discount c Where c.food_d.id=?1")
	Page<Discount> findByFoodId(Pageable pageable,Long id);
	
	@Query("Select c From Discount c"
			+ " Where c.name like %?1%")
	Page<Discount> findByKeyword(Pageable pageable,String keyword);
	
	@Query("Select c From Discount c"
			+ " Where c.name like %?1%")
	List<Discount> findByKeyword(String keyword);
	
	@Query("Select c From Discount c"
			+ " Where c.name like %?1% && c.is_display = ?2")
	Page<Discount> findByDisplayStatus(Pageable pageable,String keyword , boolean displayStatus);
	
	@Query("Select c From Discount c"
			+ " Where c.name like %?1% && c.is_display = ?2")
	List<Discount> findByDisplayStatus(String keyword , boolean displayStatus);
}
