package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Review;


@Service
public interface ReviewService extends IService<Review> {
	Page<Review> getByFoodId(Long id,Pageable pageable);
	
	Page<Review> getByCustomerId(Long id,Pageable pageable);
	
	//Review getByCustomerIdAndFoodId( Long customerId,Long foodId ,Pageable pageable);
	
//	Page<Review> getByAllStatus(int status ,boolean isFavorite ,boolean isDisplay,Pageable pageable);
}
