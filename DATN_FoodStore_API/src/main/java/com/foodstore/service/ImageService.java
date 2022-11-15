package com.foodstore.service;


import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Image;


@Service
public interface ImageService extends IService<Image> {
	Page<Image> findByFoodId(Pageable pageable,Long id);
	
	Page<Image> findByKeyword(Pageable pageable,String keyword);
	
	Page<Image> findByFilter(Pageable pageable,String keyword , Optional<Long> foodId );
}
