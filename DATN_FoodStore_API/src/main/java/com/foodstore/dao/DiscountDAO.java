package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Comment;
import com.foodstore.model.extend.Discount;


@Repository
public interface DiscountDAO extends JpaRepository<Discount, Long>{
	@Query("Select c From Discount c Where c.food_d.id=?1")
	Page<Discount> findByFoodId(Pageable pageable,Long id);
	
	@Query("Select c From Discount c"
			+ " Where c.name like %?1%")
	Page<Comment> findByKeyword(Pageable pageable,String keyword);
	
	@Query("Select c From Discount c"
			+ " Where c.name like %?1%")
	List<Comment> findByKeyword(String keyword);
}
