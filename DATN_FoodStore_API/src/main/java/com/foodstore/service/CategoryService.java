package com.foodstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Category;

@Service
public interface CategoryService extends IService<Category> {

	List<Category> getByIsDisPlay();

	Page<Category> getByIsDisplay(Pageable pageable) throws Exception;

	Page<Category> getByKeyword(String keyword, Pageable pageable) throws Exception;


	void deleteLogical(Long id) throws Exception;
	
	Page<Category> getByFilter(String keyword ,Optional<Long> create_date ,Optional<Long> create_by,Optional<Boolean> is_display ,Optional<Integer> type ,Pageable pageable);
}
