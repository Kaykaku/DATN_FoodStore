package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.CategoryFood;


@Service
public interface CategoryFoodService extends IService<CategoryFood> {
	Page<CategoryFood> getByCategoryId(Pageable pageable,Long id);
	
	Page<CategoryFood> getByFoodId(Pageable pageable,Long id);
	
	CategoryFood getByCategoryIdAndFoodId(Long categoryId ,Long foodId);
}
