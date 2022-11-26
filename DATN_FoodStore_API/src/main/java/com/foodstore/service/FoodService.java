package com.foodstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Food;

@Service
public interface FoodService extends IService<Food> {

	List<Food> getByIsDisplayAndQuantity();

	Page<Food> getByIsDisplayAndQuantity(Pageable pageable) throws Exception;

	Page<Food> getByKeyword(String keyword, Pageable pageable);
	
	List<Food> getByKeyword(String keyword);
	
	List<Food> getByKeywordEng(String keyword);

	void deleteLogical(Long id) throws Exception;
	
	Page<Food> getNewProduct(Pageable pageable);
	
	Page<Food> getTopNewProducts (Pageable pageable);
	
	Page<Food> getTopDiscountProducts (Pageable pageable);
	
	Page<Food> getTopSalerProducts (Pageable pageable);
	
	Page<Food> getTopFavoriteProducts (Pageable pageable); 	
	
	Page<Food> getTopViewProducts (Pageable pageable); 	
	
	Page<Food> getByFilter( String keyword , Optional<Double> priceMin , Optional<Double> priceMax , Optional<Integer> quantity , Optional<Integer> view , Optional<Long> createDate , Optional<Integer> status , Optional<Boolean> isDisplay , Optional<Long> category_id ,Pageable pageable);

	List<Food> getByFilter( String keyword , Optional<Double> priceMin , Optional<Double> priceMax , Optional<Integer> quantity , Optional<Integer> view , Optional<Long> createDate , Optional<Integer> status , Optional<Boolean> isDisplay , Optional<Long> category_id  );
	
	Page<Food> findByCategoryName(String name, Pageable pageable);
}
