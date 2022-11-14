package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Category;


@Service
public interface CategoryService extends IService<Category> {
	
	List<Category> getByIsDisPlay();
	
	Page<Category> getByIsDisplay(int pageSize, int pageNumber)throws Exception;
}
