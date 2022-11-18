package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Food;

@Service
public interface FoodService extends IService<Food> {

	List<Food> getByIsDisplayAndQuantity();

	Page<Food> getByIsDisplayAndQuantity(Pageable pageable) throws Exception;

	Page<Food> getByKeyword(String keyword, Pageable pageable) throws Exception;

	void deleteLogical(Long id) throws Exception;
	
	Page<Food> getNewProduct(Pageable pageable);
}
