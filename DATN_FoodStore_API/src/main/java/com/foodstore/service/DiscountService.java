package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Comment;
import com.foodstore.model.extend.Discount;


@Service
public interface DiscountService extends IService<Discount> {
	Page<Discount> getByFoodId(Pageable pageable,Long id);
	
	Page<Comment> getByKeyword(Pageable pageable,String keyword);
	
	List<Comment> getByKeyword(String keyword);
}
