package com.foodstore.service;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.Image;


@Service
public interface ImageService extends IService<Image> {
	Page<Image> getByFoodId(Long id,Pageable pageable);
	
	Page<Image> getByKeyword(String keyword,Pageable pageable);
	
	Page<Image> getByFilter(String keyword , Optional<Long> foodId ,Pageable pageable);
	
	List<Image> getByFilter(String keyword , Optional<Long> foodId );
}
