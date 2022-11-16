package com.foodstore.service;


import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Image;


@Service
public interface ImageService extends IService<Image> {
	Page<Image> findByFoodId(Long id,Pageable pageable);
	
	Page<Image> findByKeyword(String keyword,Pageable pageable);
	
	Page<Image> findByFilter(String keyword , Optional<Long> foodId ,Pageable pageable);
}
