package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.extend.Image;


@Repository
public interface ImageDAO extends JpaRepository<Image, Long>{
	@Query("Select o From Image o Where o.food_i.id=?1")
	Page<Image> findByFoodId(Long id,Pageable pageable);
	
	@Query("Select o From Image o"
			+ " Where o.image_name like %?1%")
	Page<Image> findByKeyword(String keyword,Pageable pageable);
	
	@Query("Select o From Image o"
			+ " Where o.image_name like %?1%")
	List<Image> findByKeyword(String keyword);
}
