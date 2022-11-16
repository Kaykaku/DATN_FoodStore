package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.CategoryFood;


@Service
public interface CategoryFoodService extends IService<CategoryFood> {
	Page<CategoryFood> getByCategoryId(Long id,Pageable pageable);
	
	Page<CategoryFood> getByFoodId(Long id,Pageable pageable);
	
	CategoryFood getByCategoryIdAndFoodId(Long categoryId ,Long foodId);
}
