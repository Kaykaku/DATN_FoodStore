package com.foodstore.service;

import java.sql.Date;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Discount;


@Service
public interface DiscountService extends IService<Discount> {
	Page<Discount> getByFoodId(Pageable pageable,Long id);
	
	Page<Discount> getByKeyword(Pageable pageable,String keyword);
	
	Page<Discount> getByFilter(Pageable pageable,String keyword 
			,Optional<Boolean> is_fixed , Optional<Date> start_date , Optional<Date> end_date 
			, Optional<Boolean> isDisplay , Optional<Long> userId);
}
