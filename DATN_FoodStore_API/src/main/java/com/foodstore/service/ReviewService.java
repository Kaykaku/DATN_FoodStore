package com.foodstore.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Review;


@Service
public interface ReviewService extends IService<Review> {
	Page<Review> getByFoodId(Long id,Pageable pageable);
	
	List<Review> getByFoodId(Long id);
	
	Page<Review> getByCustomerId(Long id,Pageable pageable);
	
	List<Review> getByCustomerId(Long id);
	
	double getAverageRating(Long foodId);
	
	Map<Integer,Integer> getStatictisRating(Long foodId);
	
	Review getByCustomerIdAndFoodId( Long customerId,Long foodId );
	
//	Page<Review> getByAllStatus(int status ,boolean isFavorite ,boolean isDisplay,Pageable pageable);
}
