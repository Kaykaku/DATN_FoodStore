package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Review;


@Service
public interface ReviewService extends IService<Review> {
	Page<Review> getByFoodId(Pageable pageable,Long id);
	
	Page<Review> getByCustomerId(Pageable pageable,Long id);
	
	Review getByCustomerIdAndFoodId(Pageable pageable, Long customerId,Long foodId );
	
//	Page<Review> getByAllStatus(Pageable pageable,int status ,boolean isFavorite ,boolean isDisplay);
}
